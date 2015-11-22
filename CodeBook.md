---
title: "CodeBook"
author: "tedarmstrong"
date: "November 20, 2015"
output: html_document
---

## Project Description
A tidied collection of data from the Human Activity Recognition Using Smartphones Dataset.  The Dateset collected accelerometer and gyroscope information from volunteers in various kinds of activity.  This project collects the mean and std portions of those measurements for all volunteers across all activities and combines them in a single, tidy dataframe.  It then produces a tidy summary of that data.

##Study design and data processing

###Collection of the raw data
As per the README provided with the Human Activity Recognition Using Smartphones Dataset, "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually."

###Notes on the original (raw) data 
Additional information from the README: "The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

##Creating the tidy datafile

###Guide to create the tidy data file
A description of the dataset can be found:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

All data and files from the original dataset are contained in the zip:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The UCI HAR Dataset folder contains a readme description of the dataset, as well as a description of the structure of the files.  The folder contains a features.txt which maps the generic numbered headers to the actuall measurements, and an activity_labels.txt, which maps generically numbered "activities" to the actual WALKING, LAYING, etc activities performed by the volunteers. The two folders contain files from the randomly divided grouping of volunteers into a training group and a test group.

The test and train folders each contain three .txt files: an X-test/X-train file, containing all 561 measurement variables, each with thousands of observations.  The subject-test/subject-train files give a mapping of which volunteer was measured in each observation in the X files, and the y-test/y-train files give a mapping of which activity the volunteer was engaged in for each observation in the X files.

The files in the Inertial Signals folders are not utilized in this project.

###Cleaning of the data
1) Read the necessary files into R with read.table()
2) Prefixed the train and test datasets with their respective subjects and activities
3) Combined train and test datasets into one large dataset
4) Translated the nondescripted activity codes to the actual activity (ie from 1 to WALKING)
5) Changed the column names to clear, valid descriptions (ie from V1 to subject)
6) Created a summary dataset by grouping subject and activity
7) Wrote a .txt file of the summarized data

##Description of the variables in the tidy data file
The mean measurements from 30 subjects performing 6 different activities:
 - 180 obs. of 88 variables
 - Variables include subject by id, activity by description, and means of multiple measurements

###subject
ID designating which subject was measured
 - Integer
 - 30 different subjects, numbered from 1:30

####Notes subject:
All observations are grouped by which subject was measured

###activity
Activity measured while wearing smartphone
 - Character
 - 6 different activities measured (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING)

####Notes activity:
All observations are grouped by which activity the subject performed while being measured

###tBodyAcc.mean...X
Body acceleration mean in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyAcc.mean...Y
Body acceleration mean in y direction
 - Numeric
 - Mean from normalized measurements

###tBodyAcc.mean...Z
Body acceleration mean in z direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyAcc.std...X
Body acceleration std in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyAcc.std...Y
Body acceleration std in y direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyAcc.std...Z
Body acceleration std in z direction
 - Numeric
 - Mean from normalized measurements
 
###tGravityAcc.mean...X
Gravity acceleration mean in x direction
 - Numeric
 - Mean from normalized measurements

###tGravityAcc.mean...Y
Gravity acceleration mean in x direction
 - Numeric
 - Mean from normalized measurements
 
###tGravityAcc.mean...Z
Gravity acceleration mean in z direction
 - Numeric
 - Mean from normalized measurements

###tGravityAcc.std...X
Gravity acceleration std in x direction
 - Numeric
 - Mean from normalized measurements
 
###tGravityAcc.std...Y
Gravity acceleration std in y direction
 - Numeric
 - Mean from normalized measurements

###tGravityAcc.std...Z
Gravity acceleration std in z direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyAccJerk.mean...X
Body acceleration jerk mean in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyAccJerk.mean...Y
Body acceleration jerk mean in y direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyAccJerk.mean...Z
Body acceleration jerk mean in z direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyAccJerk.std...X
Body acceleration jerk std in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyAccJerk.std...Y
Body acceleration jerk std in y direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyAccJerk.std...Z
Body acceleration jerk std in z direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyro.mean...X
Body gyrometer mean in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyro.mean...Y
Body gyrometer mean in y direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyro.mean...Z
Body gyrometer mean in z direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyGyro.std...X
Body gyrometer std in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyro.std...Y
Body gyrometer std in y direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyGyro.std...Z
Body gyrometer std in z direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyroJerk.mean...X
Body gyrometer jerk mean in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyroJerk.mean...Y
Body gyrometer jerk mean in y direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyroJerk.mean...Z
Body gyrometer jerk mean in z direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyGyroJerk.std...X
Body gyrometer jerk std in x direction
 - Numeric
 - Mean from normalized measurements

###tBodyGyroJerk.std...Y
Body gyrometer jerk std in y direction
 - Numeric
 - Mean from normalized measurements
 
###tBodyGyroJerk.std...Z
Body gyrometer jerk std in z direction
 - Numeric
 - Mean from normalized measurements

###tBodyAccMag.mean..
Body acceleration magnitude mean
 - Numeric
 - Mean from normalized measurements of euclidian norm

###tBodyAccMag.std..
Body acceleration magnitude std
 - Numeric
 - Mean from normalized measurements of euclidian norm

###tGravityAccMag.mean..
Gravity acceleration magnitude mean
 - Numeric
 - Mean from normalized measurements of euclidian norm

###tGravityAccMag.std..
Gravity acceleration magnitude std
 - Numeric
 - Mean from normalized measurements of euclidian norm
 
###tBodyAccJerkMag.mean..

###tBodyAccJerkMag.std..              

###tBodyGyroMag.mean..

###tBodyGyroMag.std..                  

###tBodyGyroJerkMag.mean..

###tBodyGyroJerkMag.std..             

###fBodyAcc.mean...X

###fBodyAcc.mean...Y                   

###fBodyAcc.mean...Z

###fBodyAcc.std...X"                    

###fBodyAcc.std...Y

###fBodyAcc.std...Z              

###fBodyAcc.meanFreq...X

###fBodyAcc.meanFreq...Y             

###fBodyAcc.meanFreq...Z

###fBodyAccJerk.mean...X             

###fBodyAccJerk.mean...Y

###fBodyAccJerk.mean...Z              

###fBodyAccJerk.std...X

###fBodyAccJerk.std...Y

###fBodyAccJerk.std...Z

###fBodyAccJerk.meanFreq...X           

###fBodyAccJerk.meanFreq...Y

###fBodyAccJerk.meanFreq...Z

###fBodyGyro.mean...X

###fBodyGyro.mean...Y  

###fBodyGyro.mean...Z

###fBodyGyro.std...X                   

###fBodyGyro.std...Y

###fBodyGyro.std...Z"                   

###fBodyGyro.meanFreq...X

###fBodyGyro.meanFreq...Y             

###fBodyGyro.meanFreq...Z

###fBodyAccMag.mean..                

###fBodyAccMag.std..

###fBodyAccMag.meanFreq..

###fBodyBodyAccJerkMag.mean..

###fBodyBodyAccJerkMag.std..

###fBodyBodyAccJerkMag.meanFreq..

###fBodyBodyGyroMag.mean..             

###fBodyBodyGyroMag.std..

###fBodyBodyGyroMag.meanFreq..        

###fBodyBodyGyroJerkMag.mean..

###fBodyBodyGyroJerkMag.std..         

###fBodyBodyGyroJerkMag.meanFreq..

###angle.tBodyAccMean.gravity.         

###angle.tBodyAccJerkMean..gravityMean.

###angle.tBodyGyroMean.gravityMean.  

###angle.tBodyGyroJerkMean.gravityMean.

###angle.X.gravityMean.                

###angle.Y.gravityMean.

###angle.Z.gravityMean.

##Sources
from original README:
For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

