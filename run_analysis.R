#Function the merge the test and training sets
merge_data_sets <- function(){
  test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
  training_data <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
  activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
  test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")
  training_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="")
  y_training <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="")
  
  y_test_labels <- merge(y_test,activity_names,by="V1")
  y_training_labels <- merge(y_training,activity_names,by="V1")
  
  test_data <- cbind(test_subjects,y_test_labels,test_data)
  training_data <- cbind(training_subjects,y_training_labels,training_data)
  
  total_data <-rbind(test_data,training_data)
  return(total_data)
}