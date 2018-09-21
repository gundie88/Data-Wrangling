library(tidyverse)
library(rio)

stock <- "https://raw.githubusercontent.com/byuistats/data/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.csv"

#making sure task 10 looks good 
min_task10 <- import(stock, setclass = "tibble") %>%
  filter(!contest_period %in% "Average",
         variable %in% "DJIA") %>%
  separate(contest_period, c("start", "end"), sep = "-") %>%
  separate(end, c("month_end", "year_end"), sep = -5) %>%
  select(-start, -variable) %>%
  spread(key = year_end, value = value)

max_task10 <- min_task10 %>%
  mutate(month_end = case_when(
    month_end == "Dec." ~ "December",
    month_end == "Febuary" ~ "February",
    TRUE ~ month_end
  )) %>%
  group_by(month_end) %>%
  summarise_all(sum, na.rm = TRUE)

#Task 13 start
task13 <- max_task10 %>%
  mutate(month_end = fct_relevel(month_end, month.name)) %>%
  arrange(month_end) %>%   #if not a factor it will do it alphabetical instead of chronological
  gather(`1990`:`1998`, key = "year", value = "returns")

min_plot <- ggplot(task13, aes(x = month_end, y = returns, group = year)) +
  geom_point() +
  geom_line() +
  facet_grid( . ~ year)

events <- tibble(year = c(1990, 1998), event = c("Oil Shortage", "Russia Default"))

ggplot(task13, aes(x = month_end, y = returns/100, group = year)) +
  geom_point() +
  geom_line() +
  geom_vline(data = events, aes(xintercept = c(7,6), color = event), linetype = "dashed") +
  facet_grid( . ~ year) +
  labs(title = "6 month return index returns",
       x = "Month_end",
       y = "returns") +
  scale_y_continuous(labels = scales::percent) +
  scale_x_discrete(breaks = levels(task13$month_end)[c(T,rep(F,1))]) +
  scale_color_manual(name = "Event", values = c(`Oil Shortage` = "red", `Russia Default` = "blue")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
