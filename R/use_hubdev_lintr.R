#' Create a basic hubverse .lintr file from template
#'
#' @export
use_hubdev_lintr <- function() {
  usethis::use_template(
    "_lintr",
    ".lintr",
    ignore = TRUE,
    open = FALSE,
    package = "hubDevs"
  )
}
