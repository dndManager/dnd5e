

all: spells monsters
.PHONY: all spells monsters

spells: ../data/spells.rda

../data/spells.rda: spells.R spells.csv
	Rscript spells.R

spells.csv: scrape_spells.R
	Rscript scrape_spells.R

monsters: ../data/monsters.rda

../data/monsters.rda: monsters.R monsters.csv
	Rscript monsters.R

monsters.csv: scrape_monsters.R
	Rscript scrape_monsters.R

