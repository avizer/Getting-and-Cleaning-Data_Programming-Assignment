# Getting-and-Cleaning-Data_Programming-Assignment
This repository contains the R script and documentation needed to complete the Week 4 Programming Assignment of Coursera's "Getting and Cleaning Data" course.

OVERVIEW
- One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

RAW DATA
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

INSTRUCTIONS

1)Paste the following Raw Data Files into your R Working directory:
- X_test
- y_test
- subject_test
- X_train
- y_train
- subject_train
- activity_labels
- features

2)Run the code in "run_analysis.R", this will achieve the following objectives:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data set will be outputted in a file named "Avg_Tidy_Data.txt"
