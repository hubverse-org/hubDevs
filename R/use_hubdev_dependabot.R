#' Hubverse Developer Dependabot setup
#'
#' Creates the hubverse package Dependabot configuration at
#' `.github/dependabot.yml`.
#'
#' @details
#' The configuration has Dependabot check the actions used by the package's
#' GitHub Actions workflows once a week. Updates are opened as pull requests,
#' with patch and minor updates grouped into one. Dependabot reads the file from
#' the default branch, so it takes effect once committed there.
#'
#' @export
use_hubdev_dependabot <- function() {
  usethis::use_directory(".github", ignore = TRUE)
  usethis::use_template(
    "dependabot.yml",
    fs::path(".github", "dependabot.yml"),
    package = "hubDevs"
  )
}
