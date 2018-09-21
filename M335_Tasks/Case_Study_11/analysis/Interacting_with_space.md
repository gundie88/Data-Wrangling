---
title: "Interacting with space"
author: "Keegan Gunderson"
date: "March 24, 2018"
output: 
  html_document: 
    keep_md: yes
    code_folding: hide
---




```r
states <- us_states() %>% 
  filter(!stusps %in% c("PR", "AK", "HI"))

single_family <- permits %>% 
  filter(year %in% c(2007, 2008, 2009, 2010),
         variable == "Single Family", !StateAbbr %in% c("AK", "HI"))

us <- single_family %>% 
  group_by(StateAbbr, year) %>% 
  summarize(amount = sum(value))

full_us <- us %>% 
  full_join(states, by = c("StateAbbr" = "stusps"))

permit <- permits %>%
  filter(variable == "Single Family") %>%
  group_by(StateAbbr, year) %>%
  summarise(value = sum(value))
```
<cente>

```r
county <- us_counties() %>% 
  filter(state_abbr == "ID")

Idaho <- single_family %>% 
  filter(StateAbbr == "ID") %>% 
  rename("name" = "countyname") %>% 
  mutate(name = str_sub(name, end = -8)) 

idaho_county <- county %>% 
  full_join(Idaho, by = "name")
#Andrew thanks for the reference
ggplot() +
  geom_sf(data = idaho_county, aes(fill = value)) +
  labs(fill = "Number of Permits", 
       title = "Idaho Permits 2007-2010") +
  scale_fill_gradient(low = "green", high = "black", trans = "log") +
  theme_bw() +
  theme(plot.title = element_text(hjust = .5, size = rel(2), face = "bold"))
```

![](Interacting_with_space_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
</center>

<center>

```r
ggplot(data = full_us) +
  geom_sf(aes(fill = amount)) +
  theme_test() +
  facet_grid(.~year) +
scale_fill_gradient(low = "gray", 
                    high = "red", 
                    trans = "log") + 
  labs(title = "Single Family Building Permits in U.S", 
       x = "Longitude", 
       y = "Latitude",
       fill = "Yearly Permit Amount") +
  theme(plot.title = element_text(hjust = .5, size = rel(2)), axis.text = element_text(colour = "red"))
```

![](Interacting_with_space_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
</center>



```r
counties <- us_counties()

permits <- buildings::permits

counties <- us_counties()
permits1 <- permits %>%
  filter(variable == "Single Family") %>%
  mutate(name = str_replace(countyname, " County", "")) %>%
  group_by(name, year) %>%
  summarise(`Number of Permits` = n())

spatial_dat <- counties %>%
  left_join(permits1) %>% 
  filter(year %in% c(2005: 2010))

bins <- seq(0,30, 2)
pal <- colorBin("Blues", domain = spatial_dat$`Number of Permits`, bins = bins)
```


```r
leaflet(spatial_dat %>% filter(year == 2005)) %>%
  addLegend(pal = pal, values = ~`Number of Permits`) %>%
  setView(lng = -96.7026, lat = 40.8136 , zoom = 3) %>%
  addTiles() %>%
  addPolygons(fillColor = ~pal(`Number of Permits`),
              weight = 1,
              opacity = 1,
              color = "black",
              dashArray = "3",
              fillOpacity = 1) %>%
  addProviderTiles("MapBox", options = providerTileOptions(
    id = "mapbox.light", 
    accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN')))
```

<!--html_preserve--><div id="htmlwidget-41471640defaceac061d" style="width:672px;height:480px;" class="leaflet html-widget"></div>
