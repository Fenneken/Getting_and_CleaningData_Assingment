library(dplyr)

   #Let´s download all the files from the directory needed for this assingment.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

   #On this part of the code we will marge togheter all the data tables that we have just created.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
Merged_data <- cbind(subject, Y, X)

   #As required, for our tidy data set we will only take into consideration those variables representing 
   # the mean or standard deviation of some quantity.
FinalData <- select(Merged_data, subject, code, contains("mean"), contains("std"))

   #Let´s give appropiate names to the activities according to the documentation provided. 
FinalData$code <- activities[FinalData$code, 2]

   #One of the last things we have to do is to change slighlty the name of the columns to make it more readable. 
names(FinalData)[2] <-  "activity"
names(FinalData)<-gsub("Acc", "Accelerometer", names(FinalData))
names(FinalData)<-gsub("Gyro", "Gyroscope", names(FinalData))
names(FinalData)<-gsub("BodyBody", "Body", names(FinalData))
names(FinalData)<-gsub("Mag", "Magnitude", names(FinalData))
names(FinalData)<-gsub("^t", "Time", names(FinalData))
names(FinalData)<-gsub("^f", "Frequency", names(FinalData))
names(FinalData)<-gsub("tBody", "TimeBody", names(FinalData))
names(FinalData)<-gsub("-mean()", "Mean", names(FinalData), ignore.case = TRUE)
names(FinalData)<-gsub("-std()", "STD", names(FinalData), ignore.case = TRUE)
names(FinalData)<-gsub("-freq()", "Frequency", names(FinalData), ignore.case = TRUE)
names(FinalData)<-gsub("angle", "Angle", names(FinalData))
names(FinalData)<-gsub("gravity", "Gravity", names(FinalData))

Assingment_table <- FinalData %>% 
  group_by(subject, activity) %>% 
  summarise_all(funs(mean))

write.table(Assingment_table, "Assingment_table.txt", row.name=FALSE)
