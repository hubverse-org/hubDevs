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

# Update a description field
# Source: https://github.com/r-lib/usethis/blob/a795b743a49bf18975dfad2cf6c8a3b918015cb8/R/proj-desc.R#L32
proj_desc_field_update <- function(key, value, overwrite = TRUE, append = FALSE) {
  checkmate::assert_character(key, len = 1L)
  checkmate::assert_character(value)
  checkmate::assert_logical(overwrite, len = 1L)
  checkmate::assert_logical(append, len = 1L)

  desc <- desc::desc(file = usethis::proj_get())
  old <- desc$get_list(key, default = "")
  if (all(value %in% old)) {
    return(invisible())
  }
  if (!overwrite && length(old > 0) && any(old != "")) {
    usethis::ui_stop("{usethis::ui_field(key)} has a different value in DESCRIPTION. \\\n
                     Use {usethis::ui_code('overwrite = TRUE')} to overwrite.")
  }
  usethis::ui_done("Adding {usethis::ui_value(value)} to {usethis::ui_field(key)}")
  if (append) {
    value <- union(old, value)
  }
  desc$set_list(key, value)
  desc$write()
  invisible()
}
