## Course Project of Course "Getting and Cleaning Data"
##
## Merging and cleaning test and training data sets
##
## Function: run_analysis
## returns:  tidy data set containing average for each activity/subject combination
## data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##              Data has to be unzipped into working directory and the folder
##              has to be named "data"
##
## by: t-grab

run_analysis <- function() {    
    # Reading needed data
    training.subject <- read.table("./data/train/subject_train.txt")
    training.X       <- read.table("./data/train/X_train.txt")
    training.y       <- read.table("./data/train/y_train.txt")
    
    test.subject     <- read.table("./data/test/subject_test.txt")
    test.X           <- read.table("./data/test/X_test.txt")
    test.y           <- read.table("./data/test/y_test.txt")
    
    features         <- read.table("./data/features.txt")
    activity_labels  <- read.table("./data/activity_labels.txt")
    
    # Merging training and test data set fragments to get 
    # complete training and test data sets
    training <- cbind(training.subject, training.y, training.X)
    test     <- cbind(test.subject, test.y, test.X)
    rm(training.X, training.y, test.X, test.y)
    
    # Naming columns of training and test data set
    colnames(training) <- c("subject", "activity-class", as.character(features$V2))
    colnames(test)     <- c("subject", "activity-class", as.character(features$V2))
    rm(features)    
    
    # Combining training and test data set to create complete data set
    data <- rbind(training, test)
    rm(training, test)
            
    # Removing columns not containing "mean()" or "std()"
    # except "subject" and "activity-class"
    indices <- c(grep("mean()", colnames(data), fixed=T), grep("std()", colnames(data), fixed=T))
    data <- data[,c(1:2,indices)]
    
    # Naming activities
    data <- merge(x = data, y = activity_labels, by.x = "activity-class", by.y="V1", all.x=T)
    colnames(data)[ncol(data)] <- "activity"
    # Removing "activity-class"
    data <- data[, -1]
    
    # Return tidy data set containing the means for all variables grouped by 
    # (subject, activity) tuples
    grouped_set <- aggregate(data[,2:(ncol(data)-1)], by=list(data$subject, data$activity), FUN=mean)
    colnames(grouped_set)[1:2] <- c("subject", "activity") 
    grouped_set
}