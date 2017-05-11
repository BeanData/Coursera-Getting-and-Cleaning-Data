# Getting and Cleaning Data - Codebook
This code book summarizes the resulting data fields in `tidy.txt`. 

## Data Source
A full description of the data used in this project can be found at [the UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and 
[the source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The script `run_analysis.R` performs 5 steps described in the course project's definition:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables
* The downloaded files contains the variable `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test`.
* `x_data`, `y_data` and `subject_data` merged by the previous variables.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_sd`
* `activity` contains the correct names for the `y_data` dataset.
* `all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
*  Finally, `average` contains the relevant mean which will be used in a `tidydata.txt` file.







