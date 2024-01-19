#' Helpers for creating community facing hubverse package documents.
#'
#' These functions create community facing documents detailing how contributors
#' and the wider community can interact with hubverse packages.
#' Each function creates the relevant file in the `.github` directory from templates
#' and is set up with appropriate hubverse default values.
#'
#' @param contacts Character string. Contact name and email of hubverse community
#' members responsible for enforcing the Code of Conduct.
#'
#' @export
#' @rdname community
use_hubdev_coc <- function(contacts = "Lucie Contamin (contamin@pitt.edu),
                           Emily Howerton (ehowerton@psu.edu) or
                           Seb Funk (sebastian.funk@lshtm.ac.uk)") {
  usethis::use_directory(".github", ignore = TRUE)
  usethis::use_git_ignore("*.html", directory = ".github")

  data <- list(contacts = contacts)

  usethis::use_template(
    "CODE_OF_CONDUCT.md",
    fs::path(".github", "CODE_OF_CONDUCT.md"),
    data = data,
    package = "hubDevs"
  )
}

#' @inheritParams create_hubdev_pkg
#' @export
#' @rdname community
use_hubdev_contributing <- function(organisation = "Infectious-Disease-Modeling-Hubs",
                                    hubdocs_contribute_url = "https://hubdocs.readthedocs.io/en/latest/overview/contribute.html") {
  usethis::use_directory(".github", ignore = TRUE)
  usethis::use_git_ignore("*.html", directory = ".github")

  data <- list(
    pkgname = get_pkgname(),
    organisation = organisation,
    hubdocs_contribute_url = hubdocs_contribute_url
  )
  usethis::use_template(
    "CONTRIBUTING.md",
    fs::path(".github", "CONTRIBUTING.md"),
    data = data,
    package = "hubDevs"
  )
}
