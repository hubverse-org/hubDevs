# Create a basic hubverse README.Rmd from template

Create a basic hubverse README.Rmd from template

## Usage

``` r
use_hubdev_readme(
  organisation = "hubverse-org",
  hubdocs_contribute_url = "https://hubverse.io/community/",
  build = TRUE
)
```

## Arguments

- organisation:

  Character string. The hubverse GitHub organisation name. The user's
  role and the token's scopes must be such that you have permission to
  create repositories in the hubverse organisation.

- hubdocs_contribute_url:

  Character string. URL of the general contributing information page on
  hubDocs.

- build:

  Logical. Whether to build the README.md from README.Rmd. Defaults to
  `TRUE`.
