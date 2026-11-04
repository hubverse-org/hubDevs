# Hubverse Developer CodeQL setup

Configures CodeQL code scanning on the package's GitHub repository to
use the "extended" query suite, as the hubverse security policy
requires.

## Usage

``` r
use_hubdev_codeql(repo_spec = NULL)
```

## Arguments

- repo_spec:

  Character string. The repository as `"owner/repo"`. Defaults to the
  repository of the active project's `upstream` remote, or its `origin`
  remote when there is no `upstream`. In a fork checkout, `upstream` is
  the hubverse-org repository.

## Value

The GitHub API response, invisibly. Called for its side effect.

## Details

CodeQL default setup is enabled by default for public repositories in
the hubverse GitHub organisation. Its "default" query suite does not
detect third-party actions that are not pinned to a commit SHA. The
"extended" suite does.

CodeQL does not analyse R, so in a package it scans only the GitHub
Actions workflows. Run this function once the workflows are on the
default branch. Changing the code scanning configuration requires admin
access to the repository.
