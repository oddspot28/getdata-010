## run_analysis.R
  
# read in all the files we reqire
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)  
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)  


# REQ 1: merge test & train data sets 
allData <- rbind(x_test, x_train)

# apply the feature labels to allData
colnames(allData) <- features$V2

# REQ 2: extract only the features ending in mean() or std()
allData <- allData[, grepl('mean\\()$|std\\()$', names(allData))]


# merge the subjects ...
allSubj <- rbind(subj_test, subj_train)
colnames(allSubj) <- "Subject"    # REQ 4

# and the activities ...
allAct <- rbind(y_test, y_train)
colnames(allAct) <- "Activity"    # REQ 4

# and add to allData
allData <- cbind(allSubj, allAct, allData)
#

# REQ 3: lookup activity names for the codes
for (i in 1:length(activities$V2)) {
  allData$Activity <- gsub(i, activities[i,2], allData$Activity)
}

# REQ 5: create a tidy data set with the average of each variable for each activity and each subjec
tidy = aggregate(allData[,c(3:20)], list(subject=allData$Subject, activity=allData$Activity), mean)
write.table(tidy, file="./tidy.txt", sep="\t", quote = FALSE, row.names = FALSE)