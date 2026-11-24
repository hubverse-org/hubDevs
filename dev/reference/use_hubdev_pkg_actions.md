# Add standard GitHub Actions workflows

Writes GitHub Action workflows to the `.github/workflows` directory for:

- standard R CMD CHECK
  [(`check-standard`)](https://github.com/r-lib/actions/blob/v2-branch/examples/check-standard.yaml)

- test coverage
  [(`test-coverage`)](https://github.com/hubverse-org/hubverse-developer-actions/tree/main/test-coverage),
  which uploads coverage to Codecov with OIDC instead of a stored token.
  A Codecov badge is added to the README.

- linting with `lintr`
  [(`lint`)](https://github.com/r-lib/actions/blob/v2-branch/examples/lint.yaml)

- Air format checking
  [(`format-check`)](https://github.com/posit-dev/setup-air/blob/main/examples/format-check.yaml)

## Usage

``` r
use_hubdev_pkg_actions()
```
