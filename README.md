###Analysis:

Download and extract project data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
This will create a top level dir UCI HAR Dataset on your disk.

per the README.txt one observation is for 561 features when 1 subject is doing 1 activity.
Training set was created by 70% of the subjects and the test by the balance 30%. They are identical in structure.

	1. Merge the 2 identical x_test and x_train to create all of the observations in 'allData'

The features file describes each of the 561 observations

	2. Add this as column headers for our allData

The requirement is -> Extract only the measurements on the mean and standard deviation for each measurement.

	3. Not sure but we are going to extract all columns ending in either mean() or std()
	
The allData dataset at this stage doesn't indicate who was doing what for each of the observation

	4. Merge subject_test and subject_train with a col name 'Subject'
	5. Merge the activities y_test and y_train with a col name 'Activity'
	6. Merge these to allData. The cols will now look like [Subject, Activity, .........561 feature cols...........]

Activity is displayed as a code (from y_train/y_test) at this stage

	7. Map these codes to their meaning in the activity_labels file and update allData

allData set is now final with the details rquired	

	8. Finally create a tidy data set by averaging each of the features by subject and Activity.
	
	
  

