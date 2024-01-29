#' Add hubverse _pkgdown.yml
#'
#' Adds a customised _pkgdown.yml file to the package root directory configured to
#' use the hubverse hubStyle package for docs styling.
#' @export
use_hubdev_pkgdown <- function() {
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
