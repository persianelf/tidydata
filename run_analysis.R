#Getting and Cleaning Data Course Project 
#January 2016
# 
##This script works with the UCI HAR Dataset to do the following tasks: 
# 1. Merge training and test data sets
# 2. Generate dataframe with mean and std. dev for each measurment 
# 3. Names activites in the dataset 
# 4. Labels dataset with descriptive variables 
# 5. Creates a 2nd dataset that is the average of each variable 
#    for each subject 

# data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Files structure maintained as downloaded and unziped to folder called UCI HAR Dataset


#load data tables
setwd("~/UCI HAR Dataset")

subjectTest <- read.table("./test/subject_test.txt",header=FALSE)
xTest  <- read.table("./test/x_test.txt",header=FALSE)
yTest <- read.table("./test/y_test.txt",header=FALSE)

subjectTrain <- read.table("./train/subject_train.txt",header=FALSE)
xTrain  <- read.table("./train/x_train.txt",header=FALSE)
yTrain <- read.table("./train/y_train.txt",header=FALSE)

features <- read.table("features.txt", header = FALSE) 
activityLabels <- read.table("activity_labels.txt",header = FALSE)


#combined like data and assign variable names (Task #1 & #3)
yData <- rbind(yTrain, yTest)
xData <- rbind(xTrain, xTest)
subjectData <- rbind(subjectTrain, subjectTest)

names(yData) <- c("Activity")
names(xData) <- features$V2
names(subjectData) <- c("Subject")

df <- cbind(xData, subjectData, yData)
df$Activity <- factor(df$Activity, levels = c(1,2,3,4,5,6), labels=activityLabels$V2)


#Generate data frame with mean and std dev measurements only (Task #2)
mean_sd <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
mean_sd <- c(as.character(mean_sd),"Subject","Activity")
mean_sd_df <- subset(df, select = mean_sd)


#clean up variable names in order to make them more descriptive (Task #4)
#replace df with mean_sd_df in commands below to fix names there if desired

names(df) <- gsub("^t", "Time", names(df))
names(df) <- gsub("^f", "Freq", names(df))
names(df) <- gsub("BodyBody", "Body", names(df))
names(df) <- gsub("tBody", "TimeBody", names(df))
names(df) <- gsub("Mag", "Magnitude", names(df))

#Things left alone Gyro, which means Gyroscope and Acc whcih means Accelerometer
#if those changes are desired use the following commented lines:

#names(df) <- gsub("Gyro", "Gyroscopw", names(df))
#names(df) <- gsub("Acc", "Accelerometer", names(df))


#Creates a 2nd dataset that is the average of each variable for each subject (Task #5)

df2 <- aggregate(. ~Subject + Activity,df,mean)
write.table(df, file="tidydata.txt")



