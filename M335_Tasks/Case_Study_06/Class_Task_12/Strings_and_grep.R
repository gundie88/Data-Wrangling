randomletters <- read_lines("https://byuistats.github.io/M335/data/randomletters.txt")

randomletterswnumbers <- read_lines("https://byuistats.github.io/M335/data/randomletters_wnumbers.txt")


str_split(randomletters, "")
str_extract_all(randomletters,"[^c(1,seq(1700, str_count(randomletters), by = 1700)]")
