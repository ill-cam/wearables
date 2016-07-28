#Download and unzip the files, storing the contents of each file in separate tables
temp <- tempfile();
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp);
subject_train <- unzip(temp, "UCI HAR Dataset/train/subject_train.txt");
subject_train <- read.table(subject_train);
activities_train <- unzip(temp, "UCI HAR Dataset/train/y_train.txt");
activities_train <- read.table(activities_train);
data_train <- unzip(temp, "UCI HAR Dataset/train/X_train.txt");
data_train <- read.table(data_train);
subject_test <- unzip(temp, "UCI HAR Dataset/test/subject_test.txt");
subject_test <- read.table(subject_test);
activities_test <- unzip(temp, "UCI HAR Dataset/test/y_test.txt");
activities_test <- read.table(activities_test);
data_test <- unzip(temp, "UCI HAR Dataset/test/X_test.txt");
data_test <- read.table(data_test);
activity_labels <- unzip(temp, "UCI HAR Dataset/activity_labels.txt");
activity_labels <- read.table(activity_labels);
data_labels <- unzip(temp, "UCI HAR Dataset/features.txt");
data_labels <- read.table(data_labels);

#Delete the temporary file storing all of the zip file contents
unlink(temp);

#Merge the data sets
subject <- rbind(subject_train, subject_test);
colnames(subject) <- "subject";
activity <- rbind(activities_train, activities_test);
activity2 <- merge(activity,activity_labels,by.x = 1, by.y = 1);
colnames(activity2) <- c("code","activity")
measures <- rbind(data_train, data_test);
colnames(measures) <- data_labels$V2;
mean_std_colnums <- grep("mean|std",data_labels$V2,fixed = FALSE);
mean_std_cols <- measures[,mean_std_colnums];
combined <- cbind(subject, activity2, mean_std_cols);

#Write the new combined data table to a csv file for potential later use
write.csv(combined, "combined.csv", row.names = FALSE);

#Create a summary table from the new combined data file with mean and standard
#deviation values grouped by subject and activity
library(dplyr);
fby1 <- factor(combined$subject, exclude = "");
fby2 <- factor(combined$activity, exclude = "");
tidy_summary <- aggregate(x = combined, by = list(fby1, fby2), mean);
tidy_summary <- tidy_summary %>% 
  arrange(subject) %>%
  select(-(subject:activity)) %>%
  rename(subject = Group.1, activity = Group.2);

#Write the new summary table to a csv file for potential later use
write.csv(tidy_summary, "tidy_summary.csv", row.names = FALSE)