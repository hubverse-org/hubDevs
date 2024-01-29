#' Configure hubverse pkgdown site
#'
#' The function performs a number of actions to configure a hubverse package's
#' pkgdown site to use the `hubStyle` template for docs styling.
#' - Runs [`use_pkgdown()`] to initialise pkgdown documentation.
#' - Runs [`use_github_pages()`] to initialise GitHub Pages for the package.
#' - Adds a GitHub Action workflow for building pkgdown documentation and deploying
#' to GitHub Pages (productions) and Netlify (PR previews) using
#' `use_hubdev_pkgdown_action()`.
#' - Adds the `hubStyle` repository to the `DESCRIPTION`'s
#' `Config/Needs/website` property using `add_website_needs()`.
#' - Creates a favicon for the package using the `hubStyle` logo.
#' - Overwrites standard `_pkgdown.yml` file with customised configuration to
#'   use the hubverse `hubStyle` package for docs styling.
#' @export
use_hubdev_pkgdown <- function() {
  usethis::use_pkgdown()
  try(usethis::use_github_pages())
  use_hubdev_pkgdown_action()

  add_website_needs()
  pkgdown::build_favicons()

  data <- list(
    organisation = "infectious-disease-modeling-hubs",
    pkgname = get_pkgname()
  )

  usethis::use_template(
    "_pkgdown.yml",
    "_pkgdown.yml",
    data = data,
    ignore = TRUE,
    open = FALSE,
    package = "hubDevs"
  )
}
