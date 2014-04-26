Getting and Cleaning Data Project README.md for run_analysis.R
===============================================================
1) Go to URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2) Extract the zip file into working directory e.g. C:\Users\yourname\Documents   
3) create run_analysis.R in RStudio  
4) Give the command in R console: source("run_analysis.R")  
5) After R script has run, below files will be written:  
  
* merged_clean_data.txt -- 8150 kb, a 10299x68 data frame
* data_set_with_averages.txt -- 220 kb, a 180x68 data frame

6)Script ran for approximately 45 sec  
7) To read the rest part use data <- read.table("data_set_with_averages.txt").  It is 180x68 data frame, there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30*6=180 rows.
