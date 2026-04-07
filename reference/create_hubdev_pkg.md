# Create hubverse package skeleton

Create hubverse package skeleton

## Usage

``` r
create_hubdev_pkg(
  path,
  fields = list(),
  copyright_holder = "Consortium of Infectious Disease Modeling Hubs",
  organisation = "hubverse-org",
  hubdocs_contribute_url = "https://hubverse.io/community/",
  build = TRUE
)
```

## Arguments

- path:

  A path. If it exists, it is used. If it does not exist, it is created,
  provided that the parent path exists.

- fields:

  A named list of fields to add to `DESCRIPTION`, potentially overriding
  default values. See
  [`use_description()`](https://usethis.r-lib.org/reference/use_description.html)
  for how you can set personalized defaults using package options.

- copyright_holder:

  Name of the copyright holder or holders. This defaults to
  `"{package name} authors"`; you should only change this if you use a
  CLA to assign copyright to a single entity.

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

## Value

Path to the newly created project or package, invisibly.
