library(methods)
library(dplyr, warn.conflicts = FALSE)
library(rvest)

source("extract_content.R")

base_url <- "https://roll20.net"
url <- read_html(paste0(base_url,"/compendium/dnd5e/Monsters%20by%20Name#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

monsters <- plyr::ddply(data_frame(url = paste0(base_url,tmp)), "url", function(d) {
  extract_content(d$url)
}, .inform=TRUE)

monsters %>%
  readr::write_csv("monsters.csv")
