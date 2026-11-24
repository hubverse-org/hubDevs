#' Add standard GitHub Actions workflows
#'
#' Writes GitHub Action workflows to the `.github/workflows` directory for:
#'    - standard R CMD CHECK [(`check-standard`)](
#' https://github.com/r-lib/actions/blob/v2-branch/examples/check-standard.yaml)
#'    - test coverage [(`test-coverage`)](
#' https://github.com/hubverse-org/hubverse-developer-actions/tree/main/test-coverage),
#' which uploads coverage to Codecov with OIDC instead of a stored token. A
#' Codecov badge is added to the README.
#'    - linting with `lintr` [(`lint`)](
#' https://github.com/r-lib/actions/blob/v2-branch/examples/lint.yaml)
#'    - Air format checking [(`format-check`)](
#' https://github.com/posit-dev/setup-air/blob/main/examples/format-check.yaml)
#'
#' @export
use_hubdev_pkg_actions <- function() {
  usethis::use_github_action("check-standard")
  use_hubdev_github_action("test-coverage")
  use_codecov_badge()
  usethis::use_github_action("lint")
  use_hubdev_lintr()
  usethis::use_github_action(
    url = "https://github.com/posit-dev/setup-air/blob/main/examples/format-check.yaml"
  )
}

# usethis::use_github_action() adds this badge for its own test-coverage
# workflow. The hubverse workflow is downloaded as a plain file, so the badge
# is added here.
use_codecov_badge <- function() {
  repo_spec <- source_repo_spec()
  usethis::use_badge(
    "Codecov test coverage",
    href = paste0("https://app.codecov.io/gh/", repo_spec),
    src = paste0("https://codecov.io/gh/", repo_spec, "/graph/badge.svg")
  )
}
