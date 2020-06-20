######################################################################################################
################ Getting and Cleaning Data Course Project

######## Libraries

library(dplyr)
library(reshape2)



######## Data

# Reading features
features <- read.table(file="./UCI HAR Dataset/features.txt")

# Reading labels
act_labels <- read.table(file="./UCI HAR Dataset/activity_labels.txt")
act_labels <- rename(act_labels, CodeAct = V1, Activity = V2)

# Reading train data
train.x <- read.table(file="./UCI HAR Dataset/train/X_train.txt")
train.y <- read.table(file="./UCI HAR Dataset/train/y_train.txt")
train.s <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")

# Reading test data
test.x <- read.table(file="./UCI HAR Dataset/test/X_test.txt")
test.y <- read.table(file="./UCI HAR Dataset/test/y_test.txt")
test.s <- read.table(file="./UCI HAR Dataset/test/subject_test.txt")



######## Constructting tidy training data

# Change to describing names
names(train.x) <- features$V2 %>% gsub(",|-|\\(|\\)", "\\.",.)  %>% gsub("\\.\\.","\\.",.) %>% 
                    gsub("\\.\\.","\\.",.) %>% gsub("\\.$","",.)

# rename and join training data
train <- cbind(rename(train.s, id = V1), rename(train.y, CodeAct = V1), train.x)



######## Constructting tidy test data

# Change to describing names
names(test.x) <- features$V2 %>% gsub(",|-|\\(|\\)", "\\.",.)  %>% gsub("\\.\\.","\\.",.) %>% 
  gsub("\\.\\.","\\.",.) %>% gsub("\\.$","",.)

# rename and join test data
test<- cbind(rename(test.s, id = V1), rename(test.y, CodeAct = V1), test.x)



######## 1. Merges the training and the test sets to create one data set.

Data <- rbind(train, test)



######## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

meltData <- melt(Data, id = c("CodeAct", "id"),measure.vars = names(test.x))
vars_mean_sd <- do.call(rbind,lapply(split(meltData,meltData$variable), summarize, 
                  mean = mean(value), sd = sd(value)))



######## 3. Uses descriptive activity names to name the activities in the data set.

# The columns names of act_labels were changed before the first step
Data <- merge(act_labels, Data, by = "CodeAct")



######## 4. Appropriately labels the data set with descriptive variable names.

# It was done before the first step



######## 5. From the data set in step 4, creates a second, independent tidy data set with the average
#           of each variable for each activity and each subject.

meltData <- melt(Data, id = c("CodeAct", "Activity", "id"),measure.vars = names(test.x))
ActData <- dcast(meltData, Activity ~ variable, mean)

save(tidyData=Data,file="tidyData.RData")
