##CodeBook

Course:  Getting and Cleaning Data  
Assignment:  1

####Overview

The data set described here is derived from experiments conducted at the Non Linear Complex Systems Laboratory at the Università degli Studi di Genova, Italy.  Volunteers performed six tasks while wearing a Samsung Galaxy S II smartphone on their waist.  The original data set contains: triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration; triaxial angular velocity from the gyroscope; a 561-feature vector with time and frequency domain variables; an activity label; and an identifier of the subject who carried out the experiment.

The revised data set contains mean by activity and subject, for each mean and standard deviation feature in the original dataset.

####Acknowledgments and License

The original research was conducted by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

Use of the original data set in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

####Data Source

The assignment uses [data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the Human Activity Recognition Using Smartphone data set, version 1, available from the Machine Learning Repository at the Center for Machine Learning and Intelligence Systems at the University of California, Irvine (UCI).

A zip file of the raw data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  The md5 checksum of the zip file used for this assignment is `d29710c9530a31f303801b6bc34bd895`  The `README.txt` file included with the zip file describes the contents and file structure of the raw data.

####Data Dictionary - `Tidy1.txt`

	[1] Name:  			activity
	    Description:	A factor describing the activity performed by the
	    			 	subject that resulted in the measurement data.
		Values:			Walking
			    		WalkingUpstairs
			    		WalkingDownstairs
			    		Sitting
			    		Standing
			    		Laying	
    
    [2] Name:  			subject
	    Description:	A unique integer identifying the volunteer
	    				performing the specified activity.
		Values:			1:30
    
    [3] Name:  			time.BodyAcc.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain body acceleration along the
	    				X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [4] Name:  time.BodyAcc.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain body acceleration along the
	    				Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [5] Name:  time.BodyAcc.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain body acceleration along the
	    				Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [6] Name:  time.BodyAcc.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				acceleration along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [7] Name:  time.BodyAcc.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				acceleration along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [8] Name:  time.BodyAcc.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				acceleration along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [9] Name:  time.GravityAcc.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain gravity acceleration along
	    				the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [10] Name:  time.GravityAcc.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain gravity acceleration along
	    				the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [11] Name:  time.GravityAcc.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain gravity acceleration along
	    				the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [12] Name:  time.GravityAcc.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain gravity
	    				acceleration along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [13] Name:  time.GravityAcc.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain gravity
	    				acceleration along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [14] Name:  time.GravityAcc.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain gravity
	    				acceleration along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [15] Name:  time.BodyAccJerk.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean  of the time domain body acceleration jerk
	    				signal along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [16] Name:  time.BodyAccJerk.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean  of the time domain body acceleration jerk
	    				signal along the Y axis. Values are normalized
	    				between -1.0 and 1.0.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [17] Name:  time.BodyAccJerk.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean  of the time domain body acceleration jerk
	    				signal along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [18] Name:  time.BodyAccJerk.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				jerk acceleration signal along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [19] Name:  time.BodyAccJerk.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				jerk acceleration signal along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [20] Name:  time.BodyAccJerk.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				jerk acceleration signal along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [21] Name:  time.BodyGyro.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain gyro signal along the
	    				X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [22] Name:  time.BodyGyro.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain gyro signal along the
	    				Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [23] Name:  time.BodyGyro.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain gyro signal along the
	    				Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [24] Name:  time.BodyGyro.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain gyro
	    				signal along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [25] Name:  time.BodyGyro.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain gyro
	    				signal along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [26] Name:  time.BodyGyro.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain gyro
	    				signal along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [27] Name:  time.BodyGyroJerk.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain body gyro jerk
	    				signal along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [28] Name:  time.BodyGyroJerk.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain body gyro jerk
	    				signal along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [29] Name:  time.BodyGyroJerk.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the time domain body gyro jerk
	    				signal along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [30] Name:  time.BodyGyroJerk.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				jerk gyro signal along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [31] Name:  time.BodyGyroJerk.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				jerk gyro signal along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [32] Name:  time.BodyGyroJerk.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the time domain body
	    				jerk gyro signal along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [33] Name:  time.BodyAccMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the time domain body
	    				acceleration.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [34] Name:  time.BodyAccMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the time
	    				domain body acceleration.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [35] Name:  time.GravityAccMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the time domain gravity
	    				acceleration signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [36] Name:  time.GravityAccMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the time
	    				domain gravity acceleration signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [37] Name:  time.BodyAccJerkMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the time domain acceleration
	    				jerk signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [38] Name:  time.BodyAccJerkMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the time
	    				domain acceleration jerk signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [39] Name:  time.BodyGyroMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the time domain gyro
	    				signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [40] Name:  time.BodyGyroMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the time
	    				domain gyro signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [41] Name:  time.BodyGyroJerkMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the time domain gyro
	    				jerk signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [42] Name:  time.BodyGyroJerkMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the time
	    				domain gyro jerk signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [43] Name:  freq.BodyAcc.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body acceleration
	    				along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [44] Name:  freq.BodyAcc.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body acceleration
	    				along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [45] Name:  freq.BodyAcc.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body acceleration
	    				along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [46] Name:  freq.BodyAcc.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				acceleration along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [47] Name:  freq.BodyAcc.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				acceleration along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [48] Name:  freq.BodyAcc.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				acceleration along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [49] Name:  freq.BodyAccJerk.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body jerk acceleration
	    				along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [50] Name:  freq.BodyAccJerk.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body jerk acceleration
	    				along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [51] Name:  freq.BodyAccJerk.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body jerk acceleration
	    				along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [52] Name:  freq.BodyAccJerk.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				jerk acceleration along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [53] Name:  freq.BodyAccJerk.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				jerk acceleration along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [54] Name:  freq.BodyAccJerk.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				jerk acceleration along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [55] Name:  freq.BodyGyro.X.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body gyro signal
	    				along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [56] Name:  freq.BodyGyro.Y.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body gyro signal
	    				along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [57] Name:  freq.BodyGyro.Z.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the frequency domain body gyro signal
	    				along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [58] Name:  freq.BodyGyro.X.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				gyro signal along the X axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [59] Name:  freq.BodyGyro.Y.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				gyro signal along the Y axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [60] Name:  freq.BodyGyro.Z.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the frequency domain body
	    				gyro signal along the Z axis.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [61] Name:  freq.BodyAccMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the frequency domain body
	    				acceleration.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [62] Name:  freq.BodyAccMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the
	    				frequency domain body acceleration.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [63] Name:  freq.BodyAccJerkMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the frequency domain body
	    				jerk acceleration.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [64] Name:  freq.BodyAccJerkMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the
	    				frequency domain body jerk acceleration.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [65] Name:  freq.BodyGyroMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the frequency domain body
	    				gyro signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [66] Name:  freq.BodyGyroMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the
	    				frequency domain body gyro signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [67] Name:  freq.BodyGyroJerkMag.Mean
	    Description:  	The mean for this subject-activity pair of the
	    				mean of the magnitude of the frequency domain body
	    				gyro jerk signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
    
    [68] Name:  freq.BodyGyroJerkMag.StdDev
	    Description:  	The mean for this subject-activity pair of the
	    				standard deviation of the magnitude of the
	    				frequency domain body gyro jerk signal.
		Values:  		-1.0 to 1.0 [normalized sensor readings]
