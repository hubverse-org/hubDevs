# All functions adapted from internal usethis pkg functions
# Render the contents of a template
# Source: https://github.com/r-lib/usethis/blob/3eb5a82f81558733c64ae367b562d1a5d554245f/R/template.R#L60
render_template <- function(template, data = list(), package = "usethis") {
  template_path <- find_template(template, package = package)
  strsplit(
    whisker::whisker.render(
      readLines(template_path, n = -1L, encoding = "UTF-8", warn = FALSE),
      data
    ), "\n"
  )[[1]]
}

# Get a template path
# Source: https://github.com/r-lib/usethis/blob/3eb5a82f81558733c64ae367b562d1a5d554245f/R/template.R#L65
find_template <- function(template_name, package = "usethis") {
  rlang::check_installed(package)
  path <- tryCatch(fs::path_package(
    package = package,
    "templates",
    template_name
  ), error = function(e) "")
  if (identical(path, "")) {
    cli::cli_abort("Could not find template {.val {template_name}} in package {.pkg {package}}.")
  }
  path
}


uses_git <- function () {
  repo <- tryCatch(gert::git_find(usethis::proj_get()), error = function(e) NULL)
  !is.null(repo)
}

git_status <- function(untracked) {
  checkmate::assert_logical(untracked,  len = 1L)

  st <- gert::git_status(repo = proj_get())
  if (!untracked) {
    st <- st[st$status != "new", ]
  }
  st
}

# Commit -----------------------------------------------------------------------
git_ask_commit <- function(message, untracked, push = FALSE, paths = NULL) {
  if (!is_interactive() || !uses_git()) {
    return(invisible())
  }

  # this is defined here to encourage all commits to route through this function
  git_commit <- function(paths, message) {
    repo <- usethis::proj_get()
    usethis::ui_done("Adding files")
    gert::git_add(paths, repo = repo)
    usethis::ui_done("Making a commit with message {usethis::ui_value(message)}")
    gert::git_commit(message, repo = repo)
  }

  uncommitted <- git_status(untracked)$file
  if (is.null(paths)) {
    paths <- uncommitted
  } else {
    paths <- intersect(paths, uncommitted)
  }
  n <- length(paths)
  if (n == 0) {
    return(invisible())
  }

  paths <- sort(paths)
  ui_paths <- purrr::map_chr(paths, usethis::ui_path)
  if (n > 10) {
    ui_paths <- c(ui_paths[1:10], "...")
  }

  if (n == 1) {
    file_hint <- "There is 1 uncommitted file:"
  } else {
    file_hint <- "There are {n} uncommitted files:"
  }
  usethis::ui_line(c(
    file_hint,
    paste0("* ", ui_paths)
  ))

  msg <- paste0(
    "Is it ok to commit ",
    if (push) "and push ",
    if (n == 1) 'it' else 'them',
    "?"
  )
  if (usethis::ui_yeah(msg)) {
    git_commit(paths, message)
    if (push) {
      remref <- git_branch_tracking(git_branch())

      gert::git_push(
        remote = usethis::git_remotes()$origin,
        refspec = glue("refs/heads/{branch}:refs/heads/{remref_branch(remref)}"),
        verbose = FALSE,
        repo = usethis::proj_get()
      )



    }
  }

  invisible()
}


git_branch <- function() {
  info <- gert::git_info(repo = usethis::proj_get())
  branch <- info$shorthand
  if (identical(branch, "HEAD")) {
    usethis::ui_stop("Detached head; can't continue")
  }
  if (is.na(branch)) {
    usethis::ui_stop("On an unborn branch -- do you need to make an initial commit?")
  }
  branch
}

git_branch_tracking <- function(branch = git_branch()) {
  repo <- usethis::proj_get()
  if (!gert::git_branch_exists(branch, local = TRUE, repo = repo)) {
    usethis::ui_stop("There is no local branch named {usethis::ui_value(branch)}")
  }
  gbl <- gert::git_branch_list(local = TRUE, repo = repo)
  sub("^refs/remotes/", "", gbl$upstream[gbl$name == branch])
}
