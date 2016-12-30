#' Get certain monsters
#' 
#' Get monsters by name
#' 
#' @param name a character vector of monster names
#' @return data.frame of monsters
#' @import dplyr
#' @export
#' @examples 
#' get_monsters(name = "orc")
#' 
get_monsters <- function(name   = NULL) {
  
  fname   <- name
  
  monsters <- dnd5e::monsters
  
  if (!is.null(fname)) {
    monsters <- monsters %>%
      filter(tolower(name) %in% tolower(fname))
  }
  
  return(monsters)
}