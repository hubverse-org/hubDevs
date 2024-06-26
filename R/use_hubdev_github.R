#' Set up hubverse package on GitHub
#'
#' The function runs a number of internal utilities for setting up a hubverse package on GitHub:
#' - Creates a repo in the hubverse GitHub organisation
#' - Adds details of the repository to the DESCRIPTION file
#' - Initailises pkgdown documentation
#' - Creates GitHub Action workflows for:
#'    - standard R CMD CHECK
#'    - test coverage
#'    - linting with `lintr`
#'    - building pkgdown documentation and deploying production docs to GitHub Pages
#'      and PR previews to a Netlify site
#' @inheritParams create_hubdev_pkg
#'
#' @export
use_hubdev_github <- function(organisation = "hubverse-org") {
  usethis::use_github(organisation = organisation)

  # Create standard GitHub Actions workflows
  use_hubdev_pkg_actions()

  # Set up hubverse pkgdown
  use_hubdev_pkgdown()
}
