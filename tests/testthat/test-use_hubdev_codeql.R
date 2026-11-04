test_that("use_hubdev_codeql requests the extended query suite", {
  request <- NULL
  local_mocked_bindings(
    gh = function(endpoint, ...) request <<- list(endpoint = endpoint, ...),
    git_remotes = function() {
      list(origin = "https://github.com/hubverse-org/testPkg.git")
    }
  )

  expect_message(use_hubdev_codeql(), "extended query suite")
  expect_equal(
    request$endpoint,
    "/repos/hubverse-org/testPkg/code-scanning/default-setup"
  )
  expect_equal(request$.method, "PATCH")
  expect_equal(request$state, "configured")
  expect_equal(request$query_suite, "extended")
})

test_that("source_repo_spec prefers the upstream remote of a fork", {
  remotes <- list(
    origin = "git@github.com:someone/testPkg.git",
    upstream = "https://github.com/hubverse-org/testPkg.git"
  )
  expect_equal(source_repo_spec(remotes), "hubverse-org/testPkg")
  expect_equal(
    source_repo_spec(remotes["origin"]),
    "someone/testPkg"
  )
})

test_that("use_hubdev_codeql asks for repo_spec without a GitHub remote", {
  local_mocked_bindings(git_remotes = function() NULL)

  expect_error(use_hubdev_codeql(), "repo_spec")
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
