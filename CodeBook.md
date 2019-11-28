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
    
***

4. **EXTRACTION OF THE MEAN AND STANDARD DEVIATION OF EACH MEASURMENT**
   * ```FinalData``` is created by selecting from ```Merged_data``` only those variables which contain in their name the strings ```"mean"``` and       ```"std"``` and the columns subject and code.
   
***
   
5. **USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATASET**
   * The code numbers found in the variable ```code``` in ```FinalData``` are replaced with the name of their respective activities using the data set ```activities```.
  
***

6. **Appropiately label the dataset with descriptive variable names**
   * ```code``` column was renamed ```activities```
   * All ```Acc``` in column´s name were replaced by ```Accelerometer```.
   * All ```Gyro``` in column´s name were replaced by ```Gyroscope```.
   * All ```BodyBody``` in column´s name were replaced by ```Body```. 
   * All ```Mag``` in column´s name were replaced by ```Magnitude```.
   * All ```^t``` in column´s name were replaced by ```Time```.
   * All ```^f``` in column´s name were replaced by ```Frequency```. 
   * All ```tBody``` in column´s name were replaced by ```TimeBody```.
   * All ```-mean()``` in column´s name were replaced by ```Mean```.
   * All ```-std()``` in column´s were replaced by ```STD```.
   * All ```-freq()``` in column´s were replaced by ```Frequency```.
   * All ```angle``` in column´s name were replaced by ```Angle```.
   * All ```gravity``` in column´s name were replaced by ```Gravity```.
   
***

7. **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**   
   * ```Assingment_table``` is created by finding the mean and standard deviation of each subject and activity after being grouped by the R function ```group_by()```.
   * Create document Assingment_table.txt from ```Assingment_table```.
