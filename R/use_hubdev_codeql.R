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
#' Defaults to the repository of the active project's `origin` remote.
#'
#' @returns The GitHub API response, invisibly. Called for its side effect.
#' @importFrom gh gh_tree_remote
#' @export
use_hubdev_codeql <- function(repo_spec = NULL) {
  repo_spec <- repo_spec %||% origin_repo_spec()
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

# The "owner/repo" of the `origin` remote of the repository at `path`.
origin_repo_spec <- function(path = usethis::proj_get()) {
  remote <- gh_tree_remote(path)
  paste0(remote$username, "/", remote$repo)
}
