#' Create a basic hubverse README.Rmd from template
#'
#' @inheritParams create_hubdev_pkg
#' @export
use_hubdev_readme <- function(
    organisation = "hubverse-org",
    hubdocs_contribute_url = "https://hubdocs.readthedocs.io/en/latest/overview/contribute.html") {
  rlang::check_installed("rmarkdown")

  data <- list(
    pkgname = get_pkgname(),
    organisation = organisation,
    hubdocs_contribute_url = hubdocs_contribute_url
  )

  usethis::use_template(
    "package-README",
    "README.Rmd",
    data = data,
    ignore = TRUE,
    open = FALSE,
    package = "hubDevs"
  )

  usethis::use_lifecycle_badge("experimental")
  usethis::use_cran_badge()
  devtools::build_readme()
}
