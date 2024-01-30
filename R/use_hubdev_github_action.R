#' Hubverse Developer GitHub Action setup
#'
#' Sets up common hubverse developer continuous integration (CI) workflows for
#' hubverse packages hosted on GitHub using
#' [GitHub Actions](https://github.com/features/actions).
#' Available actions are hosted in repository
#' [Infectious-Disease-Modeling-Hubs/hubverse-developer-actions](
#' https://github.com/Infectious-Disease-Modeling-Hubs/hubverse-developer-actions)
#' @param name Name of workflow, i.e. the name of one of the
#' [hubverse developer action repository](
#' https://github.com/Infectious-Disease-Modeling-Hubs/hubverse-developer-actions)
#' directories containing a GitHub Action workflow `.yaml` file.
#' @export
use_hubdev_github_action <- function(name) {
  url <- paste(
    "https://github.com/Infectious-Disease-Modeling-Hubs/hubverse-developer-actions/blob",
    "main",
    name,
    paste0(name, ".yaml"),
    sep = "/"
  )

  usethis::use_github_action(
    url = url,
    ignore = TRUE
  )
}
