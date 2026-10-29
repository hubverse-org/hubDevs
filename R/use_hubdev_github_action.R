#' Hubverse Developer GitHub Action setup
#'
#' Sets up common hubverse developer continuous integration (CI) workflows for
#' hubverse packages hosted on GitHub using
#' [GitHub Actions](https://github.com/features/actions).
#' Available actions are hosted in repository
#' [hubverse-org/hubverse-developer-actions](
#' https://github.com/hubverse-org/hubverse-developer-actions)
#' @param name Name of workflow, i.e. the name of one of the
#' [hubverse developer action repository](
#' https://github.com/hubverse-org/hubverse-developer-actions)
#' directories containing a GitHub Action workflow `.yaml` file.
#' @param ref Tag, branch or commit SHA of
#' [hubverse-org/hubverse-developer-actions](
#' https://github.com/hubverse-org/hubverse-developer-actions)
#' to download from. Defaults to the latest release.
#' @param overwrite Logical. Whether to replace an existing file without
#' asking. When `FALSE`, an interactive session asks first and a
#' non-interactive session leaves the existing file unchanged.
#'
#' @returns `TRUE` if the file was written, `FALSE` otherwise, invisibly.
#' @importFrom usethis use_github_file
#' @importFrom gh gh
#' @importFrom rlang %||%
#' @export
use_hubdev_github_action <- function(name, ref = NULL, overwrite = FALSE) {
  ref <- ref %||% latest_release()
  save_as <- file.path(".github", "workflows", paste0(name, ".yaml"))
  usethis::use_directory(".github", ignore = TRUE)
  usethis::use_directory(dirname(save_as))
  use_github_file(
    actions_repo_spec,
    path = paste0(name, "/", name, ".yaml"),
    save_as = save_as,
    ref = ref,
    overwrite = overwrite
  )
}

# The repository hosting the hubverse developer workflows.
actions_repo_spec <- "hubverse-org/hubverse-developer-actions"

# The tag of the latest hubverse-developer-actions release. GitHub leaves
# drafts and prereleases out of this endpoint.
latest_release <- function(call = rlang::caller_env()) {
  release <- rlang::try_fetch(
    gh(paste0("/repos/", actions_repo_spec, "/releases/latest")),
    http_error_404 = function(cnd) {
      cli::cli_abort(
        c(
          "No release found in {.val {actions_repo_spec}}.",
          i = "Set {.arg ref} to a tag, branch or commit SHA."
        ),
        parent = cnd,
        call = call
      )
    }
  )
  release$tag_name
}
