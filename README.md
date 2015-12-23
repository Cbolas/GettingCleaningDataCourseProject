### Run_analysis.R script for preparing a tidy data set according to the Getting and Cleaning Data Course Project


### Description

The *run_analysis.R* script contains the run_analysis function that performs the following tasks:

* The HAR_Dataset.zip file download.
* Unzipping of the HAR_Dataset.zip file to HAR files directory within working directory.
* Raw data sets reading from HAR files directory.
* Data sets merging, subsetting and cleaning.

### Usage

run_analysis(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

### Arguments

**url**	  The url address for the HAR_Dataset.zip that is accessible on the internet. If the file already exists, the download is not executed.

### Requirements

Package reshape2 must be installed.

### Details

This function returns a tidy data set that contains the average of the mean and standard deviation HAR values for each activity and each subject as requested by the Getting and Cleaning Data Course Project.

Unless url is specified, the HAR_Dataset.zip file is downloaded from the url supplied by Course Project page. If the file already exists, the download is not executed.

The HAR_Dataset.zip is unzipped within the working directory to his "UCI HAR Dataset" directory where all the necessary files are located.

The function reads these related files as tables and merge them in a big data set, extracting only the mean and standard deviation variables.

Next, the data set variables and activities are properly labelled according to the codebook.txt file.

Finally, the data set is reshaped by grouping each variable and calculating its respective average for each activity and each subject through reshape2 package functions.
