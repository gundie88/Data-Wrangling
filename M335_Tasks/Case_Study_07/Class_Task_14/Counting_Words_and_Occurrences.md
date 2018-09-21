---
title: "Counting Words and Occurrences"
author: "Keegan Gunderson"
date: "February 21, 2018"
output: 
  html_document: 
    keep_md: yes
    code_folding: hide
---




```r
pander(stri_stats_latex(lds$scripture_text))
```


------------------------------------------------------------------
 CharsWord   CharsCmdEnvir   CharsWhite    Words    Cmds   Envirs 
----------- --------------- ------------ --------- ------ --------
  4911691          0          1335849     1198272    0       0    
------------------------------------------------------------------


```r
BOM <- lds %>%
  filter(volume_title == "Book of Mormon") 
# sapply(gregexpr() was not working I dont know why
#counting all sequences on non-space characters (\\S+)

WBOM <- sapply(str_split( BOM$scripture_text, "\\S+"), length) + 1
```


```r
NT <- lds %>%
  filter(volume_title == "New Testament") 

WNT <- sapply(str_split(NT$scripture_text, "\\S+"), length) + 1
```


```r
AWBOM <- sum(WBOM)/length(WNT)

AWNT <- sum(WNT)/length(WBOM)
```
What is the average verse length (number of words) in the New Testament compared to the Book of Mormon? 

* The average verse length in the New Testament is 29.7
* The average verse length in the Book of Mormon is 35.2


```r
number_Jesus <- str_locate_all(BOM$scripture_text, "Jesus")
#Thought I could do a loop but I cant
#number_Jesus <- fucntion(number_Jesus)
#for (i in seq_along(BOM$scripture_text)) {            
#  number_Jesus[[i]] <- sum(BOM$scripture_text[[i]])      
#}
#number_Jesus

number_JesusBOM <- str_count(BOM$scripture_text, "Jesus")
sum(number_JesusBOM)
```

```
## [1] 184
```

```r
number_JesusNT <- str_count(NT$scripture_text, "Jesus")
sum(number_JesusNT)
```

```
## [1] 976
```

How often is the word Jesus in the New Testament compared to the Book of Mormon?

* The word Jesus is used 976 times in the New Testament.
* The word Jesus is used 184 times in the Book of Mormon.


```r
BOMW <- BOM %>%
  add_column(verse_words_count = WBOM) %>%
  group_by(book_title) %>%
  summarise(word_total = sum(verse_words_count)) %>%
  mutate(book_title)

ggplot(data = BOMW) +
  geom_point(aes(x = book_title, y = word_total/1000, color = book_title)) +
  labs(title = "Word Count Distribution by Verse per Book",
       y = "Word count in 1000's",
       x = "Book") +
  guides(color = FALSE) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

![](Counting_Words_and_Occurrences_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

How does the word count distribution by verse look for each book in the Book of Mormon?

* Alma and Mosiah have the highest word count per verse in the Book of Mormon.