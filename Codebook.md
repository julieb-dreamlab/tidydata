# Week 4 Assignment Codebook
Submission for Coursera: Data Science, Getting and Cleaning Data.

## Submission Requirements
The assignment will be submitted by way of a github repository. The Course provides the data set to clean. UCI HAR Dataset was provided. The task is to write an R programming script to clean and present the data set.

### Deliverables
1.  TidyDataSet.txt 
2.  CodeBook.md
3.  run_analysis.R
4.  Provided source data (UCI HAR Datasets) in the working directory
5.  AssignmentREADME.md  (this document)

##Source for TidyData.txt
Here are the data for the project:

[Link to the Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The source contains a README.txt that gives details of the input data.

##Overview of TidyData.txt
TidyData.txt provides the average of each subjects measurements for each activity that was studied.
The dimensions of the file are 55 rows and 20 columns. The 1st row is the column names.
There are 9 subjects and measurements for each of the 6 activities, for 54 observations.
There are 18 measurements, plus a column for subject ID, and a column for activity type.

### TidyData.txt Variables
The fixed data are the subject and the activity.

| Variable | Description | class | range   |
|----------|-------------|-------|---------|
| subject  | identified an individual whose activity was measured | character | 1 to 9 |
| activity | a particular type of motion that the subject is performing | character | Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying|

The measured data are the sensor outputs from the accelerometer and gyroscope.
These measurements have been reduced to provide an average for each subject for each activity. All variables are derived from g-force measurements that were normalized and bounded within [-1,1]. All variables are stored as doubles. 


| Variable |                                 Description                                |  
|----------|----------------------------------------------------------------------------|
|Average_tBodyAccMagMean | average of the magnitude of a subject's linear acceleration with gravity force removed| 
|Average_tBodyAccMagStd | average of the standard deviation of a subject's linear acceleration with gravity force removed|          
|Average_tGravityAccMagMean |average of the magnitude of a subject's total acceleration | 
|Average_tGravityAccMagStd | average of the standard deviation of a subject's total acceleration |       
|Average_tBodyAccJerkMagMean |average of the magnitude of a subject's total acceleration filtered for jerks |
|Average_tBodyAccJerkMagStd |average of the standard deviation of a subject's total acceleration filtered for jerks |
|Average_tBodyGyroMagMean |average of the magnitude of a subject's angular acceleration with gravity force removed| 
|Average_tBodyGyroMagStd |average of the standard deviation of a subject's angular acceleration with gravity force removed| 
|Average_tBodyGyroJerkMagMean |average of the magnitude of a subject's angular acceleration with gravity force removed filtered for jerks| 
|Average_tBodyGyroJerkMagStd | average of the standard deviation of a subject's angular acceleration with gravity force removed filtered for jerks|     
|Average_fBodyAccMagMean |average of the magnitude of frequency components of a subject's linear acceleration with gravity force removed |
|Average_fBodyAccMagStd | average of the standard deviation of frequency components of a subject's linear acceleration with gravity force removed |
|Average_fBodyBodyAccJerkMagMean |average of the magnitude of frequency components of a subject's linear acceleration with gravity force removed and filtered for jerks |
|Average_fBodyBodyAccJerkMagStd |average of the standard deviation of frequency components of a subject's linear acceleration with gravity force removed and filtered for jerks |
|Average_fBodyGyroMagMean |average of the magnitude of frequency components of a subject's angular acceleration with gravity force removed |
|Average_fBodyBodyGyroMagStd | average of the standard deviation of frequency components of a subject's angular acceleration with gravity force removed |    
|Average_fBodyBodyGyroJerkMagMean | average of the magnitude of frequency components of a subject's angular acceleration with gravity force removed filtered for jerks|
|Average_fBodyBodyGyroJerkMagStd | average of the standard deviation of frequency components of a subject's angular acceleration with gravity force removed filtered for jerks|    


### Data Provided for the Task
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[Link to the Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

