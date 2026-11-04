#' Hubverse Developer CodeQL setup
#'
#' Configures CodeQL code scanning on the package's GitHub repository to use
#' the "extended" query suite, as the hubverse security policy requires.
#'
#' @details
#' CodeQL default setup is enabled by default for public repositories in the
#' hubverse GitHub organisation. Its "default" query suite does not detect
#' third-party actions that are not pinned to a commit SHA. The "extended"
#' suite does.
#'
#' CodeQL does not analyse R, so in a package it scans only the GitHub Actions
#' workflows. Run this function once the workflows are on the default branch.
#' Changing the code scanning configuration requires admin access to the
#' repository.
#'
#' @param repo_spec Character string. The repository as `"owner/repo"`.
#' Defaults to the repository of the active project's `upstream` remote, or
#' its `origin` remote when there is no `upstream`. In a fork checkout,
#' `upstream` is the hubverse-org repository.
#'
#' @returns The GitHub API response, invisibly. Called for its side effect.
#' @importFrom usethis git_remotes
#' @export
use_hubdev_codeql <- function(repo_spec = NULL) {
  repo_spec <- repo_spec %||% source_repo_spec()
  call <- rlang::current_env()
  response <- rlang::try_fetch(
    gh(
      paste0("/repos/", repo_spec, "/code-scanning/default-setup"),
      .method = "PATCH",
      state = "configured",
      query_suite = "extended"
    ),
    github_error = function(cnd) {
      cli::cli_abort(
        c(
          "Could not configure CodeQL for {.val {repo_spec}}.",
          i = "This requires admin access to the repository, and GitHub
            Actions workflows on its default branch."
        ),
        parent = cnd,
        call = call
      )
    }
  )
  cli::cli_alert_success(
    "Configuring CodeQL for {.val {repo_spec}} with the extended query suite"
  )
  invisible(response)
}

# The "owner/repo" of the active project's `upstream` remote, or of `origin`
# when there is no `upstream`.
source_repo_spec <- function(remotes = git_remotes()) {
  url <- remotes[["upstream"]] %||% remotes[["origin"]]
  if (is.null(url)) {
    cli::cli_abort(
      c(
        "Could not find an {.val upstream} or {.val origin} remote.",
        i = "Supply {.arg repo_spec} as {.val owner/repo}."
      ),
      call = rlang::caller_env()
    )
  }
  sub("^.*github\\.com[:/]([^/]+/[^/]+?)(\\.git)?/?$", "\\1", url)
}
