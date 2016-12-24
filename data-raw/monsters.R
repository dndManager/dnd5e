library(dplyr)

monsters <- readr::read_csv("monsters.csv") %>%
  select(-url)

names(monsters) <- tolower(names(monsters))
names(monsters) <- gsub(" ", "_", names(monsters))

# clean up
monsters <- monsters %>%
  
  # Fix challenge rating
  mutate(challenge_rating = as.numeric(plyr::revalue(challenge_rating,
                                            c("1/2"=0.5, "1/4"=0.25, "1/8"=0.125))))
  
devtools::use_data(monsters, overwrite = TRUE)

