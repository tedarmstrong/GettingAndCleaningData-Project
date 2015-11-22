#Script to collect, aggregate and produce tidy data set from Human Activity Recognition Using Smartphones Dataset
#Script assumes you are in UCI Har Dataset folder, created from unzipping file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Script uses dplyr package
library(dplyr)

#Store current dir
source_dir <-getwd()

#Read in the activity_labels and features .txts
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

#Change dir to /test and read in test datasets
setwd(paste0(source_dir,"/test"))
X_test <- read.table("X_test.txt")
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
#Combine _test data.frames to create test data.frame with first column subject_id, second column activity_id, and following columns recorded measurements
test <- cbind(subject_test,y_test) %>% cbind(X_test)

#Change dir to /train and read in train datasets
setwd(paste0(source_dir,"/train"))
X_train <- read.table("X_train.txt")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
#Combine _train data.frames to create train data.frame with first column subject_id, second column activity_id, and following columns recorded measurements
train <- cbind(subject_train,y_train) %>% cbind(X_train)

#Return to starting dir
setwd(source_dir)

#Combine the two previously aggregated data.frames test and train into the full data.frame
full_data <- rbind(test,train)

#Now that full data frame has been created it is time to tidy it up

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

#From our tidy data set, we group_by subject and activity, in order to create a smaller, tidy summary dataset
group_data <- group_by(full_data, subject,activity)
summary_data <- summarize_each(group_data,funs(mean))

#Write the final data set to a .txt file
write.table(summary_data, file = "accelerometer_project.txt", row.names = FALSE)