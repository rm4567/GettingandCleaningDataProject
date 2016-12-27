# Set Workspace
C:\\Users\\ACC\\Desktop\\Getting and Cleaning Data\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset

#Step 1: Combine both training and testing Data

#read text files features (labelled f) and activity_label (labelled al)

f   <- read.table("./features.txt",header=FALSE)
al   <- read.table("./activity_labels.txt",header=FALSE)

# read training Data x_train (labelled xtr), y_train (labelled ytr) and subject_train (labelled STtr)
xtr   <- read.table("./train/X_train.txt", header=FALSE)
ytr    <- read.table("./train/y_train.txt", header=FALSE)
STtr  <- read.table("./train/subject_train.txt", header=FALSE)

# read testing Data x_test (labelled xtst), y_test (labelled ytst) and subject_test (labelled STtst)
xtst      <- read.table("./test/X_test.txt", header=FALSE)
ytst      <- read.table("./test/y_test.txt", header=FALSE)
STtst    <-read.table("./test/subject_test.txt", header=FALSE)

# Give column names to training Data 
colnames(xtr) <- f[,2]
colnames(ytr) <- "IDofActivity"
colnames(al)<-c("IDofActivity","TypeofActivity")
colnames(STtr) <- "IDofSubject"

# Give column names to testing Data 
colnames(xtst) <- f[,2]
colnames(ytst) <- "IDofActivity"
colnames(STtst) <- "IDofSubject"
         
library(plyr)         
# Combine training and testing Data
trainingData <- cbind(STtr,ytr,xtr)
testingData  <- cbind(STtst,ytst,xtst)

#Merge training and testing Data into one variable

CD <- rbind(trainingData,testingData)

#Step 2: Extracting only mean and standard deviation for each measurement

m_sd <-CD[,grepl("IDofActivity|std|mean|",colnames(CD))]

#Step 3: Use descriptive activity names to name the activities

v <- for (i in 1:nrow(m_sd)){
      if (m_sd$IDofActivity[i] == 1) {
      m_sd$TypeofActivity[i] <- as.character(al[1,2])
      }
      else if (m_sd$IDofActivity[i] == 2) {
        m_sd$TypeofActivity[i] <- as.character(al[2,2])
      }
      else if (m_sd$IDofActivity[i] == 3) {
        m_sd$TypeofActivity[i] <- as.character(al[3,2])
      }
      else if (m_sd$IDofActivity[i] == 4) {
        m_sd$TypeofActivity[i] <- as.character(al[4,2])
      }
      else if (m_sd$IDofActivity[i] == 5) {
        m_sd$TypeofActivity[i] <- as.character(al[5,2])
      }
      else if (m_sd$IDofActivity[i] == 6) {
        m_sd$TypeofActivity[i] <- as.character(al[6,2])
      }
}
      
#Step 4: Label the data set with descriptive variable names.

names(m_sd)<-gsub("Freq", "FREQUENCY", names(m_sd))
names(m_sd)<-gsub("^f", "Frequency", names(m_sd))
names(m_sd)<-gsub("Mag", "Magnitude", names(m_sd))
names(m_sd)<-gsub("^t", "Time", names(m_sd))
names(m_sd)<-gsub("Gyro", "Gyroscope", names(m_sd))
names(m_sd)<-gsub("mean()", "MEAN", names(m_sd))
names(m_sd)<-gsub("Acc", "Accelerometer", names(m_sd))
names(m_sd)<-gsub("std()", "STD", names(m_sd))


#Step 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject.

td<- ddply(m_sd, c("IDofSubject","IDofActivity"), numcolwise(mean))
write.table(td,file="TIDYDATASET.txt",row.names=FALSE)