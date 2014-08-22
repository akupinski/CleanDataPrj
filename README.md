
Course Project for Getting and Cleaning Data
============================================

The function of the run_analysis.R script is to process data from the 
[UCI HAR Study][har] (University of California, Irvine Human Activity Recognition Study).  The data from UCI, collected from accelerometers in the Samsung Galaxy S smartphone, are split between two data sets: testing and training.

[har]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis.R script performs the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This file is also written to a text file,
summaryData.txt, in your working directory.


###Steps for executing run_analysis.R

1. Download the data from UCI [here][data].
2. Extract the .zip file into the directory that is your working directory 
for R.
3. Copy run_analysis.R to your working directory.
The file structure of your working directory should look something like this:

```
    <your working directory>/
        run_analysis.R
        UCI HAR Dataset/
            activity_labels.txt
            features.txt
            features_info.txt
            test/
                X_train.txt
                subject_train.txt
                y_train.txt
            
            train/
                X_train.txt
                subject_train.txt
                y_train.txt
```

4. Set/verify your working directory in R:
```
    setwd(<your working directory>)
    getwd()
```

5. Execute run_analysis.R  
```
    source(run_analysis.R)
```

[data]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


