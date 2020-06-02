Overview of codes used in run_analysis.R


Dataset downloaded into file UCI "HAR Dataset" with "./data" directory created

activities <- activity_labels.txt (activity labels)

subject_test <- test/subject_test.txt (test data)

x_test <- test/X_test.txt : 2947 rows, 561 columns 

y_test <- test/y_test.txt : 2947 rows, 1 columns

subject_train <- test/subject_train.txt : 7352 rows, 1 column

x_train <- test/X_train.txt : 7352 rows, 561 columns

y_train <- test/y_train.txt : 7352 rows, 1 columns



X dataset is created by merging x_train and x_test.This and the following uses rbind() function.

Y dataset is created by merging y_train and y_test.

Subject  is created by merging subject_train and subject_testusing rbind() function

Merged_Data is created by merging Subject, Y and X using cbind() function


TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement


Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable


Descriptive variable names used:

code column in TidyData renamed into activities

All Acc in column’s name replaced by Accelerometer

All Gyro in column’s name replaced by Gyroscope

All BodyBody in column’s name replaced by Body

All Mag in column’s name replaced by Magnitude

All start with character f in column’s name replaced by Frequency

All start with character t in column’s name replaced by Time

The means of each variable for each activity and each subject, after grouped by subject and activity. This uses dplyr select function.
Final Data is created.

Export FinalData into Tidied Data.txt file.
