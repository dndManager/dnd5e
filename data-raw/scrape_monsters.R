library(methods)
library(dplyr, warn.conflicts = FALSE)
library(rvest)

source("extract_content.R")

base_url <- "https://roll20.net"
url <- read_html(paste0(base_url,"/compendium/dnd5e/Monsters%20by%20Name#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

monsters <- data_frame(url = paste0(base_url,tmp)) %>%
  rowwise %>%
  do(extract_content(.$url)) %>%
  mutate(name = monster_name,
         description = monster_description) %>%
  tidyr::spread(key, value) %>%
  select(-Category)

monsters %>%
  readr::write_csv("monsters.csv")
