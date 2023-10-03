#' Roll hit points
#' 
#' Roll hit points based on the standard formula AdB+C where you roll A hit 
#' dice with B sides and add C
#' 
#' @param hp character AdB+C
#' @param n number of creatures to 
#' @return numeric vector of hit points
#' @export
#' @examples
#' roll_hp("2d4+1")
#' roll_hp("4d10+12", 10)
#' 
#' 
roll_hp <- function(hp, n = 1) {
  tmp <- as.numeric(unlist(strsplit(strsplit(hp, "d")[[1]], "+", fixed=TRUE)))
  hps <- numeric(n)
  for (i in 1:n) {
    hps[i] <- sum(sample.int(tmp[2], size = tmp[1], replace=TRUE))+tmp[3]
  }
  as.integer(hps)
}
