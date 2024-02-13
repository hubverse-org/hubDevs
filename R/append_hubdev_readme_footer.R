#' Append the standard hubverse footer to a README.Rmd
#'
#' @inheritParams create_hubdev_pkg
#' @export
append_hubdev_readme_footer <- function(hubdocs_contribute_url = "https://hubdocs.readthedocs.io/en/latest/overview/contribute.html") { # nolint
  data <- list(
    pkgname = get_pkgname(),
    hubdocs_contribute_url = hubdocs_contribute_url
  )

  suppressMessages(
    usethis::use_template(
      "readme-footer.md",
      "readme-footer.md",
      data = data,
      ignore = FALSE,
      open = FALSE,
      package = "hubDevs"
    )
  )

  footer <- readLines("readme-footer.md")
  write(footer, file = "README.Rmd", append = TRUE)
  unlink("readme-footer.md")

  cli::cli_alert_success("{.file README.Rmd} updated with {.field hubverse} footer.")
  cli::cli_alert("Please re-render {.file README.Rmd} and commit the changes.")
}
