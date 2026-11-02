
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

- Latest Release: <https://hubverse-org.github.io/hubDevs/>
- Stable Development Version:
  <https://hubverse-org.github.io/hubDevs/dev/>

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
#>   '/var/folders/p2/ywqk6z3n5nq3csvhfnvwfpzh0000gp/T/RtmpNbIbnY/testPkg/'.
#> ✔ Setting active project to
#>   "/private/var/folders/p2/ywqk6z3n5nq3csvhfnvwfpzh0000gp/T/RtmpNbIbnY/testPkg".
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
#> RoxygenNote: 7.3.3
#> ✔ Writing 'NAMESPACE'.
#> ✔ Writing 'testPkg.Rproj'.
#> ✔ Adding "^testPkg\\.Rproj$" to '.Rbuildignore'.
#> ✔ Adding ".Rproj.user" to '.gitignore'.
#> ✔ Adding "^\\.Rproj\\.user$" to '.Rbuildignore'.
#> ✔ Setting active project to "<no active project>".
#> ✔ Setting active project to
#>   "/private/var/folders/p2/ywqk6z3n5nq3csvhfnvwfpzh0000gp/T/RtmpNbIbnY/testPkg".
#> ✔ Adding '.DS_Store', '.Rhistory', '.Rdata', '.httr-oauth', '.secrets', '.claude', and 'claude.md' to '.gitignore' and '.Rbuildignore'
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
#> ✔ Creating '.github/'.
#> ✔ Adding "^\\.github$" to '.Rbuildignore'.
#> ✔ Adding "*.html" to '.github/.gitignore'.
#> ✔ Writing '.github/CODE_OF_CONDUCT.md'.
#> ✔ Writing '.github/CONTRIBUTING.md'.
#> ✔ Writing '.github/dependabot.yml'.
#> ✔ Writing '.github/CODEOWNERS'.
#> ✔ Creating 'air.toml'.
#> ✔ Adding "^[.]?air[.]toml$" to '.Rbuildignore'.
#> ✔ Creating '.vscode/'.
#> ✔ Adding "^\\.vscode$" to '.Rbuildignore'.
#> ✔ Creating '.vscode/settings.json'.
#> ✔ Creating '.vscode/extensions.json'.
#> ☐ Read Air's editors guide (<https://posit-dev.github.io/air/editors.html>) to
#>   learn how to invoke Air in your preferred editor.
#> ☐ Read Air's GitHub Actions guide
#>   (<https://posit-dev.github.io/air/integration-github-actions.html>) to learn
#>   about GHA workflows that continuously run formatting checks.
#> ✔ Initialising Git repo at
#>   '/private/var/folders/p2/ywqk6z3n5nq3csvhfnvwfpzh0000gp/T/RtmpNbIbnY/testPkg'.
#> ✔ Adding ".RData" and ".quarto" to '.gitignore'.
#> ✔ Writing '.git/hooks/pre-commit'.
#> ✔ Setting active project to "<no active project>".
```

This creates all basic infrastructure including a hubverse template
README, logo, community documents, Dependabot configuration, CODEOWNERS
file, MIT LICENSE and initiates the package as a git repository.

    #> /var/folders/p2/ywqk6z3n5nq3csvhfnvwfpzh0000gp/T/RtmpNbIbnY/testPkg
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
    #> │   ├── CODEOWNERS
    #> │   ├── CODE_OF_CONDUCT.md
    #> │   ├── CONTRIBUTING.md
    #> │   └── dependabot.yml
    #> ├── .gitignore
    #> ├── .vscode
    #> │   ├── extensions.json
    #> │   └── settings.json
    #> ├── DESCRIPTION
    #> ├── LICENSE
    #> ├── LICENSE.md
    #> ├── NAMESPACE
    #> ├── R
    #> ├── README.Rmd
    #> ├── README.md
    #> ├── air.toml
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

### Complete the security setup

The [hubverse security
policy](https://docs.hubverse.io/en/latest/developer/security.html)
requires two further settings once the package is on GitHub.

First commit the workflows created by `use_hubdev_github()` and push
them to the default branch. Then switch CodeQL code scanning to the
extended query suite:

``` r
use_hubdev_codeql()
```

*Note: This requires admin access to the repository.*

Finally, protect the `main` branch so that changes can only be merged
through an approved pull request. This is currently set by hand in the
repository settings.

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

### Add Dependabot and CODEOWNERS

To add the hubverse Dependabot configuration and CODEOWNERS file, run:

``` r
use_hubdev_dependabot()
use_hubdev_codeowners()
```

These create `.github/dependabot.yml` and `.github/CODEOWNERS`.
Dependabot then opens a weekly pull request to update the actions used
by the package’s workflows. CODEOWNERS requests a review from the
`hubverse-org/hubverse-developers` team on changes to the workflows.

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
Community](https://hubverse.io/community/) or [how to contribute to the
hubDevs package](.github/CONTRIBUTING.md).
