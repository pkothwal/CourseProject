## Read Test data file X_test.txt and train data file X_train.txt

testData <- read.table("./data/projdata/UCI_HAR_Dataset/test/X_test.txt")
trainData <- read.table("./data/projdata/UCI_HAR_Dataset/train/X_train.txt")

## Read features file features.txt this will be used as column names for testData

features <- read.table("./data/projdata/UCI_HAR_Dataset/features.txt")

## Extract only second column of features data frame

features <- features[,2]

## Remove () from column names 

feat <- gsub("[(][)]","",features)

## Use feat dataFrame to add column names to testData and trainData

colnames(testData) <- feat
colnames(trainData) <- feat

## Read Test subject test and subject train file

subjectTest <- read.table("./data/projdata/UCI_HAR_Dataset/test/subject_test.txt")
subjectTrain <- read.table("./data/projdata/UCI_HAR_Dataset/train/subject_train.txt")

## Assign Column name to subjectTest frame and subjectTrain

colnames(subjectTest) <- c("subject")
colnames(subjectTrain) <- c("subject")

## combine testData and subjectTest column wise and trainData and subjectTrain column wise

Final <- cbind(testData,subjectTest)
FinalT <- cbind(trainData,subjectTrain)

## Read activity file y_test.txt and y_train.txt

yTest <- read.table("./data/projdata/UCI_HAR_Dataset/test/y_test.txt")
yTrain <- read.table("./data/projdata/UCI_HAR_Dataset/train/y_train.txt")

##  Assign column names to activity test frame yTest and activity train frame yTrain

colnames(yTest) <- c("activity")
colnames(yTrain) <- c("activity")

## combine Final and yTest file to create finalTest file and yTrain and FinalT to get finalTrain

finalTest <- cbind(Final,yTest)
finalTrain <- cbind(FinalT,yTrain)

## Assign descriptive activity names  to finalTest and finalTrain

finalTest$activity[finalTest$activity == 1] <- "WALKING"
finalTest$activity[finalTest$activity == 2] <- "WALKING_UPSTAIRS"
finalTest$activity[finalTest$activity == 3] <- "WALKING_DOWNSTAIRS"
finalTest$activity[finalTest$activity == 4] <- "SITTING"
finalTest$activity[finalTest$activity == 5] <- "STANDING"
finalTest$activity[finalTest$activity == 6] <- "LAYING"

finalTrain$activity[finalTrain$activity == 1] <- "WALKING"
finalTrain$activity[finalTrain$activity == 2] <- "WALKING_UPSTAIRS"
finalTrain$activity[finalTrain$activity == 3] <- "WALKING_DOWNSTAIRS"
finalTrain$activity[finalTrain$activity == 4] <- "SITTING"
finalTrain$activity[finalTrain$activity == 5] <- "STANDING"
finalTrain$activity[finalTrain$activity == 6] <- "LAYING"

## combine/merge training and test datasets (finalTest and finalTrain)

mergeData <- rbind(finalTest,finalTrain)

## Extract mean and standard deviation only for each activity and subject

mergeFinalMean <- mergeData[,grep("mean",names(mergeData))]
mergeFinalStd <- mergeData[,grep("std",names(mergeData))]
Activity <- mergeData[,"activity"]
Subject  <- mergeData[,"subject"]
mergeFinal <- cbind(mergeFinalMean,mergeFinalStd,mergeActivity,mergeSubject)

## Write to file TidyDataset1.txt

write.table(mergeFinal,file="./data/projdata/UCI_HAR_Dataset/TidtDataset1.txt")


## Create another tidy dataset with average of each activity and subject

aggdata <- aggregate(mergeFinal,by=list(Activity,Subject),FUN=mean,na.rm=TRUE)

## Discard last two columns 

aggdata <- aggdata[,c(1:81)]

## Rename first two columns as Activity and Subject

colnames(aggdata)[1] <- c("Activity")
colnames(aggdata)[2] <- c("Subject")


## Write to file TidyDataset2.txt

write.table(aggdata,file="./data/projdata/UCI_HAR_Dataset/TidtDataset2.txt")

