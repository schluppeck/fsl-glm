# set up and get data -----------------------------------------------------

library(tidyverse)
library(janitor)

fname <- "FacePCA_TimingFile_1.csv"
  
data <- read_csv(fname) %>% clean_names()

# group by scalelevel and also get inverted

# example 1: get all the "inverted" trials
#            regardless of other params

TR <- 1.5 # s -- this could change / depends on stimuli

inverted_trials <-  data %>% 
  filter(inverted == 1) %>% 
  select(trstart, trduration) %>% 
  arrange(trstart) %>% 
  transmute(start = trstart *TR,
         duration = trduration *TR,
         level = 1)

# NB TSV not CSV for fsl!
inverted_trials %>% 
  write_tsv("inverted_trials.txt", col_names = FALSE)

# example 2: get all the "non-inverted" trials
#            where scalelevel == 5

level5 <- data %>% 
  filter(scalelevel == 5 & inverted == 0) %>% 
  select(trstart, trduration) %>% 
  arrange(trstart) %>% 
  transmute(start = trstart *TR,
            duration = trduration *TR,
            level = 1)

level5 %>% 
  write_tsv("level5_trials.txt", col_names = FALSE)

