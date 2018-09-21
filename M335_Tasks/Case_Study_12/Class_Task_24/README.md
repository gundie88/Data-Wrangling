Bob <- function(breakpoint, fish, ...) {
              mean(fish,...)
}


* do.call("sample", list(x=10, size=5)) The do.call function allows you to provide the arguments as an actual list, "sample" is the function name.


function for temp folders in r

temp_folder <- function(x){
  df <- file_temp()
  uf <- path_temp("zip")
  download(x, df, mode = "wb") 
  unzip(df, exdir = uf)
  x <- read_sf(uf)
  file_delete(df)
  dir_delete(uf)
}
