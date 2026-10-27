#' Hubverse Developer CODEOWNERS setup
#'
#' Creates the hubverse package CODEOWNERS file at `.github/CODEOWNERS`.
#'
#' @details
#' The file requires a review from the `hubverse-org/hubverse-developers` team
#' for changes to the package's GitHub Actions workflows and to the CODEOWNERS
#' file itself. GitHub enforces the review only where the default branch is
#' protected by a rule that requires review from code owners.
#'
#' @export
use_hubdev_codeowners <- function() {
  usethis::use_directory(".github", ignore = TRUE)
  usethis::use_template(
    "CODEOWNERS",
    fs::path(".github", "CODEOWNERS"),
    package = "hubDevs"
  )
}
