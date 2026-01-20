# Helpers for creating community facing hubverse package documents

These functions create community facing documents detailing how
contributors and the wider community can interact with hubverse
packages. Each function creates the relevant file in the `.github`
directory from templates and is set up with appropriate hubverse default
values.

## Usage

``` r
use_hubdev_community(
  organisation = "hubverse-org",
  hubdocs_contribute_url = "https://hubverse.io/community/"
)

use_hubdev_coc()

use_hubdev_contributing(
  organisation = "hubverse-org",
  hubdocs_contribute_url = "https://hubverse.io/community/"
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

## Functions

- `use_hubdev_community()`: Create hubverse `CODE_OF_CONDUCT.md` and
  `CONTRIBUTING.md` files.

- `use_hubdev_coc()`: Create hubverse `CODE_OF_CONDUCT.md` file.

- `use_hubdev_contributing()`: Create hubverse `CONTRIBUTING.md` file.
