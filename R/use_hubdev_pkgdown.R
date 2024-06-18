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
#'
#' @param add_logo Logical. Whether to add the logo to the package.
#'
#' @export
use_hubdev_pkgdown <- function(add_logo = FALSE) {
  usethis::use_pkgdown()
  try(usethis::use_github_pages())
  use_hubdev_pkgdown_action()

  add_website_needs()
  if (add_logo) {
    usethis::use_logo(system.file("logo.png", package = "hubStyle"))
  }
  pkgdown::build_favicons(overwrite = TRUE)

  data <- list(
    organisation = "hubverse-org",
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
