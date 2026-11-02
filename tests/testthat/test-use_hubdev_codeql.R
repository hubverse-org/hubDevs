test_that("use_hubdev_codeql requests the extended query suite", {
  request <- NULL
  local_mocked_bindings(
    gh = function(endpoint, ...) request <<- list(endpoint = endpoint, ...),
    gh_tree_remote = function(path) {
      list(username = "hubverse-org", repo = "testPkg")
    }
  )
  usethis::local_project(withr::local_tempdir(), force = TRUE, quiet = TRUE)

  expect_message(use_hubdev_codeql(), "extended query suite")
  expect_equal(
    request$endpoint,
    "/repos/hubverse-org/testPkg/code-scanning/default-setup"
  )
  expect_equal(request$.method, "PATCH")
  expect_equal(request$state, "configured")
  expect_equal(request$query_suite, "extended")
})

test_that("use_hubdev_codeql explains a failed request", {
  local_mocked_bindings(
    gh = function(...) {
      rlang::abort(
        "GitHub API error (422): Unprocessable Entity",
        class = c("http_error_422", "github_error")
      )
    }
  )

  err <- expect_error(
    use_hubdev_codeql("hubverse-org/testPkg"),
    "Could not configure CodeQL"
  )
  expect_match(conditionMessage(err), "admin access")
  expect_equal(err$call, quote(use_hubdev_codeql("hubverse-org/testPkg")))
})
