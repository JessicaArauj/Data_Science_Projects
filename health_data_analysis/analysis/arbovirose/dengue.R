# Dengue Data

# Packages ---------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(dygraphs)


# Dengue Data -----------------------------------------------------------

# The DBF files containing dengue data for various years
# should be placed in a subdirectory called "bases" (lowercase b).
# Make sure there are no other .dbf files in this directory 
# that are not dengue data, and that there are no duplicate files.

path <- 'bases'

files <- dir(path, pattern = '*.[dbf|DBF]$', full.names = TRUE)

if (length(files) == 0) stop('There are no DBF files in this directory')
files

# If you receive the message "Error: There are no DBF files in this directory",
# check the path in the variable "path" and confirm that this directory 
# actually contains the DBF files. Otherwise, you'll get a list of the 
# available files in the specified directory.

# If everything is correct, let's proceed:
# We will create a function to read multiple files without
# the need to read them one by one, then combine them into a single dataset.
# The function will handle all of this.

read_dengue <- function(x) {
  tmp <- foreign::read.dbf(x, as.is = TRUE) %>% 
    mutate(across(where(is.integer), as.character))
  return(tmp)  
}

dengue_full <- files %>% map_df(read_dengue)


# Columns to keep
keep_cols <- c("NU_NOTIFIC","ID_AGRAVO","DT_NOTIFIC","SEM_NOT","NU_ANO","SG_UF_NOT",
               "ID_MUNICIP","ID_MN_RESI","DT_SIN_PRI","DT_NASC","NU_IDADE_N","CS_SEXO",
               "CLASSI_FIN","CRITERIO","SOROTIPO","EVOLUCAO","ID_BAIRRO","sem_sint","ano_sint")

# For tabulation, use week and year (from lubridate) instead of epiweek and epiyear
dengue <- dengue_full %>% 
  mutate(
    CLASSI_FIN = ifelse(is.na(CLASSI_FIN), 8, CLASSI_FIN),
    CHAV_NOTIF = paste0(NU_NOTIFIC, ID_AGRAVO, DT_NOTIFIC, ID_MUNICIP),
    ano_sint = year(DT_SIN_PRI),
    sem_sint = week(DT_SIN_PRI) # add columns for symptom year and symptom week
  ) %>% 
  filter(ID_MN_RESI == '330455' & CLASSI_FIN != 5 & ID_AGRAVO == 'A90') %>%
  tibble() %>% 
  select(any_of(keep_cols))
