## Getting and Cleaning Data Project - January 2016

This is the Readme for the course project. Contained in this repo are the run_analysis.R, tidydata.txt, and Codebook.MD.

The goal of this project is to use the obtain and clean the UCI HAR data set and accomplish the following five task: 
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The dataset described in step 5 is found in tidydata.txt in this repo

The source of the data is found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files were downloaded and unziped to a UCI HAR Dataset folder within R's working directory.
Some tweaking of the setwd() command may be needed in order to match up with your system folder structure

Additional variable descriptions can be found in the Codebook.md file. 
