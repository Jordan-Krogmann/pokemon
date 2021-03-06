
## Pokemon Prediction <img src="./imgs/charizard.png" align="right" width="120" />

I keep seeing an add from DataCamp’s project [**What Makes a Pokémon
Legendary?**](https://www.datacamp.com/projects/712) … Instead of paying
for it I decided to see if I can do the same type of analysis with the
`tidymodels` workflow.

## Set Up

We will primarily be using the the `tidyverse` and `tidymodels`
packages, so if you don’t have those installed just run the
`install.packages()` functions below.

**Required Packages**:

``` r
# If not installed unncomment below and run
# install.packages("tidyverse", dependencies = TRUE)
# install.packages("tidymodels", dependencies = TRUE)

# if installed load
library(tidyverse)  # plotting and data manipulation
library(tidymodels) # tidy model framework
```

## Data

I have saved a version of the Pokemon data set in my repository that you
can pull into your environemnt using the following code.

``` r
pokemon_df <- read_csv(
  "https://raw.githubusercontent.com/Jordan-Krogmann/pokemon/master/data/pokemon.csv"
  ) %>%
as_tibble() %>%
mutate(
  type2 = case_when(
    is.na(type2) ~ "none",
    TRUE ~ type2
  )
) %>%
mutate(
  two_types_flag = case_when(
    type2 == "none" ~ 0,
    TRUE ~ 1
  )
) %>% 
  mutate(
    bug_type      = case_when(type1  == "bug" | type2 == "bug" ~ 1, TRUE ~ 0),
    dark_type     = case_when(type1  == "dark" | type2 == "dark" ~ 1, TRUE ~ 0),
    dragon_type   = case_when(type1  == "dragon" | type2 == "dragon" ~ 1, TRUE ~ 0),
    electric_type = case_when(type1  == "electric" | type2 == "electric" ~ 1, TRUE ~ 0),
    fairy_type    = case_when(type1  == "fairy" | type2 == "fairy" ~ 1, TRUE ~ 0),
    fighting_type = case_when(type1  == "fighting" | type2 == "fighting" ~ 1, TRUE ~ 0),
    fire_type     = case_when(type1  == "fire" | type2 == "fire" ~ 1, TRUE ~ 0),
    flying_type   = case_when(type1  == "flying" | type2 == "flying" ~ 1, TRUE ~ 0),
    ghost_type    = case_when(type1  == "ghost" | type2 == "ghost" ~ 1, TRUE ~ 0),
    grass_type    = case_when(type1  == "grass" | type2 == "grass" ~ 1, TRUE ~ 0),
    ground_type   = case_when(type1  == "ground" | type2 == "ground" ~ 1, TRUE ~ 0),
    ice_type      = case_when(type1  == "ice" | type2 == "ice" ~ 1, TRUE ~ 0),
    normal_type   = case_when(type1  == "normal" | type2 == "normal" ~ 1, TRUE ~ 0),
    poison_type   = case_when(type1  == "poison" | type2 == "poison" ~ 1, TRUE ~ 0),
    psychic_type  = case_when(type1  == "psychic" | type2 == "psychic" ~ 1, TRUE ~ 0),
    rock_type     = case_when(type1  == "rock" | type2 == "rock" ~ 1, TRUE ~ 0),
    steel_type    = case_when(type1  == "steel" | type2 == "steel" ~ 1, TRUE ~ 0),
    water_type    = case_when(type1  == "water" | type2 == "water" ~ 1, TRUE ~ 0),
    
  )
```

## EDA

The objective here is to enventually build a series of models that will
predict the likelihood of the pokemon being legendary. The figure below
shows the count of legendary pokemon through each generation.

![](imgs/legendary_by_gen_plt.png)

## Modeling

put stuff here
