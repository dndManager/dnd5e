#' Roll for ability scores
#' 
#' @param n The number ability scores to roll (default=6). 
#' @return A numeric vector of ability scores
#' @examples 
#' roll_ability_scores()
#' hist(roll_ability_scores(1e5), seq(2.5,20.5,by=1))
#' 
roll_ability_scores <- function(n=6) {
  m <- matrix(sample(6, n*4, replace=TRUE), nrow = n, ncol=4)
  apply(m, 1, function(x) sum(x)-min(x))
}
