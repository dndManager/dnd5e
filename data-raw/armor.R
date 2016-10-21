library(dplyr, warn.conflicts = FALSE)
library(rvest)

base_url = "https://roll20.net"

url <- read_html(paste0(base_url,"/compendium/dnd5e/Armor%20by%20Type#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

armor_urls <- data_frame(url = paste0(base_url,tmp))

extract_armor <- function(url) {
  link <- read_html(url)
  armor_name <- html_node(x = link, css = ".page-title") %>%
    html_text
  
  armor_description <- html_node(x = link, css = ".pagecontent") %>%
    html_text
  
  tab <- html_node(x = link, css = "table") %>%
    html_table(fill=TRUE) %>%
    rename(key   = X1,
           value = X2) %>%
    select(key, value) %>%
    filter(key != " " & value != "+ Add New Attribute") %>%
    mutate(name = armor_name,
           description = armor_description)
  
  return(tab)
}

# spell_urls <- spell_urls[1:2,]

armor_unclean <- armor_urls %>%
  rowwise %>%
  do(extract_armor(.$url))

# clean up
armor <- armor_unclean %>%
  filter(value != "+ Add New Attribute") %>%
  tidyr::spread(key, value) %>%
  select(-Category)

devtools::use_data(armor, overwrite = TRUE)

