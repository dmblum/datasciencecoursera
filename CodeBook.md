Two data frames are included, data.tidy and data.tidy.avg, each with the same 81 variables. The latter data frame is obtained from the former by computing the mean across each subject-activity pair. Transformations performed on the original data set to obtain these 81 variables and the observations that comprise them are described in the accompanying markdown file README.md

Variables:

Variable 1, subject, is a number between 1 and 30 representing a unique identifier of the test subject who generated the data

Variable 2, activity, isthe physical activity being performed by the test subject

Variables 3-81 are named with the following elements (each element is enclosed in square brackets, and a forward slash represents the factors comprising each element):
[t/f][body/bodybody/gravity][Acc/Gyro][jerk][mag][freq][mean()/meanFreq()/std()][-X/-Y/-Z]

The first letter, t or f, reflects whether the data is in the time domain or the frequency domain

The second term reflects reflects whether gravitational force or the body's force is being measured. The term "bodybody" is not described in the original codebook and may be a mistake, but variables containing this term are retained for completeness

The third term reflects whether the accelerometer or gyroscope was used to obtain the measurement

If the term "jerk" is included, then the observation represents a jerk signal (obtained through

If the term "mag" is included, then the observation is computed as the magnitude across X, Y, and Z axes using the Euclidean norm

The term "mean()" and "std(_" refer to mean or standard deviation, respectively, and "meanFreq()"" is a mean frequency specifically for meanurements in the frequency domain

Meansurements along a single axis will include as their final term "-X", "-Y", or "-Z" to denote that axis




