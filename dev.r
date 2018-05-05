library(dplyr)
library(readr)
#read test set data
testx<-read_fwf("./dataset/test/X_test.txt", fwf_widths(c(rep(16,561))), na = c("", "NA"))
print(dim(testx))
testy <- read_fwf("./dataset/test/y_test.txt",fwf_positions(1,1))
print("test_Y dim ")
print(dim(testy))
testsub <- read_fwf("./dataset/test/subject_test.txt",fwf_positions(1,1))
print("subject test dim ")
print(dim(testsub))

# read training set data
trainx<-read_fwf("./dataset/train/X_train.txt", fwf_widths(c(rep(16,561))), na = c("", "NA"))
print(dim(trainx))
trainy <- read_fwf("./dataset/train/y_train.txt",fwf_positions(1,1))
print("train_Y dim ")
print(dim(trainy))
trainsub <- read_fwf("./dataset/train/subject_train.txt",fwf_positions(1,1))
print("subject train dim ")
print(dim(trainsub))

## read features.txt
feat <- readLines("./dataset/features.txt")
## assign column names to testx and trainx
names(testx)<-c(feat)
names(trainx)<-c(feat)
names(testsub)<-c("subject")
names(trainsub)<-c("subject")
names(testy)<-c("activity")
names(trainy)<-c("activity")

# add the subject column to each test and train set
testx<- rbind(testsub,testx)
trainx <- rbind(trainsub,trainx)
testx<- cbind(testx,testy)
trainx <- cbind(trainx,trainy)

# add rows of test and train together


