# Tuberculosis Analysis ----

# Load required libraries
library(tidyverse)
library(lubridate)
library(foreign)
library(descr)
library(ggpubr)

# Variables for TB tabulation ----
tb_vars <- c("NU_ANO","ID_MUNICIP","DT_DIAG","NU_IDADE_N","CS_SEXO",
             "CS_GESTANT","CS_RACA","CS_ESCOL_N","ID_MN_RESI","TRATAMENTO",
             "RAIOX_TORA","FORMA","EXTRAPU1_N","AGRAVAIDS","AGRAVALCOO",
             "AGRAVDIABE","AGRAVDOENC","BACILOSC_E","CULTURA_ES","HIV",
             "DT_INIC_TR","TRAT_SUPER","SITUA_ENCE","BENEF_GOV","AGRAVDROGA",
             "AGRAVTABAC","TEST_MOLEC","NU_CONTATO","NU_COMU_EX","ANT_RETRO",
             "TEST_SENSI")

# General import ----
tb <- read.dbf("TUBENET.dbf", as.is = TRUE) |> 
  select(all_of(tb_vars))

head(tb)

# Extract year of treatment start
tb$anotrat <- year(tb$DT_INIC_TR)
tb$anotrat <- as.character(tb$anotrat)

# Extract year of diagnosis
tb$anodiag <- year(tb$DT_DIAG)

# Filter for residents of specific municipality
tb <- filter(tb, tb$ID_MN_RESI == "330455")

# Filter for treatment starting from 2012
tb <- filter(tb, tb$anotrat > 2011)

# Remove cases with specific diagnosis changes ----
tb <- replace_na(tb, list(SITUA_ENCE = '99'))  # Replace NA with '99'
tb <- filter(tb, SITUA_ENCE != "6")            # Exclude code 6

# Corrections of variable content can be added below
