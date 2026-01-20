# Changelog

## hubDevs (development version)

## hubDevs 1.0.0

- First stable release of hubDevs.
- [`create_hubdev_pkg()`](https://hubverse-org.github.io/hubDevs/dev/reference/create_hubdev_pkg.md)
  now sets up Air formatting via
  [`usethis::use_air()`](https://usethis.r-lib.org/reference/use_air.html)
  ([\#48](https://github.com/hubverse-org/hubDevs/issues/48)).
- [`use_hubdev_pkg_actions()`](https://hubverse-org.github.io/hubDevs/dev/reference/use_hubdev_pkg_actions.md)
  now includes the `format-check` workflow for Air formatting CI
  ([\#48](https://github.com/hubverse-org/hubDevs/issues/48)).
- Remove Hubverse release process overview vignettes (that information
  has moved to the [Hubverse
  documentation](https://docs.hubverse.io/en/latest/developer/)).

## hubDevs 0.1.1

- README template now includes release and development version
  instructions and documentation sites
  ([\#12](https://github.com/hubverse-org/hubDevs/issues/12),
  [\#18](https://github.com/hubverse-org/hubDevs/issues/18))
- README now includes instructions for confirming your GitHub PAT exists
  and is available in R.
- Updated hotfix vignette to use a hubverse-specific scenario
  ([\#20](https://github.com/hubverse-org/hubDevs/issues/20))

## hubDevs 0.1.0

- New vignettes to describe the release process
  ([\#11](https://github.com/hubverse-org/hubDevs/issues/11) and
  [\#15](https://github.com/hubverse-org/hubDevs/issues/15))

## hubDevs 0.0.0.9004

- Fixed bug in README template the was requiring a `svg` logo instead of
  a `png` logo.

## hubDevs 0.0.0.9003

- Added functionality to
  [`use_hubdev_pkgdown()`](https://hubverse-org.github.io/hubDevs/dev/reference/use_hubdev_pkgdown.md)
  to enable smooth transition of package docs to `hubStyle` theme.
- Added
  [`append_hubdev_readme_footer()`](https://hubverse-org.github.io/hubDevs/dev/reference/append_hubdev_readme_footer.md)
  to append the standard hubverse footer to the README.md file.
