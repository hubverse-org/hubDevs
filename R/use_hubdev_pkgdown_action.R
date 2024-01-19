#' Use the hubdev custom pkgdown GitHub Action
#'
#' The functions creates a `pkgdown-netlify-preview.yaml` action in the `.github/workflows`
#' directory. The action follows the standard pkgdown publishing to `gh-pages` in the
#' event of a merge into `main` branch but can also be set up to publish internal
#' PR previews to Netlify.
#' @details
#' To activate Netlify Previews, you must:
#' - Create a new site on Netlify. See <https://docs.netlify.com/welcome/add-new-site/> for more details.
#' - "Add the netlify API site ID to the GitHub repository Action secrets as
#' `NETLIFY_SITE_ID`. See <https://docs.netlify.com/api/get-started/#get-site> for more details.
#' - Get developer token from Netlify developer account settings and add it to
#' GitHub repository Action secrets as `NETLIFY_AUTH_TOKEN`. See
#' <https://docs.netlify.com/cli/get-started/#obtain-a-token-in-the-netlify-ui>
#' for more details.
#'
#' See  [pkgdown]() docs section on
#' [PR previews](https://pkgdown.r-lib.org/articles/customise.html#pr-previews)
#' for more details.
#'
#' @export
use_hubdev_pkgdown_action <- function() {
  use_hubdev_github_action("pkgdown-netlify-preview")

  usethis::ui_todo("To activate Netlify Previews, remember to:")
  cli::cli_bullets(c(
    ">" = "Create a new site on Netlify.
        See {.url https://docs.netlify.com/welcome/add-new-site/} for more details.",
    ">" = "Add the netlify API site ID to the GitHub repository Action secrets as
    {.envvar NETLIFY_SITE_ID}.
        See {.url https://docs.netlify.com/api/get-started/#get-site} for more details.",
    ">" = "Get developer token from Netlify developer account settings and
        add to GitHub repository Actions secrets as {.envvar NETLIFY_AUTH_TOKEN}.
        See {.url https://docs.netlify.com/cli/get-started/#obtain-a-token-in-the-netlify-ui} for more details."
  ))
  cli::cli_alert_info(
    c(
      "See {.pkg pkgdown} docs section on {.field PR previews}",
      "({.url https://pkgdown.r-lib.org/articles/customise.html#pr-previews}) for more details."
    )
  )
}
