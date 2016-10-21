library(dplyr, warn.conflicts = FALSE)
library(rvest)

base_url = "https://roll20.net"

url <- read_html(paste0(base_url,"/compendium/dnd5e/ranged%20Weapons#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

ranged_weapons_urls <- data_frame(url = paste0(base_url,tmp))

extract_ranged_weapons <- function(url) {
  link <- read_html(url)
  ranged_weapons_name <- html_node(x = link, css = ".page-title") %>%
    html_text
  
  ranged_weapons_description <- html_node(x = link, css = ".pagecontent") %>%
    html_text
  
  tab <- html_node(x = link, css = "table") %>%
    html_table(fill=TRUE) %>%
    rename(key   = X1,
           value = X2) %>%
    select(key, value) %>%
    filter(key != " " & value != "+ Add New Attribute") %>%
    mutate(name = ranged_weapons_name,
           description = ranged_weapons_description)
  
  return(tab)
}

# spell_urls <- spell_urls[1:2,]

ranged_weapons_unclean <- ranged_weapons_urls %>%
  rowwise %>%
  do(extract_ranged_weapons(.$url))

# clean up
ranged_weapons <- ranged_weapons_unclean %>%
  filter(value != "+ Add New Attribute") %>%
  tidyr::spread(key, value) %>%
  select(-Category)

devtools::use_data(ranged_weapons, overwrite = TRUE)

