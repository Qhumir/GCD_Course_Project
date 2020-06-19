######################################################################################################
################ Getting and Cleaning Data Course Project

######## Libraries

library(dplyr)



######## Data

# Reading features
features <- read.table(file="./UCI HAR Dataset/features.txt")

# Reading labels
act_labels <- read.table(file="./UCI HAR Dataset/activity_labels.txt")

# Reading train data
train.x <- read.table(file="./UCI HAR Dataset/train/X_train.txt")
train.y <- read.table(file="./UCI HAR Dataset/train/y_train.txt")
train.s <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")

# Reading test data
test.x <- read.table(file="./UCI HAR Dataset/test/X_test.txt")
test.y <- read.table(file="./UCI HAR Dataset/test/y_test.txt")
test.s <- read.table(file="./UCI HAR Dataset/test/subject_test.txt")



######## Constructting tidy training data


######## Constructting tidy test data



