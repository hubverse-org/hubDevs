# Configure hubverse pkgdown site

The function performs a number of actions to configure a hubverse
package's pkgdown site to use the `hubStyle` template for docs styling.

- Runs `use_pkgdown()` to initialise pkgdown documentation.

- Runs `use_github_pages()` to initialise GitHub Pages for the package.

- Adds a GitHub Action workflow for building pkgdown documentation and
  deploying to GitHub Pages (productions) and Netlify (PR previews)
  using
  [`use_hubdev_pkgdown_action()`](https://hubverse-org.github.io/hubDevs/reference/use_hubdev_pkgdown_action.md).

- Adds the `hubStyle` repository to the `DESCRIPTION`'s
  `Config/Needs/website` property using
  [`add_website_needs()`](https://hubverse-org.github.io/hubDevs/reference/add_website_needs.md).

- Creates a favicon for the package using the `hubStyle` logo.

- Overwrites standard `_pkgdown.yml` file with customised configuration
  to use the hubverse `hubStyle` package for docs styling.

## Usage

``` r
use_hubdev_pkgdown(add_logo = FALSE)
```

## Arguments

- add_logo:

  Logical. Whether to add the logo to the package.
