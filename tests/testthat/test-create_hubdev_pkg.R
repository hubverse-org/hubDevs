test_that("create_hubdev_pkg works", {
  temp_dir <- tempdir()
  pkg_path <- file.path(temp_dir, "testPkg")

  suppressMessages(create_hubdev_pkg(pkg_path, build = FALSE))

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

  # Check LICENSE has correct format (year will change annually)
  license_content <- readLines(fs::path(pkg_path, "LICENSE"))
  expect_match(license_content[1], "^YEAR: [0-9]{4}$")
  expect_equal(
    license_content[2],
    "COPYRIGHT HOLDER: Consortium of Infectious Disease Modeling Hubs"
  )
})
