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
