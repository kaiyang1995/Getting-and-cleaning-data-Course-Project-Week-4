activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "code")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
names(X)
Merged_Data <- cbind(Subject, Y, X)
Subject <- rbind(subject_train, subject_test)

Merged_Data <- cbind(Subject, Y, X)

library(dplyr)
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
 FinalData <- TidyData %>%
+     group_by(subject, activity) %>%
+     summarise_all(funs(mean))

write.table(FinalData, "Tidied Data.txt", row.name=FALSE)
