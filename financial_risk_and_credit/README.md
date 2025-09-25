# Credit risk modeling and analysis

This project demonstrates a **workflow for preprocessing and modeling credit risk data**. It leverages **python**, **pandas**, **numpy**, **seaborn**, **matplotlib**, and **scikit-learn** to perform **data exploration, feature transformation, random forest modeling**, and **evaluation using accuracy and confusion matrices**.

## Features

- **Data loading and inspection**  
  - Loads the dataset using **pandas**.  
  - Inspects the dataset structure, types, and first rows.  
  - Computes basic statistics, value counts, and default rates.  

- **Univariate analysis**  
  - Generates bar plots for categorical features.  
  - Generates histograms for numeric features.  
  - Handles negative or invalid values in numeric columns.  

- **Bivariate analysis**  
  - Analyzes relationships between explanatory variables and default rates.  
  - Computes and plots the proportion of defaulters by groups.  

- **Feature engineering**  
  - Converts categorical features into dummy/one-hot encoded variables.  
  - Drops redundant categories to avoid multicollinearity.  

- **Modeling**  
  - Splits data into **training** and **test sets**.  
  - Trains **Random Forest classifiers** with different numbers of trees.  
  - Evaluates models using **accuracy** and **confusion matrices**.  

- **Evaluation**  
  - Calculates **accuracy**, **false positive rate**, and **true positive rate**.  
  - Demonstrates the financial interpretation of the confusion matrix.  

## Requirements

This project uses the following python libraries:

````python
import pandas as pd

import seaborn as sns
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn import metrics
from sklearn.ensemble import RandomForestClassifier
````

## Main Structure

- **Data preprocessing**  
  - Loads data and inspects types, missing values, and general structure.  
  - Converts column types as necessary (e.g., `int`, `str`).  

- **Data exploration**  
  - Performs univariate and bivariate analysis using bar charts, histograms, and line plots.  
  - Handles invalid values and negative durations.  

- **Feature transformation**  
  - Converts categorical variables to dummy variables.  
  - Drops redundant categories to avoid dummy variable trap.  

- **Model training and evaluation**  
  - Splits data into training and test sets.  
  - Trains **random forest** models with different hyperparameters.  
  - Computes **accuracy** and **confusion matrices**.  

## Configuration

- Ensure the input dataset (`dataset.csv`) is available locally or via URL.  
- Adjust Random Forest hyperparameters (e.g., number of trees) for experimentation.  
- Modify categorical encoding strategy if new categories are added.  

## Notes

- This project is designed as a **prototype workflow** for credit risk modeling.  
- Large datasets may require additional memory for one-hot encoding and model training.  
- Proper evaluation and interpretation of model results are critical for credit risk decisions.  

## License

This project is licensed under the **MIT License**. You are free to use, modify, and distribute it as needed.
