#' Helpers for creating community facing hubverse package documents
#'
#' These functions create community facing documents detailing how contributors
#' and the wider community can interact with hubverse packages.
#' Each function creates the relevant file in the `.github` directory from templates
#' and is set up with appropriate hubverse default values.
#'
#'
#' @inheritParams create_hubdev_pkg
#' @export
#' @describeIn use_hubdev_community Create hubverse `CODE_OF_CONDUCT.md` and `CONTRIBUTING.md` files.
use_hubdev_community <- function(
    organisation = "hubverse-org",
    hubdocs_contribute_url = "https://hubverse.io/en/latest/overview/contribute.html") {
  use_hubdev_coc()
  use_hubdev_contributing(
    organisation = organisation,
    hubdocs_contribute_url = hubdocs_contribute_url
  )
}

#' @export
#' @describeIn use_hubdev_community Create hubverse `CODE_OF_CONDUCT.md` file.
use_hubdev_coc <- function() {
  usethis::use_directory(".github", ignore = TRUE)
  usethis::use_git_ignore("*.html", directory = ".github")


  usethis::use_template(
    "CODE_OF_CONDUCT.md",
    fs::path(".github", "CODE_OF_CONDUCT.md"),
    package = "hubDevs"
  )
}

#' @inheritParams create_hubdev_pkg
#' @export
#' @describeIn use_hubdev_community Create hubverse `CONTRIBUTING.md` file.
use_hubdev_contributing <- function(
    organisation = "hubverse-org",
    hubdocs_contribute_url = "https://hubverse.io/en/latest/overview/contribute.html") {
  usethis::use_directory(".github", ignore = TRUE)
  usethis::use_git_ignore("*.html", directory = ".github")

  data <- list(
    pkgname = get_pkgname(),
    organisation = organisation,
    hubdocs_contribute_url = hubdocs_contribute_url
  )
  usethis::use_template(
    "CONTRIBUTING.md",
    fs::path(".github", "CONTRIBUTING.md"),
    data = data,
    package = "hubDevs"
  )
}
