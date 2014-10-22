##codebooks 

### train data set

train_col_subject <- holds the subject data for train source


train_col_activity <- holds the activity data for train source


train_vector <- holds the data vectors for train source

mean_train_vector <- holds the result of using the apply function to get the mean value for every row

sd_train_vector <- holds the result of using the apply function to get the standar deviation  value for every row

train_set <-  holds the result of using the cbind function to merge train_col_subject,train_col_activity,mean_train_vector,sd_train_vector


### test data set

test_col_subject <- holds the subject data for test source


test_col_activity <- holds the activity data for test source


test_vector <- holds the data vectors for train source

mean_test_vector <- holds the result of using the apply function to get the mean value for every row

sd_test_vector <- holds the result of using the apply function to get the standar deviation  value for every row

test_set <-  holds the result of using the cbind function to merge train_col_subject,train_col_activity,mean_train_vector,sd_train_vector

### merged data

merged_data <- holds the result of using the rbind function to merge  train_set  test_set 

activity_labels = character vector with de values for each activity_id value ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

tidy_set <- tbl_df(merged_data)


tidy_set <- tidy_set %>%
  mutate(activity_id = activity_labels[activity_id]) %>%
  group_by(subject_id,activity_id) %>%
  summarize(mean = mean(mean,rm.na=TRUE), sd= mean(sd,rm.na=TRUE))
