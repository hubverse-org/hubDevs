test_that("use_hubdev_github_action downloads from the latest release", {
  local_mocked_bindings(
    latest_release = function() "v9.9.9",
    use_github_file = function(...) list(...)
  )
  withr::local_dir(withr::local_tempdir())
  usethis::local_project(getwd(), force = TRUE, quiet = TRUE)

  args <- use_hubdev_github_action("pkgdown-netlify-preview")
  expect_equal(args[[1]], "hubverse-org/hubverse-developer-actions")
  expect_equal(
    args$path,
    "pkgdown-netlify-preview/pkgdown-netlify-preview.yaml"
  )
  expect_equal(args$save_as, ".github/workflows/pkgdown-netlify-preview.yaml")
  expect_equal(args$ref, "v9.9.9")
  expect_false(args$overwrite)

  args <- use_hubdev_github_action("x", ref = "ak/branch/27", overwrite = TRUE)
  expect_equal(args$ref, "ak/branch/27")
  expect_true(args$overwrite)

  expect_true(fs::dir_exists(".github/workflows"))
  expect_true("^\\.github$" %in% readLines(".Rbuildignore"))
})

test_that("latest_release returns the latest release tag", {
  local_mocked_bindings(gh = function(...) list(tag_name = "v1.2.0"))
  expect_equal(latest_release(), "v1.2.0")
})

test_that("latest_release errors when there is no release", {
  local_mocked_bindings(
    gh = function(...) {
      rlang::abort(
        "GitHub API error (404): Not Found",
        class = "http_error_404"
      )
    }
  )
  expect_error(latest_release(), "No release found")
})
