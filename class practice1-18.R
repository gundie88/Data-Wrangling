iris %>% 
  group_by(Species) %>% 
  summarise(n = n(), Sepal.Width = mean(Sepal.Width), 
            Sepal.Length = mean(Sepal.Length))


iris %>% 
  group_by(Species) %>% 
    summarise((mean & sd)) %>% 
    summarise_all(funs(mean, sd))


iris %>% arrange(Sepal.Length)
iris %>% arrange(Sepal.Length) %>% slice(1:6)
