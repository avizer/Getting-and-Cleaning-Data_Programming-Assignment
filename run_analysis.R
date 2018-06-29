#Load/Install plyr package
if (!require("plyr")) {
    install.packages("plyr")
}
library(plyr)

#OBJECTIVE 1: Merge training and test sets to create one data set

Activities<-read.table("activity_labels.txt")
#read 3 test files & combine as one
Xtest<-read.table("X_test.txt")
features<-read.table("features.txt")
colnames(Xtest)<-features$V2
Ytest<-read.table("y_test.txt")
#properly name column in y_test as "Activity"
colnames(Ytest)<-c("Activity")
Subtest<-read.table("subject_test.txt")
#properly name column in y=subject_test as "Volunteer"
colnames(Subtest)<-c("Volunteer")
Test1<-cbind(Ytest,Xtest)
Test2<-cbind(Subtest,Test1)

#read 3 train files & combine as one
Xtrain<-read.table("X_train.txt")
colnames(Xtrain)<-features$V2
Ytrain<-read.table("y_train.txt")
#properly name column in y_test as "Activity"
colnames(Ytrain)<-c("Activity")
Subtrain<-read.table("subject_train.txt")
#properly name column in y=subject_train as "Volunteer"
colnames(Subtrain)<-c("Volunteer")
Train1<-cbind(Ytrain,Xtrain)
Train2<-cbind(Subtrain,Train1)

#Merge Test & Train files into 1
Data<-rbind(Test2,Train2)

#OBJECTIVE 2 - Extracts only the measurements on the mean and standard deviation for each measurement

Selcol<-grepl("Volunteer|Activity|[Mm]ean|[Ss]td",colnames(Data))
Tidy_Data<-Data[,Selcol]

#OBJECTIVE 3 - Use descriptive activity Names to name activities in data set

Tidy_Data$Activity<-factor(Tidy_Data$Activity,levels=Activities[,1],labels=Activities[,2])

#OBJECTIVE 4 - Appropriately label data set with descriptive variable names

names(Tidy_Data)<-gsub("BodyBody","Body",names(Tidy_Data))
names(Tidy_Data)<-gsub("[Mm]ean","Mean",names(Tidy_Data))
names(Tidy_Data)<-gsub("[Ss]td","Std",names(Tidy_Data))
names(Tidy_Data)<-gsub("^f","FrequencyDomain ",names(Tidy_Data))
names(Tidy_Data)<-gsub("^t","TimeDomain ",names(Tidy_Data))

#OBJECTIVE 5 -Create A second data set with the average of each variable for each activity and subject

Avg_Tidy_Data<-aggregate(Tidy_Data[,names(Tidy_Data)
                                   !=c("Volunteer","Activity")],
                         by=list(Volunteer=Tidy_Data$Volunteer,
                                 Activity=Tidy_Data$Activity),mean)

#output second data set to text file
write.table(Avg_Tidy_Data,"Avg_Tidy_Data.txt",row.names = FALSE,quote=FALSE)
