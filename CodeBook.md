---
title: "CodeBook"
author: "Marcos Pérez"
date: "19/6/2020"
output: html_document
---

## Subject identification

The files subject_train.txt and subject_test.txt contain the subject identification, I read the data and named the unique column as "id".

id: "The id od the subjects"

## The Activities

The file activity_labels.txt has the codification of the activities and the description of the activities. I named:

CodeAct: "The codification of the activities (first column)"
Activity: "The description of the activities (first column)"

The files y_train.txt and y_test.txt contain the activities codifications and I named "CodeAct".



## Measurements variables

The files X_train.txt and X_test.txt has the numeric data (measurements variables) for trainig and test respectively.

The file features.txt contain the description of the measurements variables. I used it to named the variables but I replaced:
"," by "."
"(" by "."
"-" by "."
"(" by "."
")" by "."
for a good names.

```{r}
names(train.x) <- features$V2 %>% gsub(",|-|\\(|\\)", "\\.",.)  %>% gsub("\\.\\.","\\.",.) %>% 
                    gsub("\\.\\.","\\.",.) %>% gsub("\\.$","",.)
                    
names(test.x) <- features$V2 %>% gsub(",|-|\\(|\\)", "\\.",.)  %>% gsub("\\.\\.","\\.",.) %>% 
                    gsub("\\.\\.","\\.",.) %>% gsub("\\.$","",.)
```


## Final Tidy Data

I joined subject, activities and measurements of training and test, separately. Then, I join training tidy data and test tidy data. I named the variables as I described earlier.


## Results

I putted the mean and standard deviation of every measurement variable in the dataframe "vars mean_sd".

I putted the mean of every measurement variable by activity in the dataframe "ActData".

Thank you!
