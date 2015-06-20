## this script presupposes that the UCI HAR Dataset has been downloaded and unzipped,
## and that the working directory has been set to the directory that encloses the 
## dataset (i.e.  .../UCI HAR Dataset)
##
## Data contained the test and train inertial folders are ignored, since Step 2 of the 
## assignment instructions calls on us to "extract only the measurements on the mean and 
## standard deviation for each measurement", and those means and standard deviations are 
## included as features elsewhere in the original dataset
## 
## install and load dplyr package if not already installed
if(!require("dplyr",character.only = TRUE)){
    install.packages("dyply",dep=TRUE)
    library(dplyr)
}
##
## read in files
activitylabels <- read.table("activity_labels.txt")
features <- read.table("features.txt", stringsAsFactors=FALSE)
ytest <- read.table("./test/y_test.txt")
xtest <- read.table("./test/x_test.txt")
subjtest <- read.table("./test/subject_test.txt")
ytrain <- read.table("./train/y_train.txt")
xtrain <- read.table("./train/x_train.txt")
subjtrain <- read.table("./train/subject_train.txt")
##
## merge training and test data
data.merged <- rbind(xtest,xtrain)
id.merged <- cbind(rbind(subjtest,subjtrain),rbind(ytest,ytrain)) # data.merged and id.merged will be cbinded after their variable names have been fixed
##
## extract variables representing mean and standard deviation
##
## Note: the angle variables are excluded since, according to features_info.txt they were 
## calculated from the means of the original X,Y,Z vectors, and it is impossible to compute 
## the standard deviation of the angles without first returning to those original vectors 
## (i.e. by finding the angles for each individual observation and then computing mean and 
## standard dev)
ismean <- grepl("^[^_]+-mean",features[,2])
isstd <- grepl("^[^_]+-std",features[,2])
isincluded <- ismean|isstd
data.extracted <- data.merged[,isincluded]
features.extracted <- features[isincluded,]
##
## rename variables and rename activities so that they are descriptive
## Note: variables representing features are given the name of the feature
for(i in 1:dim(features.extracted)[1]){ #variables are renamed one at a time
    names(data.extracted)[i] <- features.extracted[i,2]
}
names(id.merged)[1] <- "subject"
id.renamed <- select(inner_join(id.merged,activitylabels, by = "V1"), subject, activity = V2) # activities labels are relaced with decriptive names
##
## merge data with their subjet and activity ids to create the final tidy dataset and the dataset of averages
data.tidy <- cbind(id.renamed,data.extracted)
data.tidy.avg <- aggregate(.~subject+activity, data.tidy, FUN=mean)
rm(features,features.extracted,ismean,isstd,isincluded,activitylabels,data.extracted,data.merged,id.merged,id.renamed,ytest,xtest,subjtest,ytrain,xtrain,subjtrain)