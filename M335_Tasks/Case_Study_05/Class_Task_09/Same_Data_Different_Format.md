---
title: "Same Data Different Format"
author: "Keegan Gunderson"
date: "February 5, 2018"
output: 
  html_document: 
    keep_md: yes
---




```r
ggplot(data = x) +
  geom_boxplot(aes(x = variable,
                   y = value,
                   fill = variable)) +
  geom_point(aes(x = variable,
                 y = value,
                 fill = variable), position = "jitter") +
  #scale_y_continuous(breaks = seq(24, 42, by = 2)) +
     labs(x = "Stock Selections", 
       y = "frequency", 
       fill = "",
       title = "Stock Performance") +
  theme_bw()
```

![](Same_Data_Different_Format_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

```r
ggsave("stock.png")
```


