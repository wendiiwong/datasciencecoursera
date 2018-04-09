
## Code Book - Human Activity Recognition Using Smartphones 

## Key Concepts
To achieve the project's goal to prepare tidy data that can be used for later analysis, five main steps are included.

### STEP 1 : Merges the training and the test sets to create one data set
First of all, both test and train data is read from the following files using `read.table()` function:
* *features.txt*
  * List of all features.
* *activity_labels.txt*
  * Links the class labels with their activity name.
* *test/X_test.txt*
  * Test set.
* *test/Y_test.txt*
  * Test labels. 
* *test/subject_test.txt*
  * Each row identifies the subject who selected for test data and performed the activity for each window sample. Its range is from 1 to 30. 
* *train/X_train.txt*
  * Training sets.
* *train/Y_train.txt*
  * Training labels.
* *train/subject_train.txt*
  * Each row identifies the subject who selected for train data and performed the activity for each window sample. Its range is from 1 to 30. 

The data read from *features.txt* represents the column names for test and train data. In order to used it as the column names for test data, the argument `col.names = featuresName$features` is used. `read.table()` function has the default argument of `check.names = TRUE`, which will check the names of the variables to ensure they are syntactically valid variable names and adjusted if necessary. For example, `tBodyAccJerk-mean()-X` is adjusted to `tBodyAccJerk.mean...X`. So, the column names for the data set is different from what we have in *features.txt*. After reading the test data set (*test/X_test.txt*), `cbind()` funtion is used to merged with subject data (*test/subject_test.txt*) and activity labels data (*test/Y_test.txt*). Next, `data.frame()` function is used to create a data frame to store these data. The description for train set are equivalent. Code for the solution is included below : 

``` R
featuresName <- read.table("./UCIHAR_Dataset/features.txt", col.names = c("id", "features"))
testData <- read.table("./UCIHAR_Dataset/test/X_test.txt", col.names = featuresName$features)
testSubjectData <- read.table("./UCIHAR_Dataset/test/subject_test.txt", col.names = "subjectId")
testActivityData <- read.table("./UCIHAR_Dataset/test/Y_test.txt", col.names = "activityId")
testDataset <- data.frame(cbind(testSubjectData, testActivityData, testData))
```

Lastly, both test data set and train data set are merged together by using `rbind()` function
``` R
# Combine test data and train data into a data set. 
HARData <- rbind(testDataset, trainDataset)
```

### STEP 2 : Extract the measurements on the mean and standard deviation for each measument
Since only mean and standard deviation variables are required for our dataset, extraction is performed using `select()` function provided by `dplyr package`. The column selected included subjectId, activityId, and all column names with occurence of mean or std.

To retrieve only the column names with occurence of "mean" or "std", `grep()` function is used to search for matches for pattern `"mean[^a-zA-Z]|std"` in the column names list `colnames(HARData)`, and argument `value = TRUE` is used.  

According to *features_info.txt* from the  [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), feature name with mean() indicating mean value for such measurement. While feature name with meanFreq() indicating the weighted average of the frequency components to obtain a mean frequency, which clearly indicate that only mean() is required for this project. 

In order to retrive the mean value for each measurement, pattern `"mean[^a-zA-Z]` is used to match the column name with occurence of mean with no alphabet value behind. For example, `fBodyAccMag.meanFreq..` will not be retrived because the value behind `mean` is alphabet value `F`. Then, to retrive the match of mean or std, `"mean[^a-zA-Z]|std"` is used. Code for the solution is included as below : 

``` R
# Extracts only the measurements on the mean and standard deviation. 
HARData <- select(HARData, subjectId, activityId, grep("mean[^a-zA-Z]|std", colnames(HARData), value = TRUE))
```

### STEP 3 : Uses descriptive activity name to activities in the data set
Next, the unreadable activity id in the data set should replaced by descriptive activity name provided in *activity_labels.txt*. To achive this result, data from *activity_labels.txt* is loaded into a dataset using `read.table()` function, and join with HAR data set using inner join as shown in below.   

```R
# Replace activity id in data set with descriptive activity names. 
activityLabel <- read.table("./UCIHAR_Dataset/activity_labels.txt", col.names = c("activityId", "activity"))
HARData <- join(HARData, activityLabel, by="activityId", type="inner")
```

### STEP 4 : Label the data set appropriately 
Then, the column name is updated to appropriate and readable names using `sub()` and `gsub()` function. I used camel case practice for the readable names, which is the practice of writing compound words or phrases such that each word or abbreviation in the middle of the phrase begins with a capital letter, with no intervening spaces or punctuation. 
To achive this, `..` is removed from the names for the first step. Then, the first letter of each word is detected by using `.m` or `.s`, and replaced by capital letter `M` and `S`. Next, all `.` is removed using `gsub()`. Then, variable name started with letter t or f is detected using regular expression `^t` and `^f` and replaced by readable name `time` and `frequency`. Lastly, duplicate `BodyBody` word is replaced by single `Body` word. The solution is shown as below :  

```R
# Label the data set with descriptive variable names. 
colnames(HARData) <- sub("..", "", colnames(HARData), fixed = TRUE)
colnames(HARData) <- sub(".m", ".M", colnames(HARData))
colnames(HARData) <- sub(".s", ".S", colnames(HARData))   
colnames(HARData) <- gsub(".", "", colnames(HARData), fixed = TRUE)
colnames(HARData) <- sub("^t", "time", colnames(HARData))
colnames(HARData) <- sub("^f", "freq", colnames(HARData))
colnames(HARData) <- sub("BodyBody", "Body", colnames(HARData))
```

### STEP 5 : Create another independent tidy data set with average of each variable for each activity and each subject
After the tidy data set is ready, create another independent tidy data set. The new data set stores average of each variable for each activity and each subject. This is achived by using `group_by()` function and `summarize_all()` function as shown in below :

```R
# Create an independent data set with the average of each variable 
HARfeaturesMean <- HARData %>% 
            select(-activityId) %>%
            group_by(subjectId, activity) %>%
            summarize_all(mean)
```


## Data set : 
The data set contains of 180 records and 68 variables. Each record indicate each activity performed by each volunteer. There are 30 volunteer and 6 activities in total. The variables included subjectId, activity, and 66 average of each variable. Refer to the table below for more detail information.  

Variable Name | |Description
--------------|-|-------------
subjectId|1..30|An identification number to identify each unique volunteer who performed the activity for each window sample.
activity|WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|Name of activity performed by volunteers(subjects) while wearing a smartphone (Samsung Galaxy S II) on the waist. There are six activities in total.
timeBodyAccMeanX|-1..1|average of mean value of time body acceleration signals for x-axis for each activitiy and each subject
timeBodyAccMeanY|-1..1|average of mean value of time body acceleration signals for Y-axis for each activitiy and each subject
timeBodyAccMeanZ|-1..1|average of mean value of time body acceleration signals for Z-axis for each activitiy and each subject
timeBodyAccStdX|-1..1|average of standard deviation of time body acceleration signals for X-axis for each activitiy and each subject
timeBodyAccStdY|-1..1|average of standard deviation of time body acceleration signals for Y-axis for each activitiy and each subject
timeBodyAccStdZ|-1..1|average of standard deviation of time body acceleration signals for Z-axis for each activitiy and each subject
timeGravityAccMeanX|-1..1|average of mean value of time gravity acceleration signals for X-axis for each activitiy and each subject
timeGravityAccMeanY|-1..1|average of mean value of time gravity acceleration signals for Y-axis for each activitiy and each subject
timeGravityAccMeanZ|-1..1|average of mean value of time gravity acceleration signals for Z-axis for each activitiy and each subject
timeGravityAccStdX|-1..1|average of standard deviation of time gravity acceleration signals for X-axis for each activitiy and each subject
timeGravityAccStdY|-1..1|average of standard deviation of time gravity acceleration signals for Y-axis for each activitiy and each subject
timeGravityAccStdZ|-1..1|average of standard deviation of time gravity acceleration signals for Z-axis for each activitiy and each subject
timeBodyAccJerkMeanX|-1..1|average of mean value of time body acceleration Jerk signals for X-axis for each activitiy and each subject
timeBodyAccJerkMeanY|-1..1|average of mean value of time body acceleration Jerk signals for Y-axis for each activitiy and each subject
timeBodyAccJerkMeanZ|-1..1|average of mean value of time body acceleration Jerk signals for Z-axis for each activitiy and each subject
timeBodyAccJerkStdX|-1..1|average of standard deviation of time body acceleration Jerk signals for X-axis for each activitiy and each subject
timeBodyAccJerkStdY|-1..1|average of standard deviation of time body acceleration Jerk signals for Y-axis for each activitiy and each subject
timeBodyAccJerkStdZ|-1..1|average of standard deviation of time body acceleration Jerk signals for Z-axis for each activitiy and each subject
timeBodyGyroMeanX|-1..1|average of mean value of time body Gyro signals for X-axis for each activitiy and each subject
timeBodyGyroMeanY|-1..1|average of mean value of time body Gyro signals for Y-axis for each activitiy and each subject
timeBodyGyroMeanZ|-1..1|average of mean value of time body Gyro signals for Z-axis for each activitiy and each subject
timeBodyGyroStdX|-1..1|average of standard deviation of time body Gyro signals for X-axis for each activitiy and each subject
timeBodyGyroStdY|-1..1|average of standard deviation of time body Gyro signals for Y-axis for each activitiy and each subject
timeBodyGyroStdZ|-1..1|average of standard deviation of time body Gyro signals for Z-axis for each activitiy and each subject
timeBodyGyroJerkMeanX|-1..1|average of mean value of time body Gyro Jerk signals for X-axis for each activitiy and each subject
timeBodyGyroJerkMeanY|-1..1|average of mean value of time body Gyro Jerk signals for Y-axis for each activitiy and each subject
timeBodyGyroJerkMeanZ|-1..1|average of mean value of time body Gyro Jerk signals for Z-axis for each activitiy and each subject
timeBodyGyroJerkStdX|-1..1|average of standard deviation of time body Gyro Jerk signals for X-axis for each activitiy and each subject
timeBodyGyroJerkStdY|-1..1|average of standard deviation of time body Gyro Jerk signals for Y-axis for each activitiy and each subject
timeBodyGyroJerkStdZ|-1..1|average of standard deviation of time body Gyro Jerk signals for Z-axis for each activitiy and each subject
timeBodyAccMagMean|-1..1|average of mean value of time body acceleration magnitude signals for each activitiy and each subject
timeBodyAccMagStd|-1..1|average of standard deviation of time body acceleration magnitude signals for each activitiy and each subject
timeGravityAccMagMean|-1..1|average of mean value of time gravity acceleration magnitude signals for each activitiy and each subject
timeGravityAccMagStd|-1..1|average of standard deviation of time gravity acceleration magnitude signals for each activitiy and each subject
timeBodyAccJerkMagMean|-1..1|average of mean value of time body acceleration Jerk magnitude signals for each activitiy and each subject
timeBodyAccJerkMagStd|-1..1|average of standard deviation of time body acceleration Jerk magnitude signals for each activitiy and each subject
timeBodyGyroMagMean|-1..1|average of mean value of time body Gyro magnitude signals for each activitiy and each subject
timeBodyGyroMagStd|-1..1|average of standard deviation of time body Gyro magnitude signals for each activitiy and each subject
timeBodyGyroJerkMagMean|-1..1|average of mean of time body Gyro Jerk magnitude signals for each activitiy and each subject
timeBodyGyroJerkMagStd|-1..1|average of standard deviation of time body Gyro Jerk magnitude signals for each activitiy and each subject
freqBodyAccMeanX|-1..1|average of mean value of frequency body acceleration signals for X-axis for each activitiy and each subject
freqBodyAccMeanY|-1..1|average of mean value of frequency body acceleration signals for Y-axis for each activitiy and each subject
freqBodyAccMeanZ|-1..1|average of mean value of frequency body acceleration signals for Z-axis for each activitiy and each subject
freqBodyAccStdX|-1..1|average of standard deviation of frequency body acceleration signals for X-axis for each activitiy and each subject
freqBodyAccStdY|-1..1|average of standard deviation of frequency body acceleration signals for Y-axis for each activitiy and each subject
freqBodyAccStdZ|-1..1|average of standard deviation of frequency body acceleration signals for Z-axis for each activitiy and each subject
freqBodyAccJerkMeanX|-1..1|average of mean value of frequency body acceleration Jerk signals for X-axis for each activitiy and each subject
freqBodyAccJerkMeanY|-1..1|average of mean value of frequency body acceleration Jerk signals for Y-axis for each activitiy and each subject
freqBodyAccJerkMeanZ|-1..1|average of mean value of frequency body acceleration Jerk signals for Z-axis for each activitiy and each subject
freqBodyAccJerkStdX|-1..1|average of standard deviation of frequency body acceleration Jerk signals for X-axis for each activitiy and each subject
freqBodyAccJerkStdY|-1..1|average of standard deviation of frequency body acceleration Jerk signals for Y-axis for each activitiy and each subject
freqBodyAccJerkStdZ|-1..1|average of standard deviation of frequency body acceleration Jerk signals for Z-axis for each activitiy and each subject
freqBodyGyroMeanX|-1..1|average of mean value of frequency body Gyro signals for X-axis for each activitiy and each subject
freqBodyGyroMeanY|-1..1|average of mean value of frequency body Gyro signals for Y-axis for each activitiy and each subject
freqBodyGyroMeanZ|-1..1|average of mean value of frequency body Gyro signals for Z-axis for each activitiy and each subject
freqBodyGyroStdX|-1..1|average of standard deviation of frequency body Gyro signals for X-axis for each activitiy and each subject
freqBodyGyroStdY|-1..1|average of standard deviation of frequency body Gyro signals for Y-axis for each activitiy and each subject
freqBodyGyroStdZ|-1..1|average of standard deviation of frequency body Gyro signals for Z-axis for each activitiy and each subject
freqBodyAccMagMean|-1..1|average of mean value of frequency body acceleration magnitude signals for each activitiy and each subject
freqBodyAccMagStd|-1..1|average of standard deviation of frequency body acceleration magnitude signals for each activitiy and each subject
freqBodyAccJerkMagMean|-1..1|average of mean value of frequency body acceleration Jerk magnitude signals for each activitiy and each subject
freqBodyAccJerkMagStd|-1..1|average of standard deviation of frequency body acceleration Jerk magnitude signals for each activitiy and each subject
freqBodyGyroMagMean|-1..1|average of mean value of frequency body Gyro magnitude signals for each activitiy and each subject
freqBodyGyroMagStd|-1..1|average of standard deviation of frequency body Gyro magnitude signals for each activitiy and each subject
freqBodyGyroJerkMagMean|-1..1|average of mean value of frequency body Gyro Jerk magnitude signals for each activitiy and each subject
freqBodyGyroJerkMagStd|-1..1|average of standard deviation of frequency body Gyro Jerk magnitude signals for each activitiy and each subject




