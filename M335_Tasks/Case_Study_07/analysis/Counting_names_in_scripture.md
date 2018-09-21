---
title: "Counting names in scripture"
author: "Keegan Gunderson"
date: "February 24, 2018"
output: 
  html_document: 
    keep_md: yes
---





```r
scriptures <- read_csv("C:/Users/kgund/Documents/Winter Math 335/M335_GundersonK/M335_Tasks/Case_Study_07/Class_Task_14/lds-scriptures.csv")
```

```
## Parsed with column specification:
## cols(
##   volume_id = col_integer(),
##   book_id = col_integer(),
##   chapter_id = col_integer(),
##   verse_id = col_integer(),
##   volume_title = col_character(),
##   book_title = col_character(),
##   volume_long_title = col_character(),
##   book_long_title = col_character(),
##   volume_subtitle = col_character(),
##   book_subtitle = col_character(),
##   volume_short_title = col_character(),
##   book_short_title = col_character(),
##   volume_lds_url = col_character(),
##   book_lds_url = col_character(),
##   chapter_number = col_integer(),
##   verse_number = col_integer(),
##   scripture_text = col_character(),
##   verse_title = col_character(),
##   verse_short_title = col_character()
## )
```

```r
bmnames <- read_rds(gzcon(url("https://byuistats.github.io/M335/data/BoM_SaviorNames.rds")))
```



```r
jesus_name <- bmnames %>%
  select(name) 
  
BOM <- scriptures %>%
  filter(volume_title == "Book of Mormon")
  
BOMN <- str_c(BOM$scripture_text, collapse = " ")

#str_split(str_to_lower(scripture_text), " "))



for(i in jesus_name$name) {
  BOM <- str_replace(BOMN, i, "Andrewthemanthatcan1")
}


#unlist()
#str_replace()
```

I have gone through and drawn out a map of what I wanted to completely accomplish. That took a good amount of time but I was not able to code exactly everything. I ended up getting really frustrated and deleted a lot of code because I worked a long on it and felt I got nowhere. I wanted to get my select and filter everything I was going to use then use string functions to split it up so I could count each word. I just need to work on unlisting and using then replacing “Andrewthemanthatcan1”


