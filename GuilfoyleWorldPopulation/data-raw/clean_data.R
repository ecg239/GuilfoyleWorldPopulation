library(readxl)
library(dplyr)

worldpop <- read_excel("data-raw/World_Population.xlsx",
                       sheet = "ESTIMATES",
                       range = "A17:BZ306")

WorldPopulation <- worldpop %>%
  rename(`Country Name` = `Region, subregion, country or area *`) %>%
  select(`Country Name`, matches("^(19[5-9][0-9]|20[0-1][0-9]|2020)$"))
