test_that("create_hubdev_pkg works", {
  temp_dir <- tempdir()
  pkg_path <- file.path(temp_dir, "testPkg")

  suppressMessages(create_hubdev_pkg(pkg_path))

  # Check basic structure
  visible_files <- fs::dir_ls(pkg_path, recurse = TRUE) |>
    fs::path_rel(temp_dir) |>
      sort()

  expect_snapshot(visible_files)

  expect_true(fs::dir_exists(fs::path(pkg_path, ".git")))

  github_files <- fs::dir_ls(
    fs::path(pkg_path, ".github"),
    recurse = TRUE
  ) |>
    fs::path_rel(temp_dir) |>
      sort()

  expect_snapshot(
    github_files
  )

  expect_snapshot(readLines(fs::path(pkg_path, "README.Rmd")))
  expect_snapshot(readLines(fs::path(pkg_path, ".gitignore")))
  expect_snapshot(readLines(fs::path(pkg_path, ".Rbuildignore")))
  expect_snapshot(readLines(fs::path(pkg_path, "LICENSE")))
})
