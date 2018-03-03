#' Roll dice
#' 
#' Allows you to roll any combination of dice
#' 
#' @param d4 A positive integer indicating the number of d4 to roll
#' @param d6 A positive integer indicating the number of d6 to roll
#' @param d8 A positive integer indicating the number of d8 to roll
#' @param d10 A positive integer indicating the number of d10 to roll
#' @param d12 A positive integer indicating the number of d12 to roll
#' @param d20 A positive integer indicating the number of d20 to roll
#' @param d100 A positive integer indicating the number of d100 to roll
#' @param collapse Logical (FALSE) indicating whether to sum by die type
#' @export
#' @import dplyr
#' @examples 
#' roll_dice(d20=6)
#' roll_dice(d4=2,d6=3,collapse=TRUE)
#' 
roll_dice <- function(d4=NULL,d6=NULL,d8=NULL,d10=NULL,
                      d12=NULL,d20=NULL,d100=NULL,
                      collapse = FALSE) {
  require(dplyr, quietly = TRUE)
  
  d <- data.frame(die=NULL,result=NULL)
  
  if (!is.null(d4))
    d <- rbind(d, data.frame(die = "d4", 
                             result = sample(4, size=d4, replace=TRUE)))
  
  if (!is.null(d6))
    d <- rbind(d, data.frame(die = "d6", 
                             result = sample(6, size=d6, replace=TRUE)))
  
  if (!is.null(d8))
    d <- rbind(d, data.frame(die = "d8", 
                             result = sample(8, size=d8, replace=TRUE)))
  
  if (!is.null(d10))
    d <- rbind(d, data.frame(die = "d10", 
                             result = sample(10, size=d10, replace=TRUE)))
  
  if (!is.null(d12))
    d <- rbind(d, data.frame(die = "d12", 
                             result = sample(10, size=d12, replace=TRUE)))
  
  if (!is.null(d20))
    d <- rbind(d, data.frame(die = "d20", 
                             result = sample(20, size=d20, replace=TRUE)))
  
  if (!is.null(d100))
    d <- rbind(d, data.frame(die = "d100", 
                             result = sample(100, size=d100, replace=TRUE)))
  
  if (collapse)
    d <- d %>% group_by(die) %>% summarize(result=sum(result)) %>% ungroup
  
  return(d %>% arrange(die, result))
}