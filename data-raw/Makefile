

all: spells
.PHONY: all spells

spells: ../data/spells.rda

../data/spells.rda: spells.R spells.csv
	Rscript spells.R

spells.csv: scrape_spells.R
	Rscript scrape_spells.R
