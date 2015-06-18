train=read.table("train\\X_train.txt",header=FALSE)
test=read.table("test\\X_test.txt",header=FALSE)
galaxy=rbind(train,test)

features=read.table("features.txt",header=FALSE,stringsAsFactors=FALSE)
selvar=grep("mean[(]|std",features$V2)
varnames=grep("mean[(]|std",features$V2,value=TRUE)
varnames=gsub("[()]","",varnames)
varnames=gsub("-",".",varnames)

galaxy=galaxy[,c(selvar)]
colnames(galaxy)=c(varnames)

## adding subject and activity label
trainsub=read.table("train/subject_train.txt")
testsub=read.table("test/subject_test.txt")
subject=rbind(trainsub,testsub)

trainlabels=read.table("train/y_train.txt")
testlabels=read.table("test/y_test.txt")
ActivityLabels=rbind(trainlabels,testlabels)

actNames=read.table("activity_labels.txt")
ActivityLabels$V1=actNames$V2[ActivityLabels$V1]
galaxy=cbind(subject$V1,ActivityLabels$V1,galaxy[,1:66])
colnames(galaxy)[1:2]=c("Subject","ActivityLabels")

## grouping by subject and activity and taking mean of all measurements
AvgMeasures=aggregate(galaxy[,3:68],by=list(galaxy$Subject,galaxy$ActivityLabels),FUN=mean)
colnames(AvgMeasures)[1:2]=c("Subject","Activity")
write.table(AvgMeasures,"tidydataproj.txt",row.name=FALSE)
