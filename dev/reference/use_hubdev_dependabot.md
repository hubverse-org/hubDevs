# Hubverse Developer Dependabot setup

Creates the hubverse package Dependabot configuration at
`.github/dependabot.yml`.

## Usage

``` r
use_hubdev_dependabot()
```

## Details

The configuration has Dependabot check the actions used by the package's
GitHub Actions workflows once a week. Updates are opened as pull
requests, with patch and minor updates grouped into one. Dependabot
reads the file from the default branch, so it takes effect once
committed there.
