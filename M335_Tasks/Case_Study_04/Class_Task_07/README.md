starwars %>%
  select(name:mass, gender, species) %>%
  mutate(
    type = case_when(
      height > 200 | mass > 200 ~ "large",
      species == "Droid"        ~ "robot",
      TRUE                      ~  "other"
    )
  )
  
take all comlumns between name mas, gender, species then make(mutate) a new data set means if you have height > 200 or mass > 200 its name is now Large, if you it has the species "Droid" its name is now robot, if anything else its name is Else. TRUE means everything that hasn't been named gets the name Else. Order matters in a case_when statement.