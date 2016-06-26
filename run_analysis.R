# 1. Merges the training and the test sets to create one data set.

# Load test and train the datasets into R variables
library(dplyr)
subject_test <- tbl_df(read.table("test/subject_test.txt", colClasses = "factor"))
subject_train <- tbl_df(read.table("train/subject_train.txt", colClasses = "factor"))
x_test <- tbl_df(read.table("test/X_test.txt"))
x_train <- tbl_df(read.table("train/X_train.txt"))
y_test <- tbl_df(read.table("test/y_test.txt", colClasses = "factor"))
y_train <- tbl_df(read.table("train/y_train.txt", colClasses = "factor"))

# Bind columns for both test and train datasets
test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)

# Bind rows of test and train datasets
dat <- tbl_df(rbind(train, test))

# Include descriptive names of features in dataset
features <- tbl_df(read.table("features.txt"))
colnames(dat) <- c("Subject", "Activity", as.character(features$V2))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# dat_mean_sd <- select()

# 3. Uses descriptive activity names to name the activities in the data set


# 4. Appropriately labels the data set with descriptive variable names.

# names

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# summary