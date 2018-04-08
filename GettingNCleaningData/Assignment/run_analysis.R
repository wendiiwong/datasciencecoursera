if("dplyr" %in% (.packages())){
      detach("package:dplyr", unload=TRUE) 
      detach("package:plyr", unload=TRUE) 
} 
library(plyr)
library(dplyr)

# Read raw data from txt files.
featuresName <- read.table("./UCIHAR_Dataset/features.txt", col.names = c("id", "features"))
testData <- read.table("./UCIHAR_Dataset/test/X_test.txt", col.names = featuresName$features)
testSubjectData <- read.table("./UCIHAR_Dataset/test/subject_test.txt", col.names = "subjectId")
testActivityData <- read.table("./UCIHAR_Dataset/test/Y_test.txt", col.names = "activityId")
testDataset <- data.frame(cbind(testSubjectData, testActivityData, testData))

trainData <- read.table("./UCIHAR_Dataset/train/X_train.txt", col.names = featuresName$features)
trainSubjectData <- read.table("./UCIHAR_Dataset/train/subject_train.txt", col.names = "subjectId")
trainActivityData <- read.table("./UCIHAR_Dataset/train/Y_train.txt", col.names = "activityId")
trainDataset <- data.frame(cbind(trainSubjectData, trainActivityData, trainData))

# Combine test data and train data into a data set. 
HARData <- rbind(testDataset, trainDataset)

# Extracts only the measurements on the mean and standard deviation. 
HARData <- select(HARData, subjectId, activityId, grep("mean[^a-zA-Z]|std", colnames(HARData), value = TRUE))

# Replace activity id in data set with descriptive activity names. 
activityLabel <- read.table("./UCIHAR_Dataset/activity_labels.txt", col.names = c("activityId", "activity"))
HARData <- join(HARData, activityLabel, by="activityId", type="inner")

# Label the data set with descriptive variable names. 
colnames(HARData) <- sub("..", "", colnames(HARData), fixed = TRUE)
colnames(HARData) <- sub(".m", ".M", colnames(HARData))
colnames(HARData) <- sub(".s", ".S", colnames(HARData))   
colnames(HARData) <- gsub(".", "", colnames(HARData), fixed = TRUE)
colnames(HARData) <- sub("^t", "time", colnames(HARData))
colnames(HARData) <- sub("^f", "freq", colnames(HARData))
colnames(HARData) <- sub("BodyBody", "Body", colnames(HARData))

# Create an independent data set with the average of each variable 
HARfeaturesMean <- HARData %>% 
            select(-activityId) %>%
            group_by(subjectId, activity) %>%
            summarize_all(mean)

# Create a txt file for the result
write.table(HARfeaturesMean, file = "HARfeaturesMean.txt", row.names = FALSE)

