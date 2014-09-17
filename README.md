cleandatproject
===============

# Background
Project uses data from Human Activity Recognition Using Smartphones Dataset Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, it captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. See reference [1].

full details can be obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data can be obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Analysis
The data were originally split into training and test sets. This script combines them into a single set, and assigns meaningful header names.

The data corresponding to means and standard deveations of the measurements were extracted, and means of this data, grouped by activity and subject, were calculated and saved into a variable all_means, which is then saved as the file allmeans.txt.

## Running the analysis
From R run the script file run_analysis.R

The source dataset should be available in a subdirectory "UCI HAR Dataset". If the data is not available it can be downloaded using the function getfile().


See CodeBook.md for further information about the data.



references

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012