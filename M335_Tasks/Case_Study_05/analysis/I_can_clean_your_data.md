---
title: "I can clean your data"
author: "Keegan Gunderson"
date: "February 8, 2018"
output: 
  html_document: 
    keep_md: yes
---




```r
#WorldWide = WorldWide[-1,]

WorldWide <- WorldWide %>%
  select(Code, `Continent, Region, Country`, ends_with("0")) %>%
  select(-`1800`, -`2010`) %>%
  gather(`1810`:`1980`, key = "year", value = "height") %>%
  select(Code, `Continent, Region, Country`, year, height) %>%
  filter(!is.na(height)) %>%
  mutate(yeard = year) %>%
  rename(year_decade = yeard) %>% 
  separate(year, into = c("century", "year"), sep = -3) %>%
  separate(year, into = c("decade", "year"), sep = -2) %>%
  mutate(height.in = height * 0.393701) %>%
  rename(height.cm = height, Country = `Continent, Region, Country`)
```


```r
#german conscr

germanconscr1 <- germanconscr %>%
  select(bdec, height) %>%
  mutate(height.in = height * 0.393701, study = "germanconscr") %>%
  rename(height.cm = height, birth_year = bdec)

  #separate(co, into = c("study_id","co"), sep = "-") %>%
  #select(-`co`)
```


```r
#german prison

germanprison1 <- germanprison %>%
  select(bdec, height) %>%
  rename(height_cm = height) %>%
  mutate(height.in = height_cm * 0.393701, study = "germanprison") %>%
  rename(birth_year = bdec)
#study_id = co
```



```r
#DBF 
heightS1 <- heightS  %>%
  select(SJ, GEBJZ, GEBGER) %>%
  rename(birth_year = SJ, height.cm = GEBJZ, study_id = GEBGER) %>%
  mutate(height.in = height.cm * 0.393701, study = "heightS")
```


```r
#BLS 
BLSwage1 <- BLSwage %>%
  select(height) %>%
  rename(height.in = height) %>%
  mutate(height.cm = height.in * 2.54, study = "BLS", birth_year = 1950)
```


```r
#Gonna need to figure this one out
#NationalSurvey <- national_survey %>%
#  select() %>%
#  mutate()
```


```r
#tidy_data <- rbind(germanconscr1, germanprison1, heightS1, BLSwage1)
```

unique value column 
bind rows
