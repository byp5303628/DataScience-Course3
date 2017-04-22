# Merges the training and the test sets to create one data set.

test_X = read.table("UCI HAR Dataset/test/X_test.txt")
test_Y = read.table("UCI HAR Dataset/test/y_test.txt")

train_X = read.table("UCI HAR Dataset/train/X_train.txt")
train_Y = read.table("UCI HAR Dataset/train/y_train.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement.

features = read.table("UCI HAR Dataset/features.txt")

keys = grep("mean|std", features$V2)
new_names = features$V2[keys]

test = test_X[keys]
train = train_X[keys]

merged_data = rbind(test, train)

# Uses descriptive activity names to name the activities in the data set

colnames(merged_data) = new_names

# Appropriately labels the data set with descriptive variable names.


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data = data.frame()

mean_values = c()

for(name in new_names){
  mean_values = c(mean_values, mean(as.numeric(merged_data[[name]])))
}

tidy_data = data.frame(name=new_names, mean_value=mean_values)

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
