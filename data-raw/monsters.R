library("readr")
library("dplyr")
library("stringr")
library("forcats")

monsters <- readr::read_csv("monsters.csv") %>%
  dplyr::mutate(name = stringr::str_extract(url, "Monsters:\\s*(.*?)\\s*#"),
                name = gsub("Monsters:", "", name),
                name = gsub("#", "", name),
                name = gsub("%20", " ", name),
                name = gsub("%27", "'", name)
                ) %>%
  
  rename_with(tolower) %>%
  
  # Fix challenge rating
  dplyr::mutate(`challenge rating` = dplyr::recode(`challenge rating`,
                                                 `1/2` = "0.5", 
                                                 `1/4` = "0.25", 
                                                 `1/8` = "0.125"),
                `challenge rating` = as.numeric(`challenge rating`)) %>%
  
  dplyr::select(-url) %>%
  
  dplyr::select(name, size, type, 
         `challenge rating`, ac, hp, str, dex, con, int, wis, cha,
         dplyr::everything())

usethis::use_data(monsters, overwrite = TRUE)

