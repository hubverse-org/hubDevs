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
use_hubdev_github <- function(organisation = "Infectious-Disease-Modeling-Hubs") {

    usethis::use_github(organisation = organisation)

    # Create standard GitHub Actions workflows
    usethis::use_github_action("check-standard")
    usethis::use_github_action("test-coverage")
    usethis::use_github_action("lint")

    # Set up pkgdown
    usethis::use_pkgdown()
    usethis::use_github_pages()
    use_hubdev_pkgdown_action()
    use_hubdev_pkgdown()

}
