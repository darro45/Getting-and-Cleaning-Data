# Code Book

The dataset was retrieved [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Further information about this data set can be obtained in this [website.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Variables and data description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    + tBodyAcc-XYZ
    + tGravityAcc-XYZ
    + tBodyAccJerk-XYZ
    + tBodyGyro-XYZ
    + tBodyGyroJerk-XYZ
    + tBodyAccMag
    + tGravityAccMag
    + tBodyAccJerkMag
    + tBodyGyroMag
    + tBodyGyroJerkMag
    + fBodyAcc-XYZ
    + fBodyAccJerk-XYZ
    + fBodyGyro-XYZ
    + fBodyAccMag
    + fBodyAccJerkMag
    + fBodyGyroMag
    + fBodyGyroJerkMag

## Work performed to clean the data

1. Step 1: Unzip and read the [raw data set.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Step 2: Select and read the data files of interest (X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt)
3. Step 3: Use the "features.txt" file in order to label X_train.txt and X_test.txt datasets' columns.
4. Step 4: Label y_train.txt and y_test.txt (single column datasets) as "Label"
5. Step 5: Label subject_train.txt and subject_test.txt (single column datasets) as "Subject" 
6. Step 6: Cbind /test datasets.
7. Step 7: Cbind /train datasets.
8. Step 8: Merge /test (Step 6) and /train (Step 7) datasets using rbind(...) function.
9. Step 9: Create a independent tidy data set with the average of each variable for each activity and each subject.
