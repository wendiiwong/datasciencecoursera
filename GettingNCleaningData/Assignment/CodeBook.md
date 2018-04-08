
## Code Book - Human Activity Recognition Using Smartphones 

### Key Concepts
To achieve the project's goal to prepare tidy data that can be used for later analysis, five main steps are included.

#### Merges the training and the test sets to create one data set
First of all, both test and train data is read from the following file:
* features.txt
* activity_labels.txt
* test/X_test.txt
* test/Y_test.txt
* test/subject_test.txt
* train/X_train.txt
* train/Y_train.txt
* train/subject_train.txt

#### Extract the measurements on the mean and standard deviation for each measument
Extract the column of mean and standard deviation variables.

#### Uses descriptive activity name to activities in the data set
Replace the activity id in the data set to descriptive activity name.

#### Label the data set appropriately 
Rename the column name to appropriate and readable names.

#### Create another independent tidy data set with average of each variable for each activity and each subject
After the tidy data set is ready, create another independent tidy data set and export it to a text file. 
The new data set stores average of each variable for each activity and each subject. 

### List of variables  
**subjectId**
* Subject ID
  * 1..30 An identification number to identify each unique volunteer who performed the activity for each window sample.
         
**activity**
* Name of activity performed by volunteers(subjects) while wearing a smartphone (Samsung Galaxy S II) on the waist.
* There are six activities in total:
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

**timeBodyAccMeanX**
* average of mean value of time body acceleration signals for x-axis for each activitiy and each subject

**timeBodyAccMeanY**
* average of mean value of time body acceleration signals for Y-axis for each activitiy and each subject

**timeBodyAccMeanZ**
* average of mean value of time body acceleration signals for Z-axis for each activitiy and each subject

**timeBodyAccStdX**
* average of standard deviation of time body acceleration signals for X-axis for each activitiy and each subject

**timeBodyAccStdY**
* average of standard deviation of time body acceleration signals for Y-axis for each activitiy and each subject

**timeBodyAccStdZ**
* average of standard deviation of time body acceleration signals for Z-axis for each activitiy and each subject

**timeGravityAccMeanX**
* average of mean value of time gravity acceleration signals for X-axis for each activitiy and each subject

**timeGravityAccMeanY**
* average of mean value of time gravity acceleration signals for Y-axis for each activitiy and each subject

**timeGravityAccMeanZ**
* average of mean value of time gravity acceleration signals for Z-axis for each activitiy and each subject

**timeGravityAccStdX**
* average of standard deviation of time gravity acceleration signals for X-axis for each activitiy and each subject

**timeGravityAccStdY**
* average of standard deviation of time gravity acceleration signals for Y-axis for each activitiy and each subject

**timeGravityAccStdZ**
* average of standard deviation of time gravity acceleration signals for Z-axis for each activitiy and each subject

**timeBodyAccJerkMeanX**
* average of mean value of time body acceleration Jerk signals for X-axis for each activitiy and each subject

**timeBodyAccJerkMeanY**
* average of mean value of time body acceleration Jerk signals for Y-axis for each activitiy and each subject

**timeBodyAccJerkMeanZ**
* average of mean value of time body acceleration Jerk signals for Z-axis for each activitiy and each subject

**timeBodyAccJerkStdX**
* average of standard deviation of time body acceleration Jerk signals for X-axis for each activitiy and each subject

**timeBodyAccJerkStdY**
* average of standard deviation of time body acceleration Jerk signals for Y-axis for each activitiy and each subject

**timeBodyAccJerkStdZ**
* average of standard deviation of time body acceleration Jerk signals for Z-axis for each activitiy and each subject

**timeBodyGyroMeanX**
* average of mean value of time body Gyro signals for X-axis for each activitiy and each subject

**timeBodyGyroMeanY**
* average of mean value of time body Gyro signals for Y-axis for each activitiy and each subject

**timeBodyGyroMeanZ**
* average of mean value of time body Gyro signals for Z-axis for each activitiy and each subject

**timeBodyGyroStdX**
* average of standard deviation of time body Gyro signals for X-axis for each activitiy and each subject

**timeBodyGyroStdY**
* average of standard deviation of time body Gyro signals for Y-axis for each activitiy and each subject

**timeBodyGyroStdZ**
* average of standard deviation of time body Gyro signals for Z-axis for each activitiy and each subject

**timeBodyGyroJerkMeanX**
* average of mean value of time body Gyro Jerk signals for X-axis for each activitiy and each subject

**timeBodyGyroJerkMeanY**
* average of mean value of time body Gyro Jerk signals for Y-axis for each activitiy and each subject

**timeBodyGyroJerkMeanZ**
* average of mean value of time body Gyro Jerk signals for Z-axis for each activitiy and each subject

**timeBodyGyroJerkStdX**
* average of standard deviation of time body Gyro Jerk signals for X-axis for each activitiy and each subject

**timeBodyGyroJerkStdY**
* average of standard deviation of time body Gyro Jerk signals for Y-axis for each activitiy and each subject

**timeBodyGyroJerkStdZ**
* average of standard deviation of time body Gyro Jerk signals for Z-axis for each activitiy and each subject

**timeBodyAccMagMean**
* average of mean value of time body acceleration magnitude signals for each activitiy and each subject

**timeBodyAccMagStd**
* average of standard deviation of time body acceleration magnitude signals for each activitiy and each subject

**timeGravityAccMagMean**
* average of mean value of time gravity acceleration magnitude signals for each activitiy and each subject

**timeGravityAccMagStd**
* average of standard deviation of time gravity acceleration magnitude signals for each activitiy and each subject

**timeBodyAccJerkMagMean**
* average of mean value of time body acceleration Jerk magnitude signals for each activitiy and each subject

**timeBodyAccJerkMagStd**
* average of standard deviation of time body acceleration Jerk magnitude signals for each activitiy and each subject

**timeBodyGyroMagMean**
* average of mean value of time body Gyro magnitude signals for each activitiy and each subject

**timeBodyGyroMagStd**
* average of standard deviation of time body Gyro magnitude signals for each activitiy and each subject

**timeBodyGyroJerkMagMean**
* average of mean of time body Gyro Jerk magnitude signals for each activitiy and each subject

**timeBodyGyroJerkMagStd**
* average of standard deviation of time body Gyro Jerk magnitude signals for each activitiy and each subject

**freqBodyAccMeanX**
* average of mean value of frequency body acceleration signals for X-axis for each activitiy and each subject

**freqBodyAccMeanY**
* average of mean value of frequency body acceleration signals for Y-axis for each activitiy and each subject

**freqBodyAccMeanZ**
* average of mean value of frequency body acceleration signals for Z-axis for each activitiy and each subject

**freqBodyAccStdX**
* average of standard deviation of frequency body acceleration signals for X-axis for each activitiy and each subject

**freqBodyAccStdY**
* average of standard deviation of frequency body acceleration signals for Y-axis for each activitiy and each subject

**freqBodyAccStdZ**
* average of standard deviation of frequency body acceleration signals for Z-axis for each activitiy and each subject

**freqBodyAccJerkMeanX**
* average of mean value of frequency body acceleration Jerk signals for X-axis for each activitiy and each subject

**freqBodyAccJerkMeanY**
* average of mean value of frequency body acceleration Jerk signals for Y-axis for each activitiy and each subject

**freqBodyAccJerkMeanZ**
* average of mean value of frequency body acceleration Jerk signals for Z-axis for each activitiy and each subject

**freqBodyAccJerkStdX**
* average of standard deviation of frequency body acceleration Jerk signals for X-axis for each activitiy and each subject

**freqBodyAccJerkStdY**
* average of standard deviation of frequency body acceleration Jerk signals for Y-axis for each activitiy and each subject

**freqBodyAccJerkStdZ**
* average of standard deviation of frequency body acceleration Jerk signals for Z-axis for each activitiy and each subject

**freqBodyGyroMeanX**
* average of mean value of frequency body Gyro signals for X-axis for each activitiy and each subject

**freqBodyGyroMeanY**
* average of mean value of frequency body Gyro signals for Y-axis for each activitiy and each subject

**freqBodyGyroMeanZ**
* average of mean value of frequency body Gyro signals for Z-axis for each activitiy and each subject

**freqBodyGyroStdX**
* average of standard deviation of frequency body Gyro signals for X-axis for each activitiy and each subject

**freqBodyGyroStdY**
* average of standard deviation of frequency body Gyro signals for Y-axis for each activitiy and each subject

**freqBodyGyroStdZ**
* average of standard deviation of frequency body Gyro signals for Z-axis for each activitiy and each subject

**freqBodyAccMagMean**
* average of mean value of frequency body acceleration magnitude signals for each activitiy and each subject

**freqBodyAccMagStd**
* average of standard deviation of frequency body acceleration magnitude signals for each activitiy and each subject

**freqBodyAccJerkMagMean**
* average of mean value of frequency body acceleration Jerk magnitude signals for each activitiy and each subject

**freqBodyAccJerkMagStd**
* average of standard deviation of frequency body acceleration Jerk magnitude signals for each activitiy and each subject

**freqBodyGyroMagMean**
* average of mean value of frequency body Gyro magnitude signals for each activitiy and each subject

**freqBodyGyroMagStd**
* average of standard deviation of frequency body Gyro magnitude signals for each activitiy and each subject

**freqBodyGyroJerkMagMean**
* average of mean value of frequency body Gyro Jerk magnitude signals for each activitiy and each subject

**freqBodyGyroJerkMagStd**
* average of standard deviation of frequency body Gyro Jerk magnitude signals for each activitiy and each subject



