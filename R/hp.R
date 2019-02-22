#' Roll hit points
#' 
#' Roll hit points based on the standard formula AdB+C where you roll A hit 
#' dice with B sides and add C
#' 
#' @param hp character AdB+C
#' @param n number of creatures to 
#' @return numeric vector of hit points
#' @export
#' 
hp <- function(hp, n = 1) {
  tmp <- as.numeric(unlist(strsplit(strsplit(hp, "d")[[1]], "+", fixed=TRUE)))
  hps <- numeric(n)
  for (i in 1:n) {
    hps[i] <- sum(sample.int(tmp[2], size = tmp[1], replace=TRUE))+tmp[3]
  }
  hps
}
