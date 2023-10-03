#' Roll dice
#' 
#' Roll some dice
#' 
#' @name d20
#' @rdname d20
#' @param n A scalar integer indicating the number of dice to roll
#' @return A vector of dice rolls
#' @export
#' @examples
#' d20(n=2)
#' 
d20 <- function(n) sample.int(20, size = n, replace = TRUE)

#' @describeIn d20 Roll n d4 dice
#' @export
#' 
d4 <- function(n) sample.int(4, size = n, replace = TRUE)

#' @describeIn d20 Roll n d6 dice
#' @export
#' 
d6 <- function(n) sample.int(6, size = n, replace = TRUE)

#' @describeIn d20 Roll n d8 dice
#' @export
#' 
d8 <- function(n) sample.int(8, size = n, replace = TRUE)

#' @describeIn d20 Roll n d10 dice
#' @export
#' 
d10 <- function(n) sample.int(10, size = n, replace = TRUE)

#' @describeIn d20 Roll n d12 dice
#' @export
#' 
d12 <- function(n) sample.int(12, size = n, replace = TRUE)

#' @describeIn d20 Roll n d100 dice
#' @export
#' 
d100 <- function(n) sample.int(100, size = n, replace = TRUE)
