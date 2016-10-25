Predicting the next word - Data Science Capstone Project
========================================================
author: Arjhun Hariharan
date: 07/12/2014

Methodology
========================================================

These are the following steps that were taken to build the predictive text application.

- Loading and creating a sample of the Corpus from the given dataset (Blogs, News and Twitter)
- Preprocessing the Corpus (removing punctuation, profanity filtering etc.)
- Modelling
- Publishing the app  using Shiny

Preprocessing
========================================================
The following were done as a part of prepreocessing the data:

- Removed punctuations (!?, etc)
- Dealt with the incompatible characters
- Converted to lower case
- Profanity filtering was done
- Removed whitespaces
- Numbers were not removed
- Common English stop words were not removed

Modelling
========================================================

Once the data was preprocessed, 2, 3, 4, 5 and 6 grams were tokenized from the data. With the frequency of the ngrams known along with the number of occurences of words, the ngram probability matrix was formed.

When a phrase or a sentence with 6 words is given, it is split into tokens and the 5-gram probability matrix is searched and the last word of the gram with the highest probability is predicted. If a match is not found in a particular probability matrix, then the next probability matrix, in this case, 4-gram is searched and so on.

If finally, there is no match, the prediction is the word 'the'.

About the app
========================================================
![App Screenshot](app screenshot.jpg)
- Enter the sentence or the phrase for which you want the next word to be predicted in the text box and press 'Submit'.
- The algorithm takes the input and returns the predicted word displayed in the grey box titled 'Prediction'.
- To enter the next sentence or phrase, clear the  inpur text box, type the required input and press 'Submit'.

