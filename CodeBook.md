This file describes the variables, the data, and any transformations or work that you performed to clean up the data

Data
===============
[activity_labels.txt]
Contains the activity ID and corresponding text labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

[features.txt]
Contains the names of measures taken during the experiment. The names corresponds to the data columns in x_train.txt/x_test.txt

[subject_train.txt/subject_test.txt]
Contains the participating subjects who were randomly partitioned into the respective train dataset and test dataset. 
Each row in these files corresponds to a row in the respective [y_train.txt/y_test.txt] and [x_train.txt/x_test.txt] files.

[y_train.txt/y_test.txt]
Contains the activities that were measured on. 
Each row in these files corresponds to a row in the respective [subject_train.txt/subject_test.txt] and [x_train.txt/x_test.txt] files.

[x_train.txt/x_test.txt]
Contains the measures taken during the experiment. 
Each row in these files corresponds to a row in the respective [subject_train.txt/subject_test.txt] and [y_train.txt/y_test.txt] files.

Variables
===============
activity - contains contents of [activity_labels.txt]
features - contains contents of [features.txt]
train_subject - contains contents of [subject_train.txt]
train_Y - contains contents of [y_train.txt]
train_X - contains contents of [x_train.txt]
test_subject - contains contents of [subject_test.txt]
test_Y - contains contents of [y_test.txt]
test_X - contains contents of [x_test.txt]

subject - contains the subjects from the combined rows of train_subject and test_subject
Y - contains activities from the combined rows of train_Y and test_Y
X - contains measures from the combined rows of train_X and test_X
X_filtered - X with a reduced set of columns that only end in ..mean() or std() 

ds - contains the merged dataset from the combined columns of subject, Y and X_filtered

final - the dataset grouped by subject and activity, with the rest of measure columns being averaged out. 

Transformations
===============
1. Rows from [train_subject] and [test_subject] are combined into [subject]
2. Rows from [train_Y] and [test_Y] are combined into [Y]
3. Rows from [train_X] and [test_X] are combined into [X]

4. Rename the columns in [activity]
	> from [V1] to [activity]
	> from [V2] to [activity_name]
5. Rename the columns in [subject] 
	> from [V1] to [subject]

6. Rename the columns in [X] 
	> with measure names from [features]
7. With [X], a regex expression is used to filter for columns that end with std() or mean(). The reduced set of columns are stored in [X_filtered].

8. Rename the columns in [Y] 
	> from [V1] to [activity]
9. [Y] is joined to [activity] on the common column of both which is [activity]. The new column [activity_name] is also copied to [Y]
10. The column [activity] is dropped, and the column[activity_name] is renamed to [activity]

11. Columns of [Subject],[Y],[X_filtered] are combined and stored in ds as the final merged dataset. 

12. [ds] is then grouped by the columns (subject and activity) and the rest of the measure columns are averaged out. The results are stored in [final]

13. The results of [final] are written to an output file.




