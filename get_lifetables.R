## Code to extract US state life tables from the Human Mortality Database's United States Mortality database
## Download the life tables from: https://usa.mortality.org/ 

library(tidyverse)

states <- list.files("lifetables/States")

# read in all the state life tables and create one big dataframe with all states

lt_male <- c()
lt_female <- c()


for(i in 1:length(states)){
  folder_path <- paste0("lifetables/States/",states[i])
  state_male <- read_csv(paste0(folder_path, "/", states[i], "_mltper_1x1.csv"))
  state_female <- read_csv(paste0(folder_path, "/", states[i], "_fltper_1x1.csv"))
  
  lt_male <- rbind(lt_male, state_male)
  lt_female <- rbind(lt_female, state_female)
  
  rm(state_male)
  rm(state_female)
}

write_csv(lt_male, "lt_male.csv")
write_csv(lt_female, "lt_female.csv")


