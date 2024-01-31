#' Add standard GitHub Actions workflows
#'
#' Downloads standard r-lib GitHub Action workflows and writes them to the
#' `.github/workflows` directory for:
#'    - standard R CMD CHECK [(`check-standard`)](
#' https://github.com/r-lib/actions/blob/v2-branch/examples/check-standard.yaml)
#'    - test coverage [(`test-coverage`)](https://github.com/r-lib/actions/blob/v2-branch/examples/test-coverage.yaml)
#'    - linting with `lintr` [(`lint`)](https://github.com/r-lib/actions/blob/v2-branch/examples/lint.yaml)
#'
#' @export
use_hubdev_pkg_actions <- function() {
  usethis::use_github_action("check-standard")
  usethis::use_github_action("test-coverage")
  usethis::use_github_action("lint")
}
