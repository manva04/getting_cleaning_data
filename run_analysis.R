# Get Source data from below URL for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# R code performs the below steps:

# 1) Merging TRAINING & TEST data sets to create one data set as per requirement

trainx <- read.table("train/X_train.txt")
testx <- read.table("test/X_test.txt")
X <- rbind(trainx, testx)

trains <- read.table("train/subject_train.txt")
tests <- read.table("test/subject_test.txt")
S <- rbind(trains, tests)

trainy <- read.table("train/y_train.txt")
testy <- read.table("test/y_test.txt")
Y <- rbind(trainy, testy)

# 2) Extracting only the measurements on MEAN & SD for each measurement.

feat <- read.table("features.txt")
idx_feat <- grep("-mean\\(\\)|-std\\(\\)", feat[, 2])
X <- X[, idx_feat]
names(X) <- feat[idx_feat, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))  

# 3) Using descriptive activity names to name the activities in the data set.

act <- read.table("activity_labels.txt")
act[, 2] = gsub("_", "", tolower(as.character(act[, 2])))
Y[,1] = act[Y[,1], 2]
names(Y) <- "activity"

# 4) Appropriately labeling the data set with descriptive activity names.

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "merged_clean_data.txt")

# 5) Creating a second independent tidy data set with the AVG of each variable for each activity and each subject.

uniqueSubjects <- unique(S)[,1]
numSubjects <- length(unique(S)[,1])
numActivities <- length(act[,1])
numCols <- dim(cleaned)[2]
result <- cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = act[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==act[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "data_set_with_averages.txt")
