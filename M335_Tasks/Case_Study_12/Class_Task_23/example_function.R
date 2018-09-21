library(downloader)
library(sf)
library(tidyverse)
library(fs)

shp_path <- "https://byuistats.github.io/M335/data/shp.zip"
wells_path <- "https://research.idwr.idaho.gov/gis/Spatial/Wells/WellConstruction/wells.zip"
dams_path <- "https://research.idwr.idaho.gov/gis/Spatial/DamSafety/dam.zip"
rivers_path <- "https://research.idwr.idaho.gov/gis/Spatial/Hydrography/streams_lakes/c_250k/hyd250.zip"

#'@title My great function
#'@details this function assumes tath we aer readingisn a shape file 
#'@param path is a string to a file or website
#'@param mode this is the setting for the function `download()`
#'@return an sf object
#'
get_data_from_file <- function(x, mode = "wb"){
  df <- file_temp()
  uf <- path_temp("zip")
  download(x, df, mode = mode) 
  unzip(df, exdir = uf)
  x <- read_sf(uf)
  file_delete(df)
  dir_delete(uf)
  return(x)
}

