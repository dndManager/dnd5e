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
    filter(key != " " & value != "+ Add New Attribute") %>%
    mutate(name = spell_name,
           description = spell_description)
  
  return(tab)
}

# spell_urls <- spell_urls[1:2,]

spell_info_unclean <- spell_urls %>%
  rowwise %>%
  do(extract_spell_info(.$url))

# clean up
spell_info <- spell_info_unclean %>%
  filter(value != "+ Add New Attribute") %>%
  tidyr::spread(key, value) %>%
  select(-Category)

devtools::use_data(spell_info, overwrite = TRUE)

