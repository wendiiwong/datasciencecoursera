# Getting And Cleaning Data Course Project

## Introduction
This project is the work from Coursera Course "Getting and Cleaning Data". The purpose of this project is to demonstrate student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available on [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and you can download the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project.
 
## Repositary Contents
File Name | Description
--------- | -----------
README.md | Documentation explaining the project and how to use files contained in the repository.
CodeBook.md | A code book that describes the variables, the data, and any transformations or work that performed to clean up the data.
run_analysis.R | R script for data cleaning and perform the analysis.
HARfeaturesMean.txt | A tidy data set with the average of each feature's variable for each activity and each subject. 

## Read and view the tidy data set using R
Code to read the tidy data set from *HARfeaturesMean.txt* is included below : 
``` R
# Use read.table() to read the data, and View() to view the data
data <- read.table(file_path, header = TRUE)
View(data)
```
## References
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
