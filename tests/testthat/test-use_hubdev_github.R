test_that("use_hubdev_pkg_actions works", {

  temp_dir <- tempdir()
  pkg_path <- file.path(temp_dir, "testPkg")

  suppressMessages(create_hubdev_pkg(pkg_path))

  current_wd <- getwd()
  setwd(pkg_path)
  on.exit(setwd(current_wd))

  # Add a fake GitHub remote so usethis::use_github_action() can add badges
  system2("git", c("remote", "add", "origin", "https://github.com/hubverse-org/testPkg.git"))

  suppressMessages(use_hubdev_pkg_actions())

  workflows_path <- fs::path(pkg_path, ".github", "workflows")
  expect_true(fs::dir_exists(workflows_path))

  workflow_files <- fs::dir_ls(workflows_path) |>
    fs::path_file() |>
    sort()

  expect_equal(
    workflow_files,
    c("R-CMD-check.yaml", "lint.yaml", "test-coverage.yaml")
  )
})


test_that("use_hubdev_pkgdown works", {
  temp_dir <- tempdir()
  pkg_path <- file.path(temp_dir, "testPkg")

  suppressMessages(create_hubdev_pkg(pkg_path))

  current_wd <- getwd()
  setwd(pkg_path)
  on.exit(setwd(current_wd))
  suppressMessages(use_hubdev_pkgdown())

  expect_true(fs::file_exists("_pkgdown.yml"))

  pkgdown_content <- readLines("_pkgdown.yml")
  expect_equal(
    pkgdown_content,
    c("url: ~", "template:", "  bootstrap: 5", "")
  )
})
