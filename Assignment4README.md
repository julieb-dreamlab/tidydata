# Week 4 Assignment 
Submission for Coursera: Data Science, Getting and Cleaning Data.

## Submission Requirements
The assignment will be submitted by way of a github repository. The Course provides the data set to clean. UCI HAR Dataset was provided. The task is to write an R programming script to clean and present the data set.

### Deliverables
1.  TidyDataSet.txt 
2.  CodeBook.md
3.  run_analysis.R
4.  Provided source data (UCI HAR Datasets) in the working directory
5.  AssignmentREADME.md  (this document)

### Review criteria 
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

### Summary of the step I took to complete the assignment
## Cleaning Data Week 4 Assignment
Steps
You should create one R script called run_analysis.R that does the following.
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set 
      with the average of each variable for each activity and each subject.

Step 1. Merge the training and test sets to create one data set read test set data
   * Use: read_fwf() to import x data sets into data frames, knowing that the width is fixed
           and the number of columns to expect is 561
              testx: dim (2947  561)
              testy: dim (2947    1)
              testsubj: dim (2947    1)
              trainx: dim (7352  561)
              trainy: dim (7352    1)
              trainsubj: dim (7352    1)
  * Use: read_lines() to import the feature names
  * Use: sapply() and strsplit() to split the feature names are remove the number 
  * Use: names() to apply the column names, testsubj = "subject", testy="activity"
  * Use: rbind()/cbind() to combine the sets to one
              wholeset: dim (10299  563)

Step 2. Extracts only the measurements on the mean and standard deviation 
      for each measurement.
  Use: grep() with a regex pattern to pick the columns with mean/std
            cols2sel: dim(18 1)
  Use: dataframe subsetting to extract the mean/std columns
  Use: cbind() with the subject and activity columns to make meaning data frame
            msdata: dim (10299 20)

Step 3. Uses descriptive activity names to name the activities in the data set
  Use: readLines() to import activity labels
  Use: sapply() and strsplit() to create the string vector of activities
  Use: as.character() to coerce the subject value to a string
  Use: as.character() to coerce the activity value to a string
  Use: sub() in a for loop to replace the numbers in the activity column (wholey) 
            with the activity label
  Use: cbind() to remake the wholeset and msdata sets with the new character activity column

Step 4. Appropriately labels the data set with descriptive variable names.
  Use: names() to assign the appropriate labels in Step 1, and here to fix the activity column
  Use: sub() and a for loop to remove invalid character strings from the column names
  Use: as.character() to coerce the subject value to a string

Step 5. From the data set in step 4, creates a second, independent tidy data set 
      with the average of each variable for each activity and each subject.
  Use: tbl_df() to create the class needed for dplyr tools
  Use: group_by() to set up the categories for each subject and activity
  Use:            to compute the averages
  Use: 

### Data Provided for the Task
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[Link to the Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Author

* **JulieB** - [GitHub](https://gist.github.com/julieb-dreamlab)

