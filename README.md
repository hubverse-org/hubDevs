
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hubDevs <img src="man/figures/logo.png" align="right" height="131" alt="" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/hubDevs)](https://CRAN.R-project.org/package=hubDevs)
[![R-CMD-check](https://github.com/hubverse-org/hubDevs/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/hubverse-org/hubDevs/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The goal of hubDevs is to provide utilities for creating and
standardising Hubverse packages

## Documentation

- Latest Release: <https://https://hubverse-org.github.io/hubDevs/>
- Stable Development Version:
  <https://https://hubverse-org.github.io/hubDevs/dev/>

## Installation

### Latest

You can install the [latest version of hubDevs from the
R-universe](https://hubverse-org.r-universe.dev/hubDevs):

``` r
install.packages("hubDevs", repos = c("https://hubverse-org.r-universe.dev", "https://cloud.r-project.org"))
```

### Development

If you want to test out new features that have not yet been released,
you can install the development version of hubDevs from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("hubverse-org/hubDevs")
```

## Initialise a hubverse package

### Create a hubverse package skeleton

First create a package skeleton.

``` r
library(hubDevs)

temp_dir <- tempdir()
path <- fs::path(temp_dir, "testPkg")
create_hubdev_pkg(path)
#> ✔ Creating
#>   '/var/folders/9p/m996p3_55hjf1hc62552cqfr0000gr/T/RtmpXWBX7W/testPkg/'.
#> ✔ Setting active project to
#>   "/private/var/folders/9p/m996p3_55hjf1hc62552cqfr0000gr/T/RtmpXWBX7W/testPkg".
#> ✔ Creating 'R/'.
#> ✔ Writing 'DESCRIPTION'.
#> Package: testPkg
#> Title: What the Package Does (One Line, Title Case)
#> Version: 0.0.0.9000
#> Authors@R (parsed):
#>     * First Last <first.last@example.com> [aut, cre]
#> Description: What the package does (one paragraph).
#> License: `use_mit_license()`, `use_gpl3_license()` or friends to pick a
#>     license
#> Encoding: UTF-8
#> Roxygen: list(markdown = TRUE)
#> RoxygenNote: 7.3.2
#> ✔ Writing 'NAMESPACE'.
#> ✔ Writing 'testPkg.Rproj'.
#> ✔ Adding "^testPkg\\.Rproj$" to '.Rbuildignore'.
#> ✔ Adding ".Rproj.user" to '.gitignore'.
#> ✔ Adding "^\\.Rproj\\.user$" to '.Rbuildignore'.
#> ✔ Setting active project to "<no active project>".
#> ✔ Setting active project to
#>   "/private/var/folders/9p/m996p3_55hjf1hc62552cqfr0000gr/T/RtmpXWBX7W/testPkg".
#> ✔ Adding '.DS_Store', '.Rhistory', '.Rdata', '.httr-oauth', and '.secrets' to '.gitignore' and '.Rbuildignore'
#> ✔ Adding testthat to 'Suggests' field in DESCRIPTION.
#> ✔ Adding "3" to 'Config/testthat/edition'.
#> ✔ Creating 'tests/testthat/'.
#> ✔ Writing 'tests/testthat.R'.
#> ☐ Call `usethis::use_test()` to initialize a basic test file and open it for
#>   editing.
#> ✔ Adding "MIT + file LICENSE" to 'License'.
#> ✔ Writing 'LICENSE'.
#> ✔ Writing 'LICENSE.md'.
#> ✔ Adding "^LICENSE\\.md$" to '.Rbuildignore'.
#> ✔ Writing 'README.Rmd'.
#> ✔ Adding "^README\\.Rmd$" to '.Rbuildignore'.
#> ✔ Adding "Lifecycle: experimental badge" to 'README.Rmd'.
#> ☐ Re-knit 'README.Rmd' with `devtools::build_readme()`.
#> ✔ Adding "CRAN status badge" to 'README.Rmd'.
#> ☐ Re-knit 'README.Rmd' with `devtools::build_readme()`.
#> ℹ Installing testPkg in temporary library
#> ℹ Building
#>   '/private/var/folders/9p/m996p3_55hjf1hc62552cqfr0000gr/T/RtmpXWBX7W/testPkg/README.Rmd'
#> ✔ Creating '.github/'.
#> 
#> ✔ Adding "^\\.github$" to '.Rbuildignore'.
#> 
#> ✔ Adding "*.html" to '.github/.gitignore'.
#> 
#> ✔ Writing '.github/CODE_OF_CONDUCT.md'.
#> 
#> ✔ Writing '.github/CONTRIBUTING.md'.
#> 
#> ✔ Initialising Git repo.
#> 
#> ✔ Adding ".quarto" to '.gitignore'.
#> 
#> ✔ Writing '.git/hooks/pre-commit'.
#> 
#> ✔ Setting active project to "<no active project>".
```

This creates all basic infrastructure including a hubverse template
README, logo, community documents, MIT LICENSE and initiates the package
as a git repository.

    #> /var/folders/9p/m996p3_55hjf1hc62552cqfr0000gr/T/RtmpXWBX7W/testPkg
    #> ├── .Rbuildignore
    #> ├── .git
    #> │   ├── HEAD
    #> │   ├── config
    #> │   ├── description
    #> │   ├── hooks
    #> │   │   ├── README.sample
    #> │   │   └── pre-commit
    #> │   ├── info
    #> │   │   └── exclude
    #> │   ├── objects
    #> │   │   ├── info
    #> │   │   └── pack
    #> │   └── refs
    #> │       ├── heads
    #> │       └── tags
    #> ├── .github
    #> │   ├── .gitignore
    #> │   ├── CODE_OF_CONDUCT.md
    #> │   └── CONTRIBUTING.md
    #> ├── .gitignore
    #> ├── DESCRIPTION
    #> ├── LICENSE
    #> ├── LICENSE.md
    #> ├── NAMESPACE
    #> ├── R
    #> ├── README.Rmd
    #> ├── README.md
    #> ├── man
    #> │   └── figures
    #> │       └── logo.png
    #> ├── testPkg.Rproj
    #> └── tests
    #>     ├── testthat
    #>     └── testthat.R

### Set up package on GitHub

Before going on, ensure that you have a GitHub personal access token
(PAT) set up. Dr. Jenny Bryan provides a very good overview of how to do
this from R with the `usethis` and `gitcreds` packages:
<https://happygitwithr.com/https-pat.html>

Once the new package is launched, you can set it up on GitHub with:

``` r
use_hubdev_github()
```

*Note: Your GitHub token must have rights to create a repository in the
hubverse organisation for this to succeed.*

The function runs a number of internal utilities for setting up a
hubverse package on GitHub:

- Creates a repo in the hubverse GitHub organisation
- Adds details of the repository to the DESCRIPTION file
- Initialises pkgdown documentation including configuring site to use
  the `hubStyle` pkgdown template.
- Creates GitHub Action workflows for:
  - standard R CMD CHECK
  - test coverage
  - linting with `lintr`
  - building pkgdown documentation and deploying production docs to
    GitHub Pages and PR previews to a Netlify site

## Individual Utilities

The high level functions above are wrappers for a number of individual
utilities that can be run separately.

### Add community documents

To add a Code of Conduct and Contributing guide to your package, run:

``` r
use_hubdev_community()
```

This runs `use_hubdev_coc()` and `use_hubdev_contributing()` and creates
a `CODE_OF_CONDUCT.md` and `CONTRIBUTING.md` in the `.github/`
directory.

### Configure pkgdown site to use hubverse defaults

To configure your package site to pkgdown with the `hubStyle` template,
and deploy using the hubverse’s pkgdown deployment GitHub action run:

``` r
use_hubdev_pkgdown()
```

The function performs a number of actions to configure a hubverse
package’s pkgdown site to use the `hubStyle` template for docs styling.

- Runs `use_pkgdown()` to initialise pkgdown documentation.
- Runs `use_github_pages()` to initialise GitHub Pages for the package.
- Adds a GitHub Action workflow for building pkgdown documentation and
  deploying to GitHub Pages (productions) and Netlify (PR previews)
  using `use_hubdev_pkgdown_action()`.
- Adds the `hubStyle` repository to the `DESCRIPTION`’s
  `Config/Needs/website` property using `add_website_needs()`.
- Creates a favicon for the package using the `hubStyle` logo.
- Overwrites standard `_pkgdown.yml` file with customised configuration
  to use the hubverse `hubStyle` package for docs styling.

------------------------------------------------------------------------

## Code of Conduct

Please note that the hubDevs package is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.

## Contributing

Interested in contributing back to the open-source Hubverse project?
Learn more about how to [get involved in the Hubverse
Community](https://hubverse.io/en/latest/overview/contribute.html) or
[how to contribute to the hubDevs package](.github/CONTRIBUTING.md).
