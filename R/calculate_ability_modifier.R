#' Calculate ability modifier
#' 
#' Ability modifier is ability score minus 10 divided by two 
#' and round down.
#' 
#' @param ability_score: a positive integer
#' @return An integer
#' @references page 13 in player handbook
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