# Load required libraries
library(tidyverse)
library(lubridate)
library(foreign)
library(zoo)
library(ggpubr)

# ------------------ DENGUE DATA ------------------

# Path to DBF files
dengue_path <- 'bases'

# List all DBF files in the folder
dengue_files <- dir(dengue_path, pattern = '*.[dbf|DBF]$', full.names = TRUE)
if(length(dengue_files) == 0) stop('No DBF files found in the dengue directory.')

# Function to read and preprocess each dengue DBF file
read_dengue <- function(file) {
  foreign::read.dbf(file, as.is = TRUE) %>%
    mutate(across(where(is.integer), as.character))
}

# Read all dengue files and combine into one dataframe
dengue_full <- dengue_files %>% map_df(read_dengue)

# Columns to keep
keep_cols <- c("NU_NOTIFIC","ID_AGRAVO","DT_NOTIFIC","SEM_NOT","NU_ANO",
               "SG_UF_NOT","ID_MUNICIP","ID_MN_RESI","DT_SIN_PRI","DT_NASC",
               "NU_IDADE_N","CS_SEXO","CLASSI_FIN","CRITERIO","SOROTIPO",
               "EVOLUCAO","ID_BAIRRO","sem_sint","ano_sint")

# Preprocess dengue data
dengue <- dengue_full %>%
  mutate(
    CLASSI_FIN = ifelse(is.na(CLASSI_FIN), 8, CLASSI_FIN),
    CHAV_NOTIF = paste0(NU_NOTIFIC, ID_AGRAVO, DT_NOTIFIC, ID_MUNICIP),
    ano_sint = year(DT_SIN_PRI),
    sem_sint = week(DT_SIN_PRI)
  ) %>%
  filter(ID_MN_RESI == '330455', CLASSI_FIN != 5, ID_AGRAVO == 'A90') %>%
  tibble() %>%
  select(any_of(keep_cols))

# ------------------ COVID-19 DATA ------------------

# Import SIVEP Amazonas DBF files
AM_2020 <- read.dbf('SIVEP_AM_2020.dbf')
AM_2021 <- read.dbf('SIVEP_AM_2021.dbf')
AM_2022 <- read.dbf('SIVEP_AM_2022.dbf')

# Combine data and create epidemiological variables
UF_AM <- bind_rows(AM_2020, AM_2021, AM_2022) %>%
  mutate(
    SEM_EPI = epiweek(DT_SIN_PRI),
    ANO_EPI = epiyear(DT_SIN_PRI),
    COVID = if_else(CLASSI_FIN == 5 | PCR_SARS2 == 1 | AN_SARS2 == 1, TRUE, FALSE, FALSE)
  )

# Import population data
pop_AM <- read_csv2('pop_AM.csv')
pop_TOTAL <- sum(pop_AM$Total)

# Create epidemiological week dataframe
epi_weeks <- tibble(
  start_week = seq(ymd('2020-03-01'), ymd("2022-08-28"), by = 'week')
) %>%
  mutate(
    ANO_EPI = epiyear(start_week),
    SEM_EPI = epiweek(start_week)
  )

# Count COVID cases and deaths per week
covid_count <- UF_AM %>%
  filter(COVID) %>%
  group_by(ANO_EPI, SEM_EPI) %>%
  count(name = 'covid')

death_count <- UF_AM %>%
  filter(COVID & EVOLUCAO == 2) %>%
  group_by(ANO_EPI, SEM_EPI) %>%
  count(name = 'deaths')

# Merge counts with week dataframe and calculate rates
tab_covid <- epi_weeks %>%
  left_join(covid_count, by = c('ANO_EPI', 'SEM_EPI')) %>%
  left_join(death_count, by = c('ANO_EPI', 'SEM_EPI')) %>%
  filter(start_week >= "2020-03-08", start_week <= "2022-08-06") %>%
  mutate(
    covid_rate = covid / pop_TOTAL * 100000,
    mortality_rate = deaths / pop_TOTAL * 100000,
    week_label = fct_inorder(sprintf('%02d-%4d', SEM_EPI, ANO_EPI))
  )

# Save table as CSV
write_csv2(tab_covid, file = 'covid_table.csv')

# ------------------ COVID-19 PLOTS ------------------

# Cases plot with 4-week moving average
cases_plot <- ggplot(tab_covid, aes(week_label, covid, group = 1)) +
  geom_col(fill = 'dodgerblue4') +
  geom_line(aes(week_label, y = rollmean(covid, 4, fill = TRUE, align = 'center')),
            size = 1.5, color = 'orange') +
  labs(x = "Epidemiological Week", y = "Cases") +
  theme_classic() +
  theme(axis.text.x = element_text(size = 8, angle = 90))

# Deaths plot with 4-week moving average
deaths_plot <- ggplot(tab_covid, aes(week_label, deaths, group = 1)) +
  geom_col(fill = 'darkslategray') +
  geom_line(aes(week_label, y = rollmean(deaths, 4, fill = TRUE, align = 'center')),
            size = 1.5, color = 'tomato1') +
  labs(x = "Epidemiological Week", y = "Deaths") +
  theme_classic() +
  theme(axis.text.x = element_text(size = 8, angle = 90))

# Arrange plots vertically
ggarrange(cases_plot, deaths_plot, nrow = 2)

# Mirror plot of cases and deaths
ggplot(tab_covid, aes(x = start_week)) +
  geom_area(aes(y = covid, fill = "Cases")) +
  geom_area(aes(y = deaths, fill = "Deaths")) +
  scale_fill_manual(values = c("Cases"="#EB9EAE", "Deaths" = "#CB3243"), name='') +
  scale_x_date(date_breaks = '1 month', date_labels = '%b/%y') +
  scale_y_continuous(labels = abs, breaks = seq(-1500, 2500, by = 500)) +
  labs(x="Date", y="Covid-19 Cases and Deaths") +
  theme_classic()

# ------------------ COMORBIDITIES ------------------

# List of comorbidities (do not alter!)
comorbidity_list <- c("Diabetes","Obesity","Immunodepression","Heart Disease","Kidney Disease",
                      "Lung Disease","Other Comorbidities","Neurological Disease",
                      "Asthma","Liver Disease","Hematologic Disease")

comorb_data <- UF_AM %>%
  filter(COVID) %>%
  select(ANO_EPI, DIABETES, OBESIDADE, IMUNODEPRE, CARDIOPATI, RENAL, PNEUMOPATI, OUT_MORBI,
         NEUROLOGIC, ASMA, HEPATICA, HEMATOLOGI) %>%
  group_by(ANO_EPI) %>%
  summarise(across(everything(), ~sum(. == '1', na.rm = TRUE)/n()))

comorb_annual <- comorb_data %>%
  pivot_longer(cols = DIABETES:HEMATOLOGI, names_to = 'COMORBIDITY', values_to = 'VALUE') %>%
  mutate(COMORBIDITY = factor(COMORBIDITY, levels = unique(COMORBIDITY), labels = comorbidity_list)) %>%
  filter(!is.na(VALUE))

# Plot comorbidity percentages
ggplot(comorb_annual, aes(fct_reorder(COMORBIDITY, VALUE), VALUE)) +
  geom_col(fill = 'tomato4') +
  coord_flip() +
  scale_y_continuous(labels = scales::percent_format(accuracy = 5L),
                     limits = c(NA,0.27),
                     breaks = seq(0,0.25,by=0.05),
                     expand = c(0,0)) +
  xlab('Comorbidities') +
  ylab('Percentage') +
  facet_wrap(~ANO_EPI) +
  theme_minimal() +
  theme(axis.text = element_text(size=14, color="grey20"),
        axis.title = element_text(size=16, color="grey20"),
        strip.background = element_rect(colour = 'darkblue', fill='gray76'),
        strip.text = element_text(size=18, color="grey20"))

# ------------------ AGE-SEX PYRAMID ------------------

pop_AM2 <- pop_AM %>%
  select(-Total) %>%
  rename(age_group = `Faixa Etária`) %>%
  mutate(age_index = 1:11) %>%
  pivot_longer(cols = c(Masculino, Feminino), names_to = 'sex', values_to = 'pop')

covid_fx <- UF_AM %>%
  filter(COVID & CS_SEXO != 'I') %>%
  mutate(
    age_group = cut(as.numeric(NU_IDADE_N),
                    breaks = c(0,5,10,15,20,30,40,50,60,70,80,120),
                    labels = c("0-4","5-9","10-14","15-19","20-29","30-39",
                               "40-49","50-59","60-69","70-79","80+"),
                    include.lowest = TRUE),
    sex = factor(CS_SEXO, labels = c('Female','Male')),
    EVOLUCAO = ifelse(is.na(EVOLUCAO) | EVOLUCAO %in% c(3,9), 1, EVOLUCAO)
  ) %>%
  select(sex, age_group, EVOLUCAO, ANO_EPI, SEM_EPI)

# Count cases and calculate rates
count_fx <- covid_fx %>%
  group_by(sex, age_group, EVOLUCAO) %>%
  count(name='cases') %>%
  mutate(age_index = as.numeric(age_group)) %>%
  left_join(pop_AM2, by=c('age_index','sex')) %>%
  mutate(rate = (cases/pop) * 10000) %>%
  filter(!is.na(age_group))

# Plot age-sex pyramid
ggplot(count_fx, aes(x=age_group, y=rate, fill=sex)) +
  geom_bar(data = count_fx %>% filter(sex == 'Male'), stat = "identity") +
  geom_bar(data = count_fx %>% filter(sex == 'Male' & EVOLUCAO == 2),
           stat = "identity", width = 0.5, fill='#000000', alpha=0.4) +
  geom_bar(data = count_fx %>% filter(sex == 'Female') %>% mutate(rate = rate * -1), stat = "identity") +
  geom_bar(data = count_fx %>% filter(sex == 'Female' & EVOLUCAO == 2) %>% mutate(rate = rate * -1),
           stat = "identity", width = 0.5, fill='#000000', alpha=0.4) +
  scale_y_continuous(breaks = seq(-1500,1500,by=500), labels = abs, limits = c(-1500,1500)) +
  scale_fill_manual(name="", values=c("#5274AD","#DC913A","#000000"),
                    breaks=c("Male","Female","Deaths"), labels=c("Male","Female","Deaths")) +
  coord_flip() +
  ylab('Rate per 10,000 inhabitants') + xlab('') +
  theme_light() +
  theme(axis.text = element_text(size=12, color="grey20"),
        axis.title = element_text(size=10, color="grey20"),
        legend.text = element_text(size=14),
        legend.position = 'bottom')
