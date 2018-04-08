#' Roll treasure
#' 
#' Roll for random treasure
#' 
#' @param n number of times to roll
#' @param challenge challenge rating of creatures
#' @param type individual or hoard
#' @param collapse logicical, if true, will just return total
#' @import dplyr
#' @export 
#' @examples 
#' treasure(n = 2) # 2 individuals challenge of 0
#' treasure(n = 1, challenge = 3)
#' treasure(n=29, collapse = TRUE)
#' 
treasure <- function(n, 
                     challenge = 0, 
                     type = "individual", 
                     collapse = FALSE) {
  d <- data.frame(type = character(), 
                  amount = numeric(),
                  stringsAsFactors = FALSE)
  
  if (type == "hoard") 
    error("type == 'hoard' not yet implemented")
  
  if (challenge > 4) 
    error("challenge > 4 not yet implemented")
  
  d <- data.frame(
    type = sample(c("copper",
                    "silver",
                    "electrum",
                    "gold",
                    "platinum"),
                  n, 
                  replace = TRUE,
                  prob = c(.3,.3,.1,.25,.05)),
    copper   = d6(n),
    silver   = d6(n),
    electrum = d6(n),
    gold     = d6(n),
    platinum = d6(n)) 
  
  d$amount <- with(d, 
                   copper * (type == "copper") +
                     silver * (type == "silver") + 
                     electrum * (type == "electrum") + 
                     gold * (type == "gold") + 
                     platinum * (type == "platinum"))
  
  dd <- d[,c("type","amount")]
  
  if (collapse) {
    dd %>% 
      group_by(type) %>% 
      summarize(amount = sum(amount)) %>%
      return()
  } else {
    return(dd)
  }
  
}