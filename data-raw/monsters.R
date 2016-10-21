library(dplyr, warn.conflicts = FALSE)
library(rvest)

base_url = "https://roll20.net"

url <- read_html(paste0(base_url,"/compendium/dnd5e/Monsters%20by%20Name#content"))

tmp <- html_nodes(x = url, css = ".pagecontent a") %>%
  html_attr("href")

monster_urls <- data_frame(url = paste0(base_url,tmp))

extract_monster <- function(url) {
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
    filter(key != " " & value != "+ Add New Attribute") %>%
    mutate(name = monster_name,
           description = monster_description)
  
  return(tab)
}

# spell_urls <- spell_urls[1:2,]

monsters_unclean <- monster_urls %>%
  rowwise %>%
  do(extract_monster(.$url))

# clean up
monsters <- monsters_unclean %>%
  filter(value != "+ Add New Attribute") %>%
  tidyr::spread(key, value) %>%
  select(-Category) %>%
  mutate(`Challenge Rating` = as.numeric(plyr::revalue(`Challenge Rating`,
                                            c("1/2"=1/2, "1/4"=1/4, "1/8"=1/8))))
  

devtools::use_data(monsters, overwrite = TRUE)

