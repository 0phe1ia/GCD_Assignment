run_analysis <- function(directory, output_filename) 
{
##load library for table manipulation 
library(dplyr)

################################################################################################
## Merges the training and the test sets to create one data set.
################################################################################################
setwd(directory)

## Read all the relevant files
activity = tbl_df(read.table("activity_labels.txt", fill=TRUE, strip.white=TRUE))
features = read.table("features.txt", fill=TRUE, strip.white=TRUE)

train_subject = tbl_df(read.table("train/subject_train.txt", fill=TRUE, strip.white=TRUE))
train_Y = tbl_df(read.table("train/y_train.txt", fill=TRUE, strip.white=TRUE))
train_X = read.table("train/x_train.txt", fill=TRUE, strip.white=TRUE)

test_subject = tbl_df(read.table("test/subject_test.txt", fill=TRUE, strip.white=TRUE))
test_Y = tbl_df(read.table("test/y_test.txt", fill=TRUE, strip.white=TRUE))
test_X = tbl_df(read.table("test/x_test.txt", fill=TRUE, strip.white=TRUE))

## combine the train and test datasets
subject = rbind(train_subject, test_subject)
Y = rbind(train_Y, test_Y)
X = rbind(train_X, test_X)

##change column names
activity <- rename(activity, activity=V1, activity_name=V2)   ##Renames V1 column to [activity], V2 column to [activity_name]
subject <- rename(subject, subject=V1)   ##Renames V1 column to [subject]

##Renames V[1..n] columns as stated in features_info.txt
colnames(X) <- features[,2]              

## Extracts only the measurements on the mean and standard deviation for each measurement. 
## only pick the ..std() or ..mean() columns using a regex expression
X_filtered <- X[,grepl("std\\(\\)|mean\\(\\)", colnames(X))]

## Replace activity with descriptive names from activity_labels.txt
Y <- rename(Y, activity=V1)              ##Renames V1 column to [activities]
Y <- inner_join(Y, activity, copy=TRUE)
Y <- Y %>% 
      select(-activity) %>% 
      rename(activity = activity_name)

##Merge the train [subject], [Y] datasets and filtered [trainX_filtered] dataset
ds <- cbind(cbind(subject, Y), X_filtered)

################################################################################################
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
################################################################################################
final <- ds %>% 
            group_by(subject, activity) %>% 
            summarise_each(funs(mean))

## Use write.table() to output your results, using row.name=FALSE 
write.table(final, file=output_filename, quote = FALSE, row.name = FALSE)
}