
# Sentiment analysis on portuguese texts with NLP and machine learning

This project implements an **end-to-end workflow** for preprocessing, analyzing, and classifying **portuguese text data**. It leverages **python**, **nltk**, **scikit-learn**, and **wordcloud** to perform **text cleaning, tokenization, feature extraction**, and **logistic regression classification**, providing insights into text sentiment.

## Features

- **Data cleaning and preprocessing**  
  - Removes **accentuation** from text using `unidecode`.  
  - Tokenizes text and removes **punctuation and stopwords**.  
  - Performs **stemming** to normalize words.  

- **Feature extraction**  
  - Generates **Bag-of-Words** and **TF-IDF vectors**.  
  - Supports **n-grams** to capture word sequences (1-gram and 2-gram).  
  - Creates **wordcloud visualizations** for positive and negative sentiments.  

- **Machine learning classification**  
  - Uses **logistic regression** to classify text sentiment.  
  - Trains and evaluates models on different text preprocessing stages.  
  - Computes **accuracy metrics** for each feature representation.  
  - Analyzes **feature importance** to interpret model decisions.  

- **Visualization**  
  - Generates **bar plots** of top frequent words.  
  - Creates **wordclouds** for quick insights into positive and negative feedback.

## Installation

The project can run on **Google Colab** or a local python environment. Required libraries:

```bash
!pip install unidecode -q --upgrade
!pip install nltk -q --upgrade
```
Ensure NLTK resources are downloaded before running the project:

```python
nltk.download('stopwords', 'punkt', 'rslp', 'punkt_tab')
````

## Main Structure

- **Data preprocessing**  
  - Cleans text by removing accents, punctuation, and stopwords.  
  - Performs stemming and tokenization using **NLTK**.  

- **Feature engineering**  
  - Generates **Bag-of-Words** and **TF-IDF matrices**.  
  - Supports **n-grams** to enhance context representation.  

- **Model training and evaluation**  
  - Splits data into training and test sets using `train_test_split`.  
  - Trains **logistic regression** models on different feature sets.  
  - Computes accuracy and visualizes feature importance.  

- **Visualization**  
  - Creates **wordclouds** for positive and negative sentiment words.  
  - Generates frequency bar plots for top words.


## Configuration

- Ensure the input dataset (`imdb-reviews-pt-br.csv`) is available locally or via URL.
- Update column names in the preprocessing and classification functions if needed.
- Adjust `max_features` or `ngram_range` in vectorizers for experimentation.
- Configure plotting parameters (e.g., figure size, color palette) for custom visualizations.

## Notes
- This project is designed as a **prototype** for sentiment analysis in portuguese.
- Large datasets may require sufficient memory to handle TF-IDF and n-gram feature matrices.
- Accuracy depends on preprocessing choices and vectorization parameters.

## License
This project is licensed under the **MIT License**. You are free to use, modify, and distribute it as needed.

