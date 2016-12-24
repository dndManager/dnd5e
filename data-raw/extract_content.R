library(dplyr, warn.conflicts = FALSE)
library(rvest)

base_url = "https://roll20.net"

url <- read_html(paste0(base_url,"/compendium/dnd5e/Monsters%20by%20Name#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

monster_urls <- data_frame(url = paste0(base_url,tmp))

extract_content <- function(url) {
  link <- read_html(url)
  monster_name <- html_node(x = link, css = ".page-title") %>%
    html_text
  
  monster_description <- html_node(x = link, css = ".pagecontent") %>%
    html_text
  
  tab <- html_node(x = link, css = "table") %>%
    html_table(fill=TRUE) %>%
    rename(key   = X1,
           value = X2) %>%
    select(key, value) %>%
    filter(key != " ") %>%
    filter(value != "+ Add New Attribute") 
  
  return(tab)
}