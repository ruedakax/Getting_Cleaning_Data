#creating train data set
#read subject data column
train_col_subject <- read.csv("./data/train/subject_train.txt",sep=" ",header = FALSE)
#read activity data column
train_col_activity <- read.csv("./data/train/y_train.txt",sep=" ",header = FALSE)
#read data vectors and get the respective mean and sd vectors
train_vector <- read.csv("./data/train/X_train.txt",sep=" ",header = FALSE)
mean_train_vector <- apply(train_vector,1,mean,na.rm=TRUE)
sd_train_vector <- apply(train_vector,1,sd,na.rm=TRUE)
#getting the amount of observations according to the length of subject and 
#activity vectors
mean_train_vector <- mean_train_vector[1:nrow(train_col_activity)]
sd_train_vector <- sd_train_vector[1:nrow(train_col_activity)]
# merge and set the columnames
train_set <- cbind(train_col_subject,train_col_activity,mean_train_vector,sd_train_vector)
colnames(train_set)<- c("subject_id","activity_id","mean","sd")
#remove objects
rm(train_col_subject);rm(train_col_activity);rm(train_vector);rm(sd_train_vector);rm(mean_train_vector)
#creating test data set
#read subject data column
test_col_subject <- read.csv("./data/test/subject_test.txt",sep=" ",header = FALSE)
#read activity data column
test_col_activity <- read.csv("./data/test/y_test.txt",sep=" ",header = FALSE)
#read data vector and get the respective mean and sd vectors
test_vector <- read.csv("./data/test/X_test.txt",sep=" ",header = FALSE)
mean_test_vector <- apply(test_vector,1,mean,na.rm=TRUE)
sd_test_vector <- apply(test_vector,1,sd,na.rm=TRUE)
#getting the amount of observations according to the length of subject and 
#activity vectors
mean_test_vector <- mean_test_vector[1:nrow(test_col_activity)]
sd_test_vector <- sd_test_vector[1:nrow(test_col_activity)]
# merge and set the columnames
test_set <- cbind(test_col_subject,test_col_activity,mean_test_vector,sd_test_vector)
colnames(test_set)<- c("subject_id","activity_id","mean","sd")
#remove objects
rm(test_col_subject);rm(test_col_activity);rm(test_vector);rm(sd_test_vector);rm(mean_test_vector)
#merge train and set 
merged_data <- rbind(train_set,test_set)
#remove objects
rm(train_set);rm(test_set)
# activity_id character values for numeric ones one
activity_labels =c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
#tidying data
library(dplyr)
tidy_set <- tbl_df(merged_data)
rm(merged_data)
tidy_set %>%
  mutate(activity_id = activity_labels[activity_id]) %>%
  group_by(subject_id,activity_id) %>%
  summarize(mean = mean(mean,rm.na=TRUE), sd= mean(sd,rm.na=TRUE))




