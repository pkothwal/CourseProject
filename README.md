Script run_analysis.R in this repo takes raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip which is Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz

The Repo contains 

* R script to tidy this dataset
* README.md
* CodeBook.md 

Script merges test and train data assigns column names to variables and extracts only mean and standard deviation columns from the raw data and writes out tidy dataset called TidtDataset1.txt .

It also takes mean of all variables based on subject and activity and produces TidtDataset2.txt

Above tidy datasets can be used for further analysis.





