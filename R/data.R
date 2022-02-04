#' Projects at LCBC
#'
#' @return data frame with information on LCBC projects
#' @export
#'
#' @examples
#' lcbc_projects()
#' @importFrom dplyr tribble
lcbc_projects <- function(){
  tribble(
    ~project_id, ~project_name, ~project_experimental,
    10,          "NDev",        NA,
    11,          "MemP",        NA,
    12,          "NCP",         "Memory training",
    13,          "MoBa",        NA,
    14,          "Loci",        "Memory training",
    15,          "MemC",        NA,
    16,          "ACon",        "Sleep study",
    17,          "S2C",         "Memory training (VR)",
    90,          "NBM",         NA
  )
}

#' LCBC MRI sites
#'
#' @return data frame with information on LCBC MRI data sites
#' @export
#'
#' @examples
#' lcbc_sites()
#' @importFrom dplyr tribble
lcbc_sites = function(){
  tribble(
    ~site_number, ~site_name,    ~site_tesla,
    11,           "ousAvanto",   1.5,
    12,           "ousSkyra",    3,
    13,           "ousPrisma",   3,
    20,           "ntnuAvanto",  1.5,
    21,           "curatoAvanto", 1.5
  )
}
