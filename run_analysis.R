## Cleaning Data Week 4 Quiz
### Steps
#You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.

library(dplyr)
library(readr)

## Clear out workspace
rm(list = ls())

### Step 1. Merge the training and test sets to create one data set
#   read test set data
testx<-read_fwf("./dataset/test/X_test.txt", fwf_widths(c(rep(16,561))), na = c("", "NA"))
print(dim(testx))
testy <- read_fwf("./dataset/test/y_test.txt",fwf_positions(1,1))
print("test_Y dim ")
print(dim(testy))
testsub <- read_fwf("./dataset/test/subject_test.txt",fwf_positions(1,1))
print("subject test dim ")
print(dim(testsub))

#   read training set data
trainx<-read_fwf("./dataset/train/X_train.txt", fwf_widths(c(rep(16,561))), na = c("", "NA"))
print(dim(trainx))
trainy <- read_fwf("./dataset/train/y_train.txt",fwf_positions(1,1))
print("train_Y dim ")
print(dim(trainy))
trainsub <- read_fwf("./dataset/train/subject_train.txt",fwf_positions(1,1))
print("subject train dim ")
print(dim(trainsub))

#   read features.txt
feat <- readLines("./dataset/features.txt")
#   assign column names to testx and trainx
names(testx)<-c(feat)
names(trainx)<-c(feat)
names(testsub)<-c("subject")
names(trainsub)<-c("subject")
names(testy)<-c("activity")
names(trainy)<-c("activity")


# add the subject column to each test and train set
testx<- cbind(testsub,testx)
trainx <- cbind(trainsub,trainx)
# add the activity column to each test and train set
testx<- cbind(testx,testy)
trainx <- cbind(trainx,trainy)

# add rows of test and train together
wholeset<-merge(testx,trainx,all=TRUE)
print(dim(wholeset))