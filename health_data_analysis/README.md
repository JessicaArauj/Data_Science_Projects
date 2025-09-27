# Epidemiological data analysis

This repository contains multiple projects focused on **epidemiological data analysis** for **dengue, covid-19 and tuberculosis**, demonstrating **data preprocessing, statistical summaries, and visualization of public health datasets**. Each project is self-contained and includes code, sample datasets, and detailed documentation.

## Overview

### Dengue

- **Focus:** Analyze dengue notifications, weekly epidemiological trends and incidence rates.  
- **Highlights:**  
  - Reads and combines multiple DBF files for different years.  
  - Preprocesses data including symptom week and year extraction.  
  - Filters cases by municipality, disease type, and classification.  
  - File: `dengue_analysis.R`  
  - Tools: **R**, **tidyverse**, **lubridate**, **foreign** and **dygraphs**

### Covid-19

- **Focus:** Analyze Covid-19 cases, deaths, comorbidities and age-sex pyramids.  
- **Highlights:**  
  - Reads SIVEP DBF files for multiple years and merges datasets.  
  - Generates weekly epidemiological tables and calculates incidence/mortality rates.  
  - Produces visualizations: bar charts, moving averages, mirror plots, comorbidity percentages and age-sex pyramids.  
  - File: `covid_analysis.R`  
  - Tools: **R**, **tidyverse**, **lubridate**, **foreign**, **zoo** and **ggpubr**

### Tuberculosis

- **Focus:** Analyze Tuberculosis notifications, treatment initiation and demographics.  
- **Highlights:**  
  - Reads TB dataset from DBF format and selects relevant variables.  
  - Extracts treatment start year and diagnosis year.  
  - Filters by municipality and treatment year.  
  - Performs preprocessing for missing values and diagnostic changes.  
  - File: `tuberculosis_analysis.R`  
  - Tools: **R**, **tidyverse**, **lubridate**, **foreign**, **descr** and **ggpubr**

## How to use

```bash
git clone https://github.com/JessicaArauj/Data_Science_Projects
```

2. Navigate to the project folder of interest:

```bash
cd health_data_analysis
```

3. Open the R script or R Markdown file and run the code step by step in RStudio or another R environment.

## Notes

- Projects are designed for learning, experimentation, and reporting purposes.  
- Large datasets may require sufficient memory and computation resources.  
- Code is written in **R** and executed using **RStudio**, utilizing standard data analysis and statistical libraries.  

## License

This repository is licensed under the **MIT License**. You are free to use, modify, and distribute the code as needed.