---
title: "Code Book "
author: "German Romero Acevedo"
output: html_notebook
editor_options: 
  chunk_output_type: inline
---

The following document will explain in detail the steps taken in ```run_analysis.R ``` to tidy the data provided and produce the "Assingment_table.txt" in the repository. 

1.  **DOWNLOAD DOCUMENTATION FROM THE WEB**
    * The data was downloaded from the provided URL in the course website and store in a folder called ```UCI HAR Dataset```. 

***

2.  **ASSINGMENT OF VARIABLES TO THE DATA IN THE FOLDER**
    * ```features <- features.txt```: 561 observations of 2 variables.
    * ```activities <- activity_labels.txt```: 6 observations of 2 variables.
    * ```subject_test <- subject_test.txt```: 2947 observations of 1 variable.
    * ```x_test <- x_test.txt```: 2947 observations of 561 variables.
    * ```y_test <- y_test.txt```: 7352 observations of 1 variable.
    * ```subject_train <- subject_train.txt```: 7352 observations of 1 variable.
    * ```x_train <- x_train.txt```: 7352 observations of 561 variables.
    * ```y_train <- y_train.txt```: 7352 observations of 1 variable.

***    

3.  **MERGE BOTH THE TRAINING AND TEST DATASETS TO CREATE ONE DATASET**
    * Using the ```rbind()``` function, datasets ```x_train``` and ```x_test``` are mergerd to create ```X```: 10299 observations of 561 variables.
    * Using the ```rbind()``` function, datasets ```y_train``` and ```y_test``` are merged to create ```Y```: 10299 observations of 1 variable. 
    * Using the ```rbind()``` function, datasets ```subject_test``` and ```subject_train``` are merged to create ```subject```: 10299 observations of 1 variable.
    * Using the ```rbind()``` function, datasets ```subject```, ```X``` and ```Y``` are merged to create ```Merged_data```: 10299 observations of 3 variables. 
    

```{r}
plot(cars)
```

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.
