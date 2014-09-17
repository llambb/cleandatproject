## Getting & Cleaning Data - Smartphone Data Project
library(dplyr)



getfile <- function() {
     destfile <- "smartph.zip"
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     if (!file.exists(destfile)) {
          download.file(url,destfile, mode="wb")
          unzip(destfile)
          
     }
}

if(1==0){
## load data
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labs <- read.table("./UCI HAR Dataset/activity_labels.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
}

## set colnames and fit data frames together
## because of the dimensions of the data, 
## X_train - 7352 x 561       X_test - 2947 x 561
## subject_train - 7352 x 1   subject_test - 2947 x 1
## y_train - 7352 x 1         y_test - 2947 x 1
## features 561 x 2
## and the information in the readme file, the data fits together as follows

colnames(X_train) <- features$V2
colnames(X_test) <- features$V2
colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"
colnames(y_train) <- "activity"
colnames(y_test) <- "activity"

X_train1 <- cbind(X_train, subject_train, y_train)
X_test1 <- cbind(X_test, subject_test, y_test)
fullset <- rbind(X_train1, X_test1)

## now extract only columns that relate to mean and std dev measurements
## while the instructions could be interpreted that some angle measurements 
## containing the word mean should not be included, we err on the side
## of caution by including them, better to have the data and not use it than
## to need it and find it is missing.
## merge activity_labels and remove activity index column, renaming labels as "activity"


smlset <- select(fullset, contains("Mean")) %>%
     cbind(select(fullset, contains("std"))) %>%
     cbind(subject=fullset$subject, activity=fullset$activity) %>%
     merge(activity_labs, by.x="activity", by.y="V1") %>%
     select(-activity)

colnames(smlset)[colnames(smlset) == "V2"] <- "activity"

## group by activity, subject and take average of each variable
smlset <- group_by(smlset, activity, subject)
all_means <- summarise_each(smlset, funs(mean))

write.table(all_means,file="allmeans.txt",row.name=FALSE)


