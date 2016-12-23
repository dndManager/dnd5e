library(methods)
library(dplyr, warn.conflicts = FALSE)
library(rvest)

base_url = "https://roll20.net"

url <- read_html(paste0(base_url,"/compendium/dnd5e/Spells%20by%20Name#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

spell_urls <- data_frame(url = paste0(base_url,tmp))

extract_spell_info <- function(url) {
  link <- read_html(url)
  spell_name <- html_node(x = link, css = ".page-title") %>%
    html_text
  
  spell_description <- html_node(x = link, css = ".pagecontent") %>%
    html_text
  
  tab <- html_node(x = link, css = "table") %>%
    html_table(fill=TRUE) %>%
    rename(key   = X1,
           value = X2) %>%
    select(key, value) %>%
    filter(key != " ") %>%
    filter(value != "+ Add New Attribute") %>%
    mutate(name = spell_name,
           description = spell_description) %>%
    tidyr::spread(key, value) %>%
    select(-Category)
  
  return(tab)
}

spells <- plyr::ddply(spell_urls, "url", function(d) {
  extract_spell_info(d$url)
}, .inform=TRUE)

# spells <- spell_urls %>%
#   group_by(url) %>%
#   do(extract_spell_info(.$url))

spells %>%
  readr::write_csv("spells.csv")
