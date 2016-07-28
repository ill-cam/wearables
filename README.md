###############################################################
Code Book for combined.dat and tidy_summary.dat files
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
###############################################################

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The UCI HAR zip file includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
###############################################################

Creation of the "combined.csv"" file

The steps for creating the "combined.csv" file from the components of the UCI HAR zip file can be reenacted with the "run_analysis.R" script. The main steps are as follows:

1. Unzip the UCI HAR files and create separate tables for the "test" and "train"
   group observations, subject values, and activity values, plus the activity and
   measures ("features") labels. 
2. Combine the subject values for the "test" and "train" groups using rbind.
3. Combine the activity values for the "test" and "train" groups using rbind.
4. Merge the numeric activity values with the activity label values.
3. Combine the measurement values for the "test" and "train" groups using rbind.
4. Use grep function to extract columns with "mean" or "std" in the column name 
   from the measurements table.
5. combine the subject, activity, and measurement values (only the extracted mean    and std values) into one table using cbind.

###############################################################

Creation of the "tidy_summary.csv"" file

vThe steps for creating the "tidy_summary.csv" file from the "combined.csv" file can be reenacted with the "run_analysis.R" script. The main steps are as follows:

1. Start with the "combined" data set created using the steps outlined above.
2. Load the dplyr package.
3. Designate the subject and activity columns in the "combined" data set as 
   factors using the factor function.
4. Apply the aggregate function to the combined data set using the subject and 
   activity factors for grouping and executing the mean function across all 
   columns in the data set for each group. This creates the new summary table  
   ("tidy_summary").
5. Use the arrange function to sort the values in this new summary table by 
   subject.
6. Use the select function to remove the "subject," "code," and "activity" 
   columns, as "subject" and "activity" have been replaced by the grouping 
   columns and "code" is redundant.
7. Use the rename function to rename the grouping columns "subject" and 
   "activity."
