codeBook for run_analysis.R
========================================================

* Source of the original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Attached R script file (run_analysis.R) does the following to clean up the data:

**1) Merging the training and test sets to create one data set:**  
* post merging of train/X_train.txt with test/X_test.txt -- output is a 10299 x 561 data frame, as per original description
* train/subject_train.txt with test/subject_test.txt -- output is a 10299 x 1 data frame with subject IDs,
* train/y_train.txt with test/y_test.txt -- output is a 10299 x 1 data frame with activity IDs.

**2) Reading file features.txt and extracts only the measurements on MEAN & SD for each measuremenT:**  
Output is a 10299 x 66 data frame, as only 66 out of 561 attributes are measurements on the MEAN & SD. All measurements appear to be float point numbers in the range (-1, 1).

**3) Reads activity_labels.txt and applies descriptive activity names to name activities in the data set:**
* walking
* walkingupstairs
* walkingdownstairs
* sitting
* standing
* laying

**4) Appropriately labeling the data set with descriptive activity names:**  
Names of all features and activities are converted to lower case, underscores and brackets are removed.
After that it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels & subject IDs.

Toutput is saved as merged_clean_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. Names of the attributes are similar to the following:

* tbodyacc-mean-x
* tbodyacc-mean-y
* tbodyacc-mean-z
* tbodyacc-std-x
* tbodyacc-std-y
* tbodyacc-std-z
* tgravityacc-mean-x
* tgravityacc-mean-y

**5) Creating a second independent tidy data set with AVG of each measurement for each activity & each subject.**  
Output is saved as data_set_with_averages.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains names of activities and then the averages for each of the 66 attributes are in columns 3 to 68. There are 30 subjects & 6 activities, so 180 rows in this data set with averages.
