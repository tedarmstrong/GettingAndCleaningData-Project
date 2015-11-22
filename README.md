# GettingAndCleaningData-Project
Data project on smartphone accelerometer measurments
Data set from Human Activity Recognition Using Smartphones Dataset which can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Further info at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Summary of run_analysis.R

The data files from both the training set and the testing set are read in and combined together

With both data.frames combined, we then tidy the data
```{r}
#First we create a vector of all the names we will use for columns, getting our descriptive names from the features dataset
name_map <- c("subject","activity",as.character(features$V2))
#Change the non-descript column names to the descriptive names in our name vector
names(full_data) <- name_map
#We next change the new column names to valid column names for later manipulation
valid_column_names <- make.names(names=names(full_data), unique=TRUE, allow_ = TRUE)
names(full_data) <- valid_column_names
#Trim down the full_data set, including only our subject and activity columns, and any columns including mean and standard deviation measurements
full_data <- full_data[(grepl("subject",names(full_data)) | grepl("activity",names(full_data)) | grepl("[Mm]ean",names(full_data)) | grepl("std",names(full_data)))]
#Finally, we replace the non-descript activity code with the description of the activity taken from the activity_labels dataset
for(i in 1:nrow(activity_labels)) {
  full_data$activity[full_data$activity == activity_labels$V1[i]] <- tolower(as.character(activity_labels$V2[i]))
}
```

With the data set now tidy, we create a new, smaller, summarized data.frame
```{r}
#From our tidy data set, we group_by subject and activity, in order to create a smaller, tidy summary dataset
group_data <- group_by(full_data, subject,activity)
summary_data <- summarize_each(group_data,funs(mean))
```

Finally, we create a .txt file of this final, tidy, summarized data.frame
```{r}
#Write the final data set to a .txt file
write.table(summary_data, file = "accelerometer_project.txt", row.names = FALSE)
```