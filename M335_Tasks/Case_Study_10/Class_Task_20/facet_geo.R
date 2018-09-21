library(tidyverse)
library(rio)
library(geofacet)


pres <- import("https://byuistats.github.io/M335/data/nytimes_presidential_elections_2016_results_county.csv")

pres1 <- pres %>%
  group_by(State) %>%
  summarise(Trump = sum(Trump), Clinton = sum(Clinton))

pres2 <- pres1 %>%
  gather(key = "candidate", value = "count", -State)

ggplot(data = pres2, aes(x= candidate, y = count)) +
  geom_bar(stat = "identity") +
  facet_geo(~ State, grid = "us_state_grid2", label = "name")
