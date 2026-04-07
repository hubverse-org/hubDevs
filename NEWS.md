# hubDevs 1.1.0

* Add `development: mode: auto` to `_pkgdown.yml` template so pkgdown builds
  dev documentation into `docs/dev/` (#54).
* Disable `indentation_linter` in `.lintr` template to avoid conflicts with Air
  formatting (#55).
* Add `build` parameter to `use_hubdev_readme()` and `create_hubdev_pkg()` to
  allow skipping `devtools::build_readme()`, fixing r-universe build failures
  (#56).

# hubDevs 1.0.0

* First stable release of hubDevs.
* `create_hubdev_pkg()` now sets up Air formatting via `usethis::use_air()` (#48).
* `use_hubdev_pkg_actions()` now includes the `format-check` workflow for Air formatting CI (#48).
* Remove Hubverse release process overview vignettes (that information has moved
  to the [Hubverse documentation](https://docs.hubverse.io/en/latest/developer/)).

# hubDevs 0.1.1

* README template now includes release and development version instructions and
  documentation sites (#12, #18)
* README now includes instructions for confirming your GitHub PAT exists and is
  available in R.
* Updated hotfix vignette to use a hubverse-specific scenario (#20)

# hubDevs 0.1.0

* New vignettes to describe the release process (#11 and #15)

# hubDevs 0.0.0.9004

* Fixed bug in README template the was requiring a `svg` logo instead of a `png` logo.

# hubDevs 0.0.0.9003

* Added functionality to `use_hubdev_pkgdown()` to enable smooth transition of package docs to `hubStyle` theme.
* Added `append_hubdev_readme_footer()` to append the standard hubverse footer to the README.md file.
