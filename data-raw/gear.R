library(dplyr, warn.conflicts = FALSE)
library(rvest)

base_url = "https://roll20.net"

url <- read_html(paste0(base_url,"/compendium/dnd5e/Adventuring%20Gear%20by%20Name#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

gear_urls <- data_frame(url = paste0(base_url,tmp))

extract_gear <- function(url) {
  link <- read_html(url)
  gear_name <- html_node(x = link, css = ".page-title") %>%
    html_text
  
  gear_description <- html_node(x = link, css = ".pagecontent") %>%
    html_text
  
  tab <- html_node(x = link, css = "table") %>%
    html_table(fill=TRUE) %>%
    rename(key   = X1,
           value = X2) %>%
    select(key, value) %>%
    filter(key != " " & value != "+ Add New Attribute") %>%
    mutate(name = gear_name,
           description = gear_description)
  
  return(tab)
}

# spell_urls <- spell_urls[1:2,]

gear_unclean <- gear_urls %>%
  rowwise %>%
  do(extract_gear(.$url))

# clean up
gear <- gear_unclean %>%
  filter(value != "+ Add New Attribute") %>%
  tidyr::spread(key, value) %>%
  select(-Category)

devtools::use_data(gear, overwrite = TRUE)

