#' Calculate ability modifier
#' 
#' Ability modifier is ability score minus 10 divided by two 
#' and rounded toward zero. The maximum ability modifier is 10. 
#' 
#' @param ability_score: a positive integer
#' @return An integer
#' @export
#' @examples 
#' ability_modifier(1:30) 
#'
calculate_ability_modifier <- function(ability_score) {
  stopifnot(isTRUE(all(ability_score>0)))
  
  mod <- floor((ability_score - 10)/2)
  
  mod[mod>10] <- 10
  
  return(mod)
}