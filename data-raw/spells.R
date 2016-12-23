# This will clean up the spells data and
# write it to data/spells.rda

library(dplyr)

spells <- readr::read_csv("spells.csv") %>%
  select(-url)

names(spells) <- tolower(names(spells))
names(spells) <- gsub(" ", "_", names(spells))

# Fix spell names
spells <- spells %>%
  mutate(name = plyr::revalue(name, c("Hideous Laughter" = "Tasha's Hideous Laughter")))

devtools::use_data(spells, overwrite = TRUE)
