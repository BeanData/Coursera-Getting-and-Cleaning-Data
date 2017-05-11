# set working directory
getwd()
setwd("/Users/star/Desktop/Data specialization/Getting & Cleaning Data/")

path <- file.path("UCI HAR Dataset")
list.files(path,recursive=TRUE)

# STEP 1 
# Merge the training and test sets to create one data set
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
xTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
yTest <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
subject_data <- rbind(subjectTrain, subjectTest)
x_data <- rbind(xTrain, xTest)
y_data <- rbind(yTrain, yTest)
dataCombine <- cbind(subject_data, y_data)
data <- cbind(x_data, dataCombine)

# STEP2
# Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt")
mean_and_sd <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_sd]
names(x_data) <- features[mean_and_sd, 2]

# STEP3
# Use descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

# STEP4
# Appropriately label the data set with descriptive variable names
names(subject_data) <- "subject"
all_data <- cbind(x_data, y_data, subject)

# STEP5
# Create a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
average <- aggregate(. ~subject + activity, all_data, mean)
average <- average [order(average$subject, average$activity), ]
write.table(average, file = "tidydata.txt", row.names = FALSE)



