# Getting And Cleaning Data Course Project

## Introduction
This project is the work from Coursera Course "Getting and Cleaning Data". The purpose of this project is to demonstrate student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available on [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and you can download the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project.
 
## Repositary Contents
File Name | Description
--------- | -----------
[README.md](https://github.com/wendiiwong/datasciencecoursera/blob/master/GettingNCleaningData/Assignment/README.md) | Documentation explaining the project and how to use files contained in the repository.
[CodeBook.md](https://github.com/wendiiwong/datasciencecoursera/blob/master/GettingNCleaningData/Assignment/CodeBook.md) | A code book that describes the variables, the data, and any transformations or work that performed to clean up the data.
[run_analysis.R](https://github.com/wendiiwong/datasciencecoursera/blob/master/GettingNCleaningData/Assignment/run_analysis.R) | R script for data cleaning and perform the analysis.
[HARfeaturesMean.txt](https://github.com/wendiiwong/datasciencecoursera/blob/master/GettingNCleaningData/Assignment/HARfeaturesMean.txt) | A tidy data set with the average of each feature's variable for each activity and each subject. 

## Step To Run the Code
* Download the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Unzip to R working Directory
* Rename the folder name to "UCIHAR_Dataset"
* Ensure the related Packages are installed (`plyr` and `dplyr` packages). 
* Now you could run `run_analysis.R` in R and it will generates the data file `HARfeaturesMean.txt`.

## Read And View The Tidy Data Set Using R
Code to read the tidy data set from *HARfeaturesMean.txt* is included below : 
``` R
# Use read.table() to read the data, and View() to view the data
data <- read.table(file_path, header = TRUE)
View(data)
```
## References
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
