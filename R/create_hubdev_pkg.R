#' Create hubverse package skeleton
#'
#' @inheritParams usethis::create_package
#' @inheritParams usethis::create_tidy_package
#' @param organisation Character string. The hubverse GitHub organisation name.
#' The user's role and the token's scopes must be such that you have permission
#' to create repositories in the hubverse organisation.
#' @param hubdocs_contribute_url Character string. URL of the general contributing
#' information page on hubDocs.
#'
#' @return Path to the newly created project or package, invisibly.
#' @export
create_hubdev_pkg <- function(path, fields = list(),
                              copyright_holder = "Consortium of Infectious Disease Modeling Hubs",
                              organisation = "Infectious-Disease-Modeling-Hubs",
                              hubdocs_contribute_url = "https://hubdocs.readthedocs.io/en/latest/overview/contribute.html") {
  path <- usethis::create_package(path,
    fields = fields,
    rstudio = TRUE, open = FALSE
  )
  usethis::local_project(path)
  hubdev_ignore()
  usethis::use_testthat()
  usethis::use_mit_license(copyright_holder)
  suppressMessages(
    usethis::use_logo(system.file("logo.png", package = "hubStyle"))
  )

  use_hubdev_readme(
    organisation = organisation,
    hubdocs_contribute_url = hubdocs_contribute_url
  )

  # Create community documents
  use_hubdev_community()

  usethis::use_git()
  usethis::use_git_hook(
    "pre-commit",
    render_template("readme-rmd-pre-commit.sh")
  )

  usethis::proj_activate(path)
  invisible(usethis::proj_get())
}


hubdev_ignore <- function(files = c(
                            ".DS_Store", ".Rhistory", ".Rdata",
                            ".httr-oauth", ".secrets"
                          )) {
  purrr::walk(
    files,
    ~ {
      suppressMessages(usethis::use_git_ignore(.x))
      suppressMessages(usethis::use_build_ignore(.x))
    }
  )
  cli::cli_alert_success(
    "Adding {.file {files}} to {.file .gitignore} and {.file .Rbuildignore}"
  )
}
