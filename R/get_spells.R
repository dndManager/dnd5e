#' Get certain spells
#' 
#' Get spells by classes, levels, schools, etc
#' 
#' @param class a character vector of classes
#' @param level an integer vector of levels
#' @param school a character vector of schools
#' @return data.frame of spells
#' @import dplyr
#' @export
#' @examples 
#' get_spells(class = c("druid"), level = 1)
#' 
get_spells <- function(class=NULL, level=NULL, school=NULL) {
  fclass  <- class
  flevel  <- level
  fschool <- school
  
  spells <- dnd5e::spells
  
  if (!is.null(fclass)) {
    df_classes <- tolower(spells$classes)
    include <- TRUE
    for (i in seq_along(fclass)) {
      one_class <- fclass[i]
      include <- include * grepl(one_class, df_classes)
    }
    spells <- spells %>% filter(include==1)
  }
  
  if (!is.null(flevel))
    spells <- spells %>% filter(level %in% flevel)
  
  if (!is.null(fschool))
    spells <- spells %>% filter(tolower(school) %in% tolower(fschool))
  
  return(spells)
}