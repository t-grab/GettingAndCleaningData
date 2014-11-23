Getting and Cleaning Data - Course Project
==========================================
This is t-grab's repository for the "Getting and Cleaning Data" course 
of the Coursera "Data Science" specialization.

The goal of the project is to transform the UCI HAR Dataset into a tidy dataset.

## Parts of the Project

- UCI HAR Dataset: Dataset obtained from several experiments carried out by smartlab entitled
"Human Activity Recognition Using Smartphones Dataset". This project uses Version 1.0. It contains
sensor data from smartphones carried by 30 different volunteers in different activities. For more information
see the the README.txt in the "UCI HAR Dataset" folder. The data can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

- CodeBook.md: Contains descriptions of the variables, the data and transformations applied to the 
data by the script "run_analysis.R" to create the tidy datset.

- run_analysis.R: R script to perform the transformations on the training and test dataset of the UCI HAR dataset to create one tidy dataset. Afterwards it aggregates the tidy dataset by activity and subject and returns this aggregated dataset.

- tidyDataSet.*: Tidy dataset created by "run_analysis.R" in different formats.

- README.md

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.