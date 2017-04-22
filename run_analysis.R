# Merges the training and the test sets to create one data set.

test_X = read.table("UCI HAR Dataset/test/X_test.txt")
test_Y = read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

train_X = read.table("UCI HAR Dataset/train/X_train.txt")
train_Y = read.table("UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

features = read.table("UCI HAR Dataset/features.txt")
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement.

keys = grep("mean|std", features$V2)
new_names = features$V2[keys]

test = test_X[keys]
train = train_X[keys]

test_Y$V1 = activity_labels$V2[as.numeric(test_Y$V1)]
train_Y$V1 = activity_labels$V2[as.numeric(train_Y$V1)]

merged_data = rbind(test, train)
merged_data_Y = rbind(test_Y, train_Y)

subject_merge = rbind(subject_test, subject_train)

# Uses descriptive activity names to name the activities in the data set

colnames(merged_data) = new_names

#merged_data$Activity = merged_data_Y$V1
#merged_data$Subject = subject_merge$V1

# Appropriately labels the data set with descriptive variable names.


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data = aggregate(merged_data, list(subject_merge$V1, merged_data_Y$V1), mean)
colnames(tidy_data)[[1]] = "Subject"
colnames(tidy_data)[[2]] = "Activity"

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
