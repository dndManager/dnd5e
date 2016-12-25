library(dplyr)

write_page <- function(d) {
  link <- paste0("../",gsub(" ","_",d$name),".Rmd")
  
  file.copy(from = "spell_page_template.Rmd",
            to   = link)
  
  system(paste0("perl -pi -e 's/spell_name/",d$name,"/g' ",link))
  
  return(data.frame())
}

spells_not_working <- c("Antipathy (Sympathy)",
                        "Arcanist's Magic Aura",
                        "Heroes' Feast",
                        "Tasha's Hideous Laughter",
                        "Hunter's Mark")

dnd5e::spells %>%
  filter(!(name %in% spells_not_working)) %>%
  group_by(name) %>%
  do(write_page(.))
  