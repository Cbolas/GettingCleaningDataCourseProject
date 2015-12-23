run_analysis <- function(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"){
  
  ## Download and unzip HAR Dataset files
  if(!file.exists("HAR_Dataset.zip")){
  download.file(url, "HAR_Dataset.zip", mode = "wb")
  }
  unzip("HAR_Dataset.zip")
  
  ## Reading the raw Dataset files
  Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
  Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
  subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
  Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
  Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
  subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
  features <- read.table("UCI HAR Dataset/features.txt")
  activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")

  ## Merging the training and the test sets to create one data set (Step 1)
  Xtotal <- rbind(Xtrain, Xtest)
  colnames(Xtotal) <- features$V2
  Ytotal <- rbind(Ytrain, Ytest)
  subjectotal <- rbind(subjecttrain, subjecttest)
  
  ## Extracting only the measurements on the mean and standard deviation for each measurement (Step 2)
  Xtotal <- Xtotal[c(grep("mean\\(|std", names(Xtotal)))]

  ## Using descriptive activity names to name the activities in the data set through merging activitylabels and Y data sets (Step 3)
  Xtotal <- cbind(activitylabels[Ytotal$V1,2], Xtotal)

  ## Merging the subject data set
  Xtotal <- cbind(subjectotal, Xtotal)
  
  ## Appropriately labelling the data set with descriptive variable names (Step 4)
  colnames(Xtotal) <- c("Subject",
"Activity",
"Body.Acceleration.on.X.Axis.at.Time.Domain-MEAN",
"Body.Acceleration.on.Y.Axis.at.Time.Domain-MEAN",
"Body.Acceleration.on.Z.Axis.at.Time.Domain-MEAN",
"Body.Acceleration.on.X.Axis.at.Time.Domain-STD",
"Body.Acceleration.on.Y.Axis.at.Time.Domain-STD",
"Body.Acceleration.on.Z.Axis.at.Time.Domain-STD",
"Gravity.Acceleration.on.X.Axis.at.Time.Domain-MEAN",
"Gravity.Acceleration.on.Y.Axis.at.Time.Domain-MEAN",
"Gravity.Acceleration.on.Z.Axis.at.Time.Domain-MEAN",
"Gravity.Acceleration.on.X.Axis.at.Time.Domain-STD",
"Gravity.Acceleration.on.Y.Axis.at.Time.Domain-STD",
"Gravity.Acceleration.on.Z.Axis.at.Time.Domain-STD",
"Body.Acceleration.Jerk.on.X.Axis.at.Time.Domain-MEAN",
"Body.Acceleration.Jerk.on.Y.Axis.at.Time.Domain-MEAN",
"Body.Acceleration.Jerk.on.Z.Axis.at.Time.Domain-MEAN",
"Body.Acceleration.Jerk.on.X.Axis.at.Time.Domain-STD",
"Body.Acceleration.Jerk.on.Y.Axis.at.Time.Domain-STD",
"Body.Acceleration.Jerk.on.Z.Axis.at.Time.Domain-STD",
"Body.Angular.Velocity.on.X.Axis.at.Time.Domain-MEAN",
"Body.Angular.Velocity.on.Y.Axis.at.Time.Domain-MEAN",
"Body.Angular.Velocity.on.Z.Axis.at.Time.Domain-MEAN",
"Body.Angular.Velocity.on.X.Axis.at.Time.Domain-STD",
"Body.Angular.Velocity.on.Y.Axis.at.Time.Domain-STD",
"Body.Angular.Velocity.on.Z.Axis.at.Time.Domain-STD",
"Body.Angular.Velocity.Jerk.on.X.Axis.at.Time.Domain-MEAN",
"Body.Angular.Velocity.Jerk.on.Y.Axis.at.Time.Domain-MEAN",
"Body.Angular.Velocity.Jerk.on.Z.Axis.at.Time.Domain-MEAN",
"Body.Angular.Velocity.Jerk.on.X.Axis.at.Time.Domain-STD",
"Body.Angular.Velocity.Jerk.on.Y.Axis.at.Time.Domain-STD",
"Body.Angular.Velocity.Jerk.on.Z.Axis.at.Time.Domain-STD",
"Body.Acceleration.Magnitude.at.Time.Domain-MEAN",
"Body.Acceleration.Magnitude.at.Time.Domain-STD",
"Gravity.Acceleration.Magnitude.at.Time.Domain-MEAN",
"Gravity.Acceleration.Magnitude.at.Time.Domain-STD",
"Body.Acceleration.Jerk.Magnitude.at.Time.Domain-MEAN",
"Body.Acceleration.Jerk.Magnitude.at.Time.Domain-STD",
"Body.Angular.Velocity.Magnitude.at.Time.Domain-MEAN",
"Body.Angular.Velocity.Magnitude.at.Time.Domain-STD",
"Body.Angular.Velocity.Jerk.Magnitude.at.Time.Domain-MEAN",
"Body.Angular.Velocity.Jerk.Magnitude.at.Time.Domain-STD",
"Body.Acceleration.on.X.Axis.at.Frequency.Domain-MEAN",
"Body.Acceleration.on.Y.Axis.at.Frequency.Domain-MEAN",
"Body.Acceleration.on.Z.Axis.at.Frequency.Domain-MEAN",
"Body.Acceleration.on.X.Axis.at.Frequency.Domain-STD",
"Body.Acceleration.on.Y.Axis.at.Frequency.Domain-STD",
"Body.Acceleration.on.Z.Axis.at.Frequency.Domain-STD",
"Body.Acceleration.Jerk.on.X.Axis.at.Frequency.Domain-MEAN",
"Body.Acceleration.Jerk.on.Y.Axis.at.Frequency.Domain-MEAN",
"Body.Acceleration.Jerk.on.Z.Axis.at.Frequency.Domain-MEAN",
"Body.Acceleration.Jerk.on.X.Axis.at.Frequency.Domain-STD",
"Body.Acceleration.Jerk.on.Y.Axis.at.Frequency.Domain-STD",
"Body.Acceleration.Jerk.on.Z.Axis.at.Frequency.Domain-STD",
"Body.Angular.Velocity.on.X.Axis.at.Frequency.Domain-MEAN",
"Body.Angular.Velocity.on.Y.Axis.at.Frequency.Domain-MEAN",
"Body.Angular.Velocity.on.Z.Axis.at.Frequency.Domain-MEAN",
"Body.Angular.Velocity.on.X.Axis.at.Frequency.Domain-STD",
"Body.Angular.Velocity.on.Y.Axis.at.Frequency.Domain-STD",
"Body.Angular.Velocity.on.Z.Axis.at.Frequency.Domain-STD",
"Body.Acceleration.Magnitude.at.Frequency.Domain-MEAN",
"Body.Acceleration.Magnitude.at.Frequency.Domain-STD",
"Body.Acceleration.Jerk.Magnitude.at.Frequency.Domain-MEAN",
"Body.Acceleration.Jerk.Magnitude.at.Frequency.Domain-STD",
"Body.Angular.Velocity.Magnitude.at.Frequency.Domain-MEAN",
"Body.Angular.Velocity.Magnitude.at.Frequency.Domain-STD",
"Body.Angular.Velocity.Jerk.Magnitude.at.Frequency.Domain-MEAN",
"Body.Angular.Velocity.Jerk.Magnitude.at.Frequency.Domain-STD")

  ## Creating a second independent tidy data set with the average of each variable for each activity and each subject (Step 5)
  require(reshape2)
  Xtotal <- melt(Xtotal, id = 1:2, measure.vars = -(1:2))
  dcast(Xtotal, Subject + Activity ~ variable, mean)
}
