This R script extracts the means and standard deviations of the measurements contained in the “Human Activity Recognition Using Smartphones Dataset”, published by Jorge L. Reyes-Ortiz, et al, and returns (1) a “tidy” data set containing those means and standard deviations, and (2) a second independent “tidy” data set containing the average of each variable across each activity and subject.

Please refer to the README accompanying the “Human Activity Recognition Using Smartphones Dataset” for a complete explanation of how this experiment was performed the original data collected. The dataset and accompanying documentation are available at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script presupposes that the UCI HAR Dataset has been downloaded and unzipped,and that the working directory has been set to the directory that encloses the dataset (i.e.  .../UCI HAR Dataset). If the working directory has not already been set as described, the script will produce errors.

To generate these tidy datasets, the following steps were performed:

(1) All tables are read into R, except for tables contained in the Inertial subdirectories located inside the train and test directories, respectively (they are excluded because the means and standard deviations were already computed by Reyes Ortiz et al from these data and saved to other tables);

(2) The training observations are merged with the test observations into a data frame called data.merged;

(3) The subjects and activities corresponding to each observation both both the training and test data sets are merged, forming a dataframe called id.merged with two variables (subject and activity)

(4) Logical variables are constructed from the original features table that accompanied the data set identifying variables representing means and standard deviations of the measurements, and those variables are extracted to a new dataframe called data.extracted by subsetting data.merged on those logicals;

(5) The variables in data.extracted are assigned the names contained in the features table (see codebook.md for a list of all variable names);

(6) Variables in id.merged are assigned the names subject and activity, and the inner join and select functions from the dplyr package are used to replace the activity labels (which were the numbers 1 through 6) with the corresponding descriptive activity names;

(7) The final tidy data set is obtained by merging the ID variables with the measurement variables;

(8) Means are computed for each set of observation across the the subject and activity variables using the aggregate() function (a variation on the split-apply-combine method) to obtain the data set of averages.