library(tidyverse)
library(downloader)
library(readr)
library(haven)
library(readxl)
library(ggplot2)

z <- read_rds(gzcon(url("https://github.com/byuistats/data/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.RDS")))


x <- read_csv("https://raw.githubusercontent.com/byuistats/data/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.csv")

c <- read_dta("https://github.com/byuistats/data/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.dta")

v <- read_sav("https://github.com/byuistats/data/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.sav")


download("https://github.com/byuistats/data/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.xlsx", "downloader.zip", mode = "wb")

b <- read_xlsx("downloader.zip")

```


ggplot(data = x) +
  geom_boxplot(aes(x = variable,
                   y = value,
                   fill = variable)) +
  geom_point(aes(x = variable,
                 y = value,
                 fill = variable), position = "jitter") +
  #scale_y_continuous(breaks = seq(24, 42, by = 2)) +
  labs(x = "Stock Selections", 
       y = "frequency", 
       fill = "",
       title = "Stock Performance") +
  theme_bw()


ggsave("stock.png")

