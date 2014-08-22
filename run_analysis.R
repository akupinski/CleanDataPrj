
##  Preliminary set up + check for needed files
##--------------------------------------------------------

library(sqldf)

# Testing parameters
debug=FALSE   # set to FALSE to turn off debugging output
nrecs=-1      # N records to read from each data file (-1 => ALL)

original.dir <- getwd()
setwd("~/Coursera/Cleaning Data/CleanDataPrj")
test.dir <- file.path("UCI HAR Dataset", "test")
train.dir <- file.path("UCI HAR Dataset", "train")

for (req.dir in c(test.dir, train.dir)) {
    if (!file.exists(req.dir)) {
        stop(paste(req.dir, "does not exist in the working directory"));
    }
    else if (!file.info(req.dir)$isdir) {
        stop(paste(req.dir, "is not a directory"));    
    }
    else {
        # are needed files present?
        if (debug) message(req.dir, " exists")
    }
}


setwd("UCI HAR Dataset")

## Read meta-data
##--------------------------------------------------------

## Read measure column labels from features.txt
featureLookup <- read.table("features.txt", col.names=c("index", "label"))

#... Flag mean and std measurements
featureLookup$isMean <- grepl("mean\\(\\)", featureLookup$label)
featureLookup$isStd <- grepl("std\\(\\)", featureLookup$label)

#... Clean up labels to use as variable names
featureLookup$varname <- featureLookup$label
# 1. capitalize "mean" and "std"
featureLookup$varname <- gsub("mean\\(\\)", "Mean", featureLookup$varname)
featureLookup$varname <- gsub("std\\(\\)", "Std", featureLookup$varname)
# 2. remove other empty parentheses: ()
featureLookup$varname <- gsub('\\(\\)', "", featureLookup$varname)
# 3. replace (args) with _args_
featureLookup$varname <- gsub('\\(([^\\)]+)\\)', "_\\1_", featureLookup$varname)
# 4. remove other punctuation (non-word characters)
featureLookup$varname <- gsub('\\W', "", featureLookup$varname)

#... Create array of varnames for measures to keep
keep_TF <- featureLookup$isMean | featureLookup$isStd
varnamesToKeep <- featureLookup$varname[keep_TF]


## Read activity labels from activity_labels.txt
activityLookup <- read.table("activity_labels.txt", col.names=c("index", "label"))


## Read datafiles (into the data list)
##--------------------------------------------------------
data <- list()
for (dataset in c("train", "test")) {
    
    setwd(dataset)
    
    #... read features data 
    datafile <- paste("X_", dataset, ".txt", sep="")
    measures <- read.table(datafile, 
                           col.names = featureLookup$varname,
                           nrows=nrecs) 
    
    #... keep only mean, std measures
    measures <- subset(measures, select=varnamesToKeep)
            
    #... read subject identifiers 
    subjfile <- paste("subject_", dataset, ".txt", sep="")
    subjects <- read.table(subjfile, 
                           col.names = "subject",
                           nrows=nrecs) 
        
    #... read activity identifiers
    actfile <- paste("y_", dataset, ".txt", sep="")
    activities <- read.table(actfile, 
                             col.names = "activity",
                             nrows=nrecs) 
    
    #... bind subject, activities, and measures + add to data list
    assignListItem = paste("data$", dataset, 
                           "= cbind(subjects, activities, measures)",
                           sep="")
    eval(parse(text=assignListItem))
    
    setwd("..")  # back to parent directory
}


## Merge the training & test sets
##--------------------------------------------------------
fullData <- rbind(data$test, data$train)


## Add descriptive activity names 
##--------------------------------------------------------
fullData$activity <- factor(fullData$activity,
                            levels=activityLookup$index,
                            labels=activityLookup$label)


## Calculate avg(measures) foreach activity x subject
##--------------------------------------------------------
# SQL for avgs to select is comma-sep of "avg(varname) `avg_varname`"
avgsToSelect <- paste(
    paste("avg(", varnamesToKeep, ") `avg_", varnamesToKeep, "`", sep=""), 
    collapse=", ")
sqlStr <- paste("select subject, activity,",
                avgsToSelect,
                "from fullData group by subject, activity")
if (debug) message("sqlStr:", sqlStr)
summaryData <- sqldf(sqlStr)



## Write summaryData to a text file in the orig wd
##--------------------------------------------------------
setwd(original.dir)
write.table(summaryData, file="summaryData.txt", row.names=FALSE)


