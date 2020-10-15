# Download the raw data set available in: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# into your working directory.

# Load some necessary libraries
library(reshape2)

# Unzip and read the data set files 
master <- as.character(unzip("getdata_projectfiles_UCI HAR Dataset.zip",list = TRUE)$Name) #Get the dataset's file names

# Save the data set files of interest into a variable
files.interest <- c(master[16:18],master[30:32])

# Column labeling of the data of interest
features <- master[grepl("features.txt", master)]
features.names <- read.table(unz("getdata_projectfiles_UCI HAR Dataset.zip", features),header=FALSE);

# Read "test" data, organize it and label columns
data.test.subject <- read.table(unz("getdata_projectfiles_UCI HAR Dataset.zip", files.interest[1]), header=FALSE); colnames(data.test.subject) <- c("Subject")   
data.X.test <- read.table(unz("getdata_projectfiles_UCI HAR Dataset.zip", files.interest[2]), header=FALSE); colnames(data.X.test) <- features.names$V2
data.y.test <- read.table(unz("getdata_projectfiles_UCI HAR Dataset.zip", files.interest[3]), header=FALSE); colnames(data.y.test) <- c("Label")
data.test <- cbind(data.X.test,data.y.test,data.test.subject)

# Read "train" data, organize it and label columns
data.train.subject <- read.table(unz("getdata_projectfiles_UCI HAR Dataset.zip", files.interest[4]), header=FALSE); colnames(data.train.subject) <- c("Subject")
data.X.train <- read.table(unz("getdata_projectfiles_UCI HAR Dataset.zip", files.interest[5]), header=FALSE); colnames(data.X.train) <- features.names$V2
data.y.train <- read.table(unz("getdata_projectfiles_UCI HAR Dataset.zip", files.interest[6]), sep="", header=FALSE);colnames(data.y.train) <- c("Label")
data.train <- cbind(data.X.train,data.y.train,data.train.subject)

# 1. Merge the training and the test sets to create one data set
tidy.data <- rbind(data.test,data.train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
len <- length(tidy.data)
mean.meas <- grep("mean()",features.names$V2,fixed = TRUE)
std.meas <- grep("std()",features.names$V2,fixed = TRUE)
meas.interest <- c(sort(c(mean.meas,std.meas)),len,len-1)
data.mean.std <- tidy.data[,meas.interest]

# 3-4. Uses descriptive activity names to name the activities in the data set
data.mean.std$descriptive.Label <- factor(data.mean.std$Label, 
                                         labels= c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING"))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

dataset.average <- melt(data.mean.std,id = c("Subject","descriptive.Label"), measure.vars = names(data.mean.std)[1:66])
tidy.average.dataset <- dcast(dataset.average, Subject + descriptive.Label ~ variable,mean)
tidy.average.dataset <- tidy.average.dataset[order(tidy.average.dataset$descriptive.Label),]

# Create a .txt file containing the new tidy dataset
write.table(tidy.average.dataset, "./avg_tidy_dataset.txt",row.names = FALSE)
