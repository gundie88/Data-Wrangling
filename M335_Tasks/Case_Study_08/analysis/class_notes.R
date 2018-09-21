library(lubridate)
library(tidyverse)
library(dplyr)
library(rio)

df <- import("https://byuistats.github.io/M335/data/Walmart_store_openings.csv")
#x <- ymd_hms("2009-07-01 2:01:59.23")
#force_tz(x, "America/Denver")
#floor_date(with_tz(x, "America/Denver"), "quarter")
#floor_date(force_tz(x, "America/Denver"), "quarter")
#floor_date(x, "15 minutes")
#floor_date(x, "3 months")

state <- tibble(abbreviation = state.abb,
                region = factor(state.region, 
                                levels = c("South", "North Central", "West", "Northeast"),
                                labels = c("South", "Midwest", "West", "Northern")))


walmart <-  df %>%
  mutate(OPENDATE = mdy(OPENDATE),
         date_super = mdy(date_super),
         STRSTATE_order = fct_reorder(STRSTATE, OPENDATE, fun = min, .desc = TRUE)) %>% 
  left_join(state, by = c("STRSTATE" = "abbreviation"))
  

pp <- ggplot(data = walmart, aes(x = OPENDATE)) +
  geom_histogram(binwidth = 365, color = "white", aes(fill = region)) +
  facet_grid(STRSTATE_order~.) +
  scale_fill_manual() +
  theme_bw() +
  theme(strip.background = " ")
  

ggsave(pp, filename = "M335_Tasks/Case_Study_08/analysis/bob.png", 
       height = 20, width = 8)
