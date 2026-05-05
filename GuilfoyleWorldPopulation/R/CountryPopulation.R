#' Plot Population of a UN Country.
#'
#' This function plots population vs year (1950–2020) for a given country.
#'
#' @param Name A character string of the country name
#'
#' @return A ggplot object
#' @export
CountryPopulation <- function(Name){

  if(!Name %in% WorldPopulation$`Country Name`){
    stop("Country not found in dataset")
  }

  library(dplyr)
  library(tidyr)
  library(ggplot2)

  pop_long <- WorldPopulation %>%
    pivot_longer(
      cols = -`Country Name`,
      names_to = "Year",
      values_to = "Population"
    )

  pop_long$Year <- as.numeric(pop_long$Year)
  pop_long$Population <- as.numeric(pop_long$Population)

  pop_long %>%
    filter(`Country Name` == Name) %>%
    ggplot(aes(x = Year, y = Population, group = 1)) +
    geom_line() +
    labs(title = Name, x = "Year", y = "Population") +
    theme_minimal()
}
