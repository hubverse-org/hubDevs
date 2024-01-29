#' Add website Needs field to DESCRIPTION
#'
#' Adds the hubverve hubStyle package as a website need to the DESCRIPTION file.
#' @export
#'
add_website_needs <- function() {
  proj_desc_field_update(
    key = "Config/Needs/website",
    value = "Infectious-Disease-Modeling-Hubs/hubStyle",
    append = TRUE
  )
}
