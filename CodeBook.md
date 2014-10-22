##Getting and Cleaning Data Course Project

the analisys steps are as follow:

1) The directory structure to call the source files is,
	
    data
	test
	  subject_test.txt
	  X_test.txt
	  y_test.txt		
	train
	  subject_train.txt
	  X_train.txt
	  y_train.txt

2) Each data source (test, train) have three variables to read the primary data from the txt files:
	
   /data/train/subject_train.txt : subject_id column (train_col_subject)
   /data/train/y_train.txt : actitvity_id column (train_col_activity)
   /data/train/X_train.txt: data vector (train_vector)
	
   The same applies for test data source.

3) Using the train_vector and the apply function the script generate 2 new variables that hold the mean value and the
   standart deviation value for each row in train_vector. (mean_train_vector,sd_train_vector). In this point the apply function just get the amount
   of observations according to the length of subject and activity vectors.

   The same applies for test_vector.	

4) Having 4 variables (train_col_subject,train_col_activity,mean_train_vector,sd_train_vector) holding data sets of the same length then 
   the script proceeds to  generate a new data set (train_set) binding the columns using the cbind() function. 

   The same applies for test_vector, the generated data set is called test_set.			
   
	
5) Here, the script sets the column names ("subject_id","activity_id","mean","sd") for the new data set. 

6) Once the scritpt has the two main data sets (train_set,test_set) it proceed to merge both using the cbind() function, the result of this is a new
   data.frame variable called merged_data.

7) For labeling  the data set (merged_data) with descriptive variable names,  the script creates a character vector with the given names.
   it will be used in the chainning operation to tidying the merged data set.

8) Using the dplyr library the script cast to the merged data into a new variable called tidy_set, as its name implies this variable is ready 
   for develop the tidying process like this:
   
	tidy_set <- tidy_set %>%

	  mutate(activity_id = activity_labels[activity_id]) %>%  -------> tansforms the numeric values for character ones based on the activity
									   labels vector created before in the step 7

	  group_by(subject_id,activity_id) %>%			 

	  summarize(mean = mean(mean,rm.na=TRUE), sd= mean(sd,rm.na=TRUE))

9) sorry for my english ;) ...

