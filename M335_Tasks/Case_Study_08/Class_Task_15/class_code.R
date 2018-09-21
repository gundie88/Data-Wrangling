library(tidyverse)
library(dplyr)
library(lubridate)

#code one from class
x <- mdy("January 21st, 2017")
y <- ymd("2012-01-01")
z <- myd("March 2016 - 23")


#code 2 from class
date_cols <- tibble(month = c(1, 3, 7), 
                    day = c(23, 18, 1), 
                    year = c(2017, 2017, 2016))

# Will this one work in make_date()?
date_cols1 <- tibble(month = c("Jaunary", "March", "July"), 
                    day = c(23, 18, 1), 
                    year = c(2017, 2017, 2016))

#code 3

q <- wday(mdy("March 23, 2016"), label = TRUE)

bday <- mdy("March 8, 1996")
yday(bday) - yday(now())

#code 4
