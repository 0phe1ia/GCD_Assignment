This file explains how all of the scripts work and how they are connected

Scripts
========================================
- Choose the location of your [root folder]
- Place the [run_analysis.R] script here
- Unzip the data files here i.e.[root]\UCI HAR Dataset

How to run the scripts
========================================
- Start R Studio
- source(Òrun_analysis.RÓ)
- run_analysis([directory], [output file])
	> [directory] is the location of the data files (i.e. [your path]\UCI HAR Dataset)
	> output_filename (i.e. output.txt) is the name of the file. The file will be written to the directory path provided (i.e. [your path]\UCI HAR Dataset) 
- the script will set the working directory based on the [directory] path provided
- the file will read files from
	> [your path]\UCI HAR Dataset\activity_labels.txt
	> [your path]\UCI HAR Dataset\features.txt
	> [your path]\UCI HAR Dataset\train\subject_train.txt
	> [your path]\UCI HAR Dataset\train\y_train.txt
	> [your path]\UCI HAR Dataset\train\x_train.txt
	> [your path]\UCI HAR Dataset\test\subject_test.txt
	> [your path]\UCI HAR Dataset\test\y_test.txt
	> [your path]\UCI HAR Dataset\test\x_test.txt
- the output file will be written to to the directory path provided (i.e. [your path]\UCI HAR Dataset) 
 
