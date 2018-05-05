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
#   Use: read_fwf() to import x data sets into data frames, knowing that the width is fixed
#           and the number of columns to expect is 561
#              testx: dim (2947  561)
#              testy: dim (2947    1)
#              testsubj: dim (2947    1)
#              trainx: dim (7352  561)
#              trainy: dim (7352    1)
#              trainsubj: dim (7352    1)
#  Use: read_lines() to import the feature names
#  Use: sapply() and strsplit() to split the feature names are remove the number 
#  Use: names() to apply the column names, testsubj = "subject", testy="activity"
#  Use: rbind()/cbind() to combine the sets to one
#              wholeset: dim (10299  563)
testx<-read_fwf("./dataset/test/X_test.txt", fwf_widths(c(rep(16,561))), na = c("", "NA"))
print(dim(testx))
testy <- read_fwf("./dataset/test/y_test.txt",fwf_positions(1,1))
print("test_Y dim ")
print(dim(testy))
testsubj <- read_fwf("./dataset/test/subject_test.txt",fwf_positions(1,1))
print("subject test dim ")
print(dim(testsubj))

#   read training set data
trainx<-read_fwf("./dataset/train/X_train.txt", fwf_widths(c(rep(16,561))), na = c("", "NA"))
print(dim(trainx))
trainy <- read_fwf("./dataset/train/y_train.txt",fwf_positions(1,1))
print("train_Y dim ")
print(dim(trainy))
trainsubj <- read_fwf("./dataset/train/subject_train.txt",fwf_positions(1,1))
print("subject train dim ")
print(dim(trainsubj))

#   read features.txt
feat <- readLines("./dataset/features.txt")
# Clean up labels, remove the number from the feature names
"542 fBodyBodyGyroJerkMag-mean()"
# get the numbers off, keep the text label
stronly<-sapply(strsplit(feat,split=" "),tail,1)

#   assign column names to testx and trainx
names(testx)<-c(stronly)
names(trainx)<-c(stronly)
names(testsubj)<-c("subject")
names(trainsubj)<-c("subject")
names(testy)<-c("activity")
names(trainy)<-c("activity")

## To build the 'whole set' start with row binding the test and train sets
wholesubj <- rbind(testsubj,trainsubj)
print("subject whole dim ")
print(dim(wholesubj))
wholey<- rbind(testy,trainy)
print("y whole dim ")
print(dim(wholey))
wholex<- rbind(testx,trainx)
print("x whole dim ")
print(dim(wholex))

# add the subject column and the activity column to x set
wholeset<-cbind(wholesubj,wholex,wholey)
print("whole set dim")
print(dim(wholeset))


##  Step 2. Extracts only the measurements on the mean and standard deviation 
#      for each measurement.
#  Use: grep() with a regex pattern to pick the columns with mean/std
#            cols2sel: dim(18 1)
#  Use: dataframe subsetting to extract the mean/std columns
#  Use: cbind() with the subject and activity columns to make meaning data frame
#            msdata: dim (10299 20)
cols2sel<-grep(".(mean|std)[(][)]$",names(testx),value = TRUE)
print("length of the columns with mean/std measurements")
print(length(cols2sel))
msdata<-wholeset[,cols2sel]

msdata<-cbind(wholesubj,msdata,wholey)
print("dimensions of data frame with subject mean/std measurements and activity number")
print(dim(msdata))

##  Step 3. Uses descriptive activity names to name the activities in the data set
#  Use: readLines() to import activity labels
#  Use: sapply() and strsplit() to create the string vector of activities
#  Use: as.character() to coerce the subject value to a string
#  Use: as.character() to coerce the activity value to a string
#  Use: sub() in a for loop to replace the numbers in the activity column (wholey) 
#            with the activity label
#  Use: cbind() to remake the wholeset and msdata sets with the new character activity column
#
#
#   read features.txt
actlab <- readLines("./dataset/activity_labels.txt")
# Clean up labels, remove the number from the feature names
"1 WALKING"
# get the numbers off, keep the text label
actVector<-sapply(strsplit(actlab,split=" "),tail,1)
# convert the activity numeric column to character vector
wholeyChar<-as.character(wholey[[1]])
# loop through each activity, to replace the occurences of each number with the activity
for(i in 1:length(actVector)) {
     wholeyChar <- sub(as.character(i),actVector[i],wholeyChar)
}


# And lastly, fix the subject var, should be character, not numeric
wholesubjChar<-as.character(wholesubj[[1]])

# restore this column to the whole set and the msdata set
wholeset<-cbind(wholesubjChar,wholex,wholeyChar)
print("wholeset dim, now with words for the activity")
print(dim(wholeset))
msdata<-wholeset[,cols2sel]
msdata<-cbind(wholesubjChar,msdata,wholeyChar)
print("dimensions of data frame with subject mean/std measurements and activity names")
print(dim(msdata))

#  Step 4. Appropriately labels the data set with descriptive variable names.
#  Use: names() to assign the appropriate labels in Step 1, and here to fix the activity column
#  Use: sub() and a for loop to remove invalid character strings from the column names
#  Use: as.character() to coerce the subject value to a string
#
#  fix the name of the subject column
names(msdata)[names(msdata) == "wholesubjChar"] <- "subject"
names(wholeset)[names(wholeset) == "wholesubjChar"] <- "subject"
#  fix the name of the activity column
names(msdata)[names(msdata) == "wholeyChar"] <- "activity"
names(wholeset)[names(wholeset) == "wholeyChar"] <- "activity"
# Also fix up the invalid characters in the features labels
# loop through each invalid char, to delete them
invalChar<-c("-m","-s","[(]","[)]")
replaceChar<-c("M","S","","")
msCols<-names(msdata)
wholeCols<-names(wholeset)
for(i in 1:length(invalChar)) {
  msCols <- sub(invalChar[i],replaceChar[i],msCols)
  wholeCols <- sub(invalChar[i],replaceChar[i],wholeCols)
}
names(msdata) <- msCols
names(wholeset) <- wholeCols
print(names(msdata))

# 5. From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.
#  Use: tbl_df() to create the class needed for dplyr tools
msdata_df<-tbl_df(msdata)