###############################################################
Code Book for "combined.txt"" and "tidy_summary.txt"" files
###############################################################
Created by: ill-cam
###############################################################

Data Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

All data were downloaded from the University of California, Irvine's Machine Learning Repository using the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Set Information:

The data sets related to experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The zip file size is 59.7 MB
###############################################################

The "combined.txt"" file

Size is 9.4 MB

This file combines the data from the following six files into one table that includes all measurement data for all 30 participants in the study.

     *subject_train.txt
     *X_train.txt
     *y_train.txt
     *subject_test.txt
     *X_test.txt
     *y_test.txt

The new combined data table has 10,299 rows and 82 columns.

Variables:

*"subject""

Identifies the subject that each observation pertains to. Values range from 1-30, as there were 30 subjects that participated in the study. The values for this variable come from the "subject_train.txt" and "subject_test.txt" files and are matched to the measurement data tables by row number.

*"code"

Identifies the numeric code pertaining to the physical activity the subject was performing when the measurements in the observation were recorded.
Values range from 1-6.

*"activity""

Identifies the physical activity the subject was performing when the measurements in the oberservation were recorded.

The variable has six levels. The numeric values initially included in the data set have been converted to labels via the "activity_labels.txt" file. The correspondence between numeric values and activity labels is outlined below:

1 = WALKING
2 = WALKING_UPSTAIRS
3 = WALKING_DOWNSTAIRS
4 = SITTING
5 = STANDING
6 = LAYING


*Measure variables (79 total)


The measures (referred to as "features" in the original data sets) included in this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

The values are normalized and bounded within [-1,1].

The set of variables that were estimated from these signals and included in the "combined.txt" file are: 

*mean(): Mean value
*std(): Standard deviation

Additional variables are included in the original data sets. 
The complete list of variables of each feature vector is available in "features.txt" in the UCI HAR zip file.

###############################################################

The "tidy_summary.txt"" file

Size is 53.4 KB

The data table has 35 rows and 81 columns.

This table takes the data in the "combined.txt" file and summarizes the average value of each measure by subject and activity.

There are 35 rows because there are 35 unique combinations of a subject and activity. 

