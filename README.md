# UCI HAR Dataset
  
The file run_analysis.R takes different files from de UCI HAR Dataset and transforms these into a summary datafile. The various steps executed by the script are described below.
  
### 1. Merge training and test datasets, including labels for variables and levels
  
The dataset consists of Train and Test data. Using the `read.table` command, the script loads different datasets into memory:  
-**subject_test** - loaded from the file "test/subject_test.txt"  
-**subject_train** - loaded from the file "train/subject_train.txt"  
-**x_test** - loaded from the file "test/X_test.txt"  
-**x_train** - loaded from the file "train/X_train.txt"  
-**y_test** - loaded from the file "test/y_test.txt"  
-**y_train** - loaded from the file "train/y_train.txt"  

All of these datasets are transformed to `tbl_df` format for ease of use with dplyr later.

The we bind the columns using the `cbind` command. The script first binds **subject_test**, then **y_test**, and finally **x_test**. It then repeats this for the **train** dataset.

The script then binds together the **Test** and **Train** dataset using the `rbind` command into a dataset called *dat*.

At this point the variables in the dataframa don't have proper names. The script includes these by assigning the values in **"features.txt"** to the `colnames` properties of the *dat* dataset. The script also includes the names for **Subject** and **Activity** to the variables.

Finally, the script changes the levels in the **Activity** variable to those in the **"activity_labels.txt"** file using the `levels` property of that variable.

### 2. Extract only the measurements on the mean and standard deviation

The script creates a new dataset named *dat_mean_sd* that has only the mean and standard deviation for the measurements in *dat*, using the `grep` command with regular expressions **"Subject|Activity|-mean\\(|-std\\("**.

### 3. Create an independent tidy data set with the average of each variable for each activity and each subject

Lastly, the script creates a final dataset named *dat_summary* by piping the commands `group_by` and `summarize_each` using the `%>%` operator. The `group_by` command takes **Subject** and **Activity** as parameters, and `summarize_each` takes **mean** as parameter. 

The script writes *dat_summary* into a file named *Summary.txt* using the `write.table` command.