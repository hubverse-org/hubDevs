# Set up hubverse package on GitHub

The function runs a number of internal utilities for setting up a
hubverse package on GitHub:

- Creates a repo in the hubverse GitHub organisation

- Adds details of the repository to the DESCRIPTION file

- Initailises pkgdown documentation

- Creates GitHub Action workflows for:

  - standard R CMD CHECK

  - test coverage

  - linting with `lintr`

  - building pkgdown documentation and deploying production docs to
    GitHub Pages and PR previews to a Netlify site

## Usage

``` r
use_hubdev_github(organisation = "hubverse-org")
```

## Arguments

- organisation:

  Character string. The hubverse GitHub organisation name. The user's
  role and the token's scopes must be such that you have permission to
  create repositories in the hubverse organisation.
