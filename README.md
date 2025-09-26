# Data Science Projects

This repository contains multiple projects in **data science**, demonstrating **data cleaning, exploratory data analysis, predictive modeling and natural language processing**. Each project is self-contained and includes code, sample datasets and detailed documentation.

## Overview

### Automation EDA

- Focus: **Analyzing participants demographics, employability, revenue and program evaluation**.
- Highlights:
  - Explains **participant profiling**, including education, diversity, gender, income, market niche and competitiveness.
  - Shows **employability analysis**, evaluating job creation and visualizing impact with bar charts.
  - Presents **revenue impact analysis**, calculating revenue change per participant, identifying >50% growth and generating bar charts by class.
  - Summarizes **program importance analysis**, aggregating participant ratings and visualizing with pie charts.
  - Tools: **python, pandas, matplotlib, numpy, and reportlab**.


### Data cleaning and treatment 

- Focus: **Identifying, handling, and preprocessing missing or inconsistent data**.
- Highlights:
  - Creates sample datasets with missing or duplicated values.
  - Demonstrates **missing data imputation** using 0, mean, median, or forward fill.
  - Handles **duplicate rows** and maps numeric codes to categorical labels.
  - Tools: **python**, **pandas** and **numpy**.

### Financial risk and credit

- Focus: **Credit scoring and risk assessment**.
- Highlights:
  - Explains the business problem of **credit card default prediction**.
  - Performs **univariate and bivariate analysis** to explore key predictors.
  - Implements **feature engineering** including dummy variable creation.
  - Trains and evaluates **random forest classifiers** to predict default risk.
  - Provides examples of **model evaluation** using accuracy and confusion matrices.
  - Tools: **python**, **pandas**, **seaborn**, **matplotlib** and **scikit-learn**.

### Non-parametric statistics

- Focus: **Applying non-parametric statistical tests on real and synthetic datasets**.
- Highlights:
  - Implements **mcnemar test, binomial test, wilcoxon test, chi-square test and kolmogorov-smirnov test**.
  - Performs **data preprocessing, rank-based analysis and visualization**.
  - Generates **interactive R notebooks** for hypothesis testing and results interpretation.
  - Tools: **R, RStudio and RMarkdown**.

### Sentiment analysis with NLP

- Focus: **Sentiment analysis of Portuguese text data**.
- Highlights:
  - Performs **text preprocessing** (tokenization, stopword removal, stemming).
  - Generates **Bag-of-Words and TF-IDF feature matrices**, including n-grams.
  - Trains **logistic regression models** for sentiment classification.
  - Visualizes results using **WordClouds** and frequency bar plots.
  - Tools: **python**, **NLTK**, **scikit-learn** and **wordcloud**.
 
### SQL BBeaver

- Focus: **Learning and practicing SQL queries and database management**.
- Highlights:
  - Performs **table creation, data insertion, selection, filtering, aggregation, joins, updates and deletes**.
  - Includes **sample scripts** with exercises and solutions.
  - Demonstrates **query optimization and data manipulation** in a structured database environment.
  - Tools: **SQL, BBeaver and SQLite**.

## How to use

1. Clone the repository:

```bash
git clone https://github.com/yourusername/your-repo-name.git
```

2. Navigate to the project folder of interest:

```bash
cd financial_risk_and_credit
```

3. Open the jupyter notebook and run the code step by step.

## Notes

- Each project is designed as a prototype for learning and experimentation.  
- Large datasets may require sufficient memory and computation resources.  
- The code is written in **Python 3** and uses standard data science libraries.  

## License

This repository is licensed under the **MIT License**. You are free to use, modify, and distribute the code as needed.

