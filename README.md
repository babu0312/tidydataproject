# tidydataproject

[Line 1-2] - we read training and testing dataset in train and test dataframes 
respectively.
Line 3 - we combine train and test dataframe into galaxy dataframe to form 
single dataset having complete dataframe together.
[Line 5-6] - we read features dataset (having all variable names) in features 
dataframe and find out the variables on which mean or standard deviation was 
computed. (66 variables)
[Line 8-9] - we change the values of fetures dataframe so that they are 
compatible to standard R variable notation.
[Line 11-12] - we take the subset of galaxy dataframes to select only mean and
stdev values and assign descriptive variable names to them.
[Line 15-17] - we create a subject dataframe having subject value (1:30) for 
all observations in galaxy dataframe.
[Line 19-23] - we create a ActivityLabels dataframe having Activity Labels 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
for all observations in galaxy dataframe.
Line 25 - we combine Subject, Activity Labels and galaxy dataframes into 
single dataframe galaxy.
Line 29 - we group galaxy dataframe by Subjects and Activities and compute the 
average values for all measurements for these groups. And assign this grouping 
with average values to AvgMeasures dataframe. This is our desired dataset.
Line 31 - Result of script - AvgMeasures dataframe is saved into 
tidydataproj.txt. 