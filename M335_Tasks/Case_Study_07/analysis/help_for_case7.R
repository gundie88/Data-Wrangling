library(tidyverse)
library(rio)
verse <- read_lines("https://byuistats.github.io/M335/data/2nephi2516.txt")
names <- import("https://byuistats.github.io/M335/data/BoM_SaviorNames.rds")





#BOM_all <- paste(data = names$name, collapse = " ")

for (i in names$name) {
verse <-  str_replace(verse, i, "Andrewthemanthatcan1")
}
