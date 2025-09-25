# Identifying and handling missing data

This project demonstrates how to **identify and handle missing data** in a dataset using **python** and **pandas**. It shows how to create a sample DataFrame, insert **NaN values**, change **data types**, handle missing values using **0, mean, or median**, manage **duplicate rows**, and perform **basic data mapping**.

## Features

- **Data cleaning and preprocessing**  
  - Creates a sample dataset using **pandas** and **numpy**.  
  - Changes column data types (e.g., `int`, `str`) for consistency.  

- **Identifying missing data**  
  - Detects missing values using `isna()` or `isnull()`.  
  - Summarizes missing data per column and as percentages.  

- **Handling missing data**  
  - Replaces missing values with **0**.  
  - Replaces missing values with **mean** or **median** of the column.  
  - Uses forward fill (`ffill`) and row/column dropping for specific cases.  

- **Duplicate data**  
  - Creates duplicates to simulate real-world scenarios.  
  - Identifies and removes duplicate rows, optionally using a subset of columns.  

- **Mappings**  
  - Maps numeric values to categorical labels using `map()`.  
  - Formats mapped values for better readability.

## Installation

The project can run on a **local python environment** or **Google Colab**. Required libraries:

```bash
!pip install pandas -q --upgrade
!pip install numpy -q --upgrade
```

## Main Structure

- **Data preprocessing**  
  - Creates a sample DataFrame with random values.  
  - Converts data types (int and str) for columns as needed.  

- **Identifying missing data**  
  - Introduces NaN values in specific cells.  
  - Uses `isna()` and `isnull()` to detect missing entries.  
  - Computes the number and percentage of missing values per column.  

- **Handling missing data**  
  - Fills missing values with 0, mean, or median.  
  - Applies forward fill (`ffill`) or drops rows/columns with missing data.  

- **Duplicate data**  
  - Creates duplicates and checks for them using `duplicated()`.  
  - Removes duplicates entirely or based on a subset of columns.  

- **Mappings**  
  - Maps numeric codes to categorical labels.  
  - Formats mapped values for display.  

## Configuration
- Ensure the input dataset (if using real data) is available locally or via URL.
- Adjust the strategy for handling missing values (0, mean, median, `ffill`) according to dataset requirements.
- Update mapping dictionaries for categorical columns as needed.

## Notes
- This project is designed as a prototype for cleaning and preprocessing datasets.
- Large datasets may require sufficient memory for pandas operations.
- Correct handling of missing data and duplicates is critical for accurate downstream analysis.

## License
This project is licensed under the MIT License. You are free to use, modify, and distribute it as needed.