#' Weather
#' 
#' @return A data.frame with the weather
#' @examples 
#' weather()
#' 
weather <- function() {
  data.frame(temperature = sample(c("normal",
                                    paste(10*(1:3),"F colder"),
                                    paste(10*(1:3),"F hotter")),
                                  1,
                                  prob = c(14,rep(1,6))),
             wind = sample(c("none","light","strong"), 1, prob = c(12,5,3)),
             wind_direction = sample(c("N","NE","E","SE","S","SW","W","NW"), 1),
             precipitation = sample(c("none","light rain/snow","heavy rain/snow"),
                                    1, prob = c(12,5,3)))
}