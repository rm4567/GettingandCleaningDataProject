README

R script named run_analysis.R will perform the following tasks for the course project:

1) Set the working directory. 
2) Read text files names features (labelled f) and activity_label (labelled al)
3) Read training Data x_train (labelled xtr), y_train (labelled ytr) and subject_train (labelled STtr)
4) Read testing Data x_test (labelled xtst), y_test (labelled ytst) and subject_test (labelled STtst)
5) Give column names to training Data 
6) Give column names to testing Data 
7) Combine training and testing Data
8) Merge training and testing Data into one variable
9) Extract only mean and standard deviation for each measurement into variable named m_sd
10) A column is made in m_sd which writes the description of each activity by matching ID of Activity
11) The data set is labelled with descriptive variable names as follows
   a) Freq converted to FREQUENCY
   b) ^f converted to Frequency
   c) Mag converted to Magnitude
   d) ^t converted to Time
   e) Gyro converted to Gyroscope
   f) mean() converted to MEAN
   g) Acc converted to Accelerometer
   h) std() converted to STD
12) A second, independent tidy data set with the average of each variable for each activity and each subject
    is then created.
13) Final outcome is written in a text file named TIDYDATASET.txt