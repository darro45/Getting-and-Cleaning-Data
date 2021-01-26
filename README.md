# Getting-and-Cleaning-Data-Course-Project
## How does the script work?

1. First of all it's a MUST to download the raw data set available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the  working directory, to make sure that this code works properly.
2. "reshape2" library is required. For this reason, download this library and initilize it writing: library(reshape2)
3. The code unzips and gives the paths of the dataset's files from Step[1]
4. Using the paths given by [3], save the data set files of interest into a variable.
5. Taking advantage of the "features.txt" file function, save the different features' names for later use in labeling the columns.
6. The code reads the "X_test.txt" data and labels its columns using [5]. 
7. The code reads the "y_test.txt" and "subject_test.txt" files and sets their colum name using colnames(...) funcion.
8. Create a dataset corresponding to the test set by column binding [6] and [7].
9. Repeat [6] with "X_train.txt" and [7] with "y_train.txt" and "subject_train.txt" datasets. Then create the dataset that corresponds to the train set.
10. Merge the training and the test sets created to created in [8] and [9] by using rbind(...) 
11. By using the column names and taking advantage of the grepl(...) function, the code extracts only the measurements on the mean and standard deviation for each measurement.
12. After analyzing "activity_labels.txt" and using the factor(...) function, the code adds a new column to the data frame obtained after[11] labeled as "descriptive.Label" in order to use descriptive activity names to name the activities in the data set.
13. From the data set in step [12], the code creates a second, independent tidy data set with the average of each variable for each activity and each subject.
14. Finally, a .txt file containing the new tidy dataset is created.
