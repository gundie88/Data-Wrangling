#install.packages('htmltab')
# http://bradleyboehmke.github.io/2015/12/scraping-html-tables.html
library(XML)
library(RCurl)
library(tidyverse)
library(readr)
library(lubridate)
library(ggrepel)
library(downloader)

# has functions kml_coordinate, kml_points, kml_polygons
source("https://gist.githubusercontent.com/briatte/18a4d543d1ccca194b2a03ac512be2b4/raw/5cd241ab780a33ec9a3ae6297a48f9035cda811d/get_points.r")
#kml file download http://ldschurchtemples.org/maps/
bob <- tempfile()
download("http://ldschurchtemples.org/maps/downloads/kml.php", bob)
temple.locs <- kml_points(bob) %>% select(name, longitude, latitude)

url_size <- "https://ldschurchtemples.org/statistics/dimensions/"
url_time <- "https://ldschurchtemples.org/statistics/timelines/"

dimensions <- url_size %>%
  getURL() %>%
  readHTMLTable() %>%
  .[[1]] %>%
  as.tibble()

times_AnGrbr <- url_time %>%
  getURL() %>%
  readHTMLTable() %>%
  .[[2]] %>%
  as.tibble() %>%
  select(-Duration)

times_GrbrDed <- url_time %>%
  getURL() %>%
  readHTMLTable() %>%
  .[[3]] %>%
  as.tibble() %>%
  select(-Duration)



fulldata <- left_join(temple.locs, dimensions, by = c("name" = "Temple "))

            