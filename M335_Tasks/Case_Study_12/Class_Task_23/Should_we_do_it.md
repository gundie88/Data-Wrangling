---
title: "Should_we_do_it?"
author: "Keegan Gunderson"
date: "March 26, 2018"
output: 
  html_document: 
    keep_md: yes
---




```r
randomletters <- read_lines("https://byuistats.github.io/M335/data/randomletters.txt")

randomletterswnumbers <- read_lines("https://byuistats.github.io/M335/data/randomletters_wnumbers.txt")
```


```r
str_split(randomletters, "")[[1]][c(1,seq(1700, str_count(randomletters), by = 1700))]
```

```
##  [1] "t" "h" "e" " " "p" "l" "u" "r" "a" "l" " " "o" "f" " " "a" "n" "e"
## [18] "c" "d" "o" "t" "e" " " "i" "s" " " "n" "o" "t" " " "d" "a" "t" "a"
## [35] "." "z" " " "a" "n" "f" "r" "a"
```

```r
#Adding spaces between every charaacter 
space_separated <- function(x){
  .l <- unlist(lapply(strsplit(x,''), paste, collapse = ' '))
  .l}

#run this is he consule: space_separated(Randomletters)
```



```r
numbers <- randomletterswnumbers %>%
  str_match_all("[0-9]+") %>%
  unlist %>% #puts the list into a vector 
  as.numeric
# letters is a default object in R
letters[numbers]
```

```
##  [1] "e" "x" "p" "e" "r" "t" "s" "o" "f" "t" "e" "n" "p" "o" "s" "s" "e"
## [18] "s" "s" "m" "o" "r" "e" "d" "a" "t" "a" "t" "h" "a" "n" "j" "u" "d"
## [35] "g" "m" "e" "n" "t"
```

```r
#get the last n characters from a string

substr_right = function(x,n){
  substring(x,nchar(x) - n + 1)
}

#run this in consule: substr_right(randomletters)
```


```r
randomletterswnumbers %>%
  str_replace(" ", "") %>%
  str_replace("\\.", "") %>%
  str_extract_all("[aeiou]{7}")
```

```
## [[1]]
## [1] "euaauue" "aaoaaae"
```

```r
#makes everything lowercase
to_lower <- function(x){
  tolower(x)
}
#run this in consule: to_lower(randomletters)
```


