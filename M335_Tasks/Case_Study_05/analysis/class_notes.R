library(tidyverse)
#glimpse(util)

util <- read_csv("https://byuistats.github.io/M335/data/building_utility_values.csv",
                 col_types = cols(timestamp = col_datetime(format = "%m%.%d%.%Y %H:%M"),
                 startdate = col_date(format = "%m%.%d%.%Y"),
                 enddate = col_date(format = "%m%.%d%.%Y")))

cleandata <- util %>%
  select(building_id, timestamp, contains("date"), contains("water")) %>%
  separate(building_id, c("state", "building_id"), sep = 2) %>%
  separate(enddate, c("month", "year", "day"), remove = FALSE)

buildingstate <- cleandata %>%
  group_by(state, building_id) %>%
  summarise(n = n())
  group_by(state) %>%
  summarise(n())

(buildingstate1 <- cleandata %>%
  group_by(state) %>%
  summarize(n = n_distinct(building_id)))
