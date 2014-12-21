# Load all necessary packages

library(data.table, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)

# 0. Load the training and test data sets

dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

downloadIfNeeded <- function(theurl) {
    s <- tail(strsplit(theurl,"%20")[[1]],1)
    if ( !file.exists(s) ) {
        download.file(theurl,s, mode="wb")
    }
    s
}

datasetsdir<-"./UCI HAR Dataset"

zipfile <- downloadIfNeeded(dataurl)
if ( ! file.exists(datasetsdir) ) {
    filelist <- unzip(zipfile, overwrite = FALSE )
}

# Read, analyse and select features
featurestbl<-read.table(file.path(datasetsdir,'features.txt'))
#identical(featurestbl[,1],seq(length(featurestbl[,1])))

# Read activities
activitiestbl<-read.table(file.path(datasetsdir,'activity_labels.txt'))
colnames(activitiestbl)<-c('actcode','activity')

# Train/Test datasets 
readAndComposeTable <- function(settype) {

    readset<-function(setname) 
        tbl_df(read.table(file.path(datasetsdir,settype,
                                    paste0(setname,'_',settype,'.txt')),sep=""))

    ytable<-as.data.frame(readset('y'))
    colnames(ytable)<-c("actcode")
    ytablef<-inner_join(ytable,activitiestbl, by = "actcode")$activity
    table(ytablef)
    
    xtable<-readset('x')

    subjecttbl<-readset('subject')
    colnames(subjecttbl)<-c("subject")    

    fulltbl<-cbind(xtable,subjecttbl, ytablef)
    colnames(fulltbl)<-c(as.character(featurestbl[,2]),"subject","activity")
    fulltbl
}

traintable<-readAndComposeTable('train')
testtable <-readAndComposeTable('test')

# 1. Merge the training and the test sets to create one data set.

wholetable <- tbl_df(rbind(traintable, testtable)) 

# 2. Extract only the measurements of the mean and standard deviation for each measurement

lc_featurestbl<-tolower(featurestbl[,2])

featSel <- lc_featurestbl == 'activity' | 
    (grepl('mean',lc_featurestbl) | grepl('std',lc_featurestbl)) & 
    (attr(regexpr('angle\\(',lc_featurestbl, perl = T),"match.length")< 0)

selFeatNames <- featurestbl[featSel,2]

tableSel<-wholetable[,-(which(!featSel))] # exclude columns with irrelevant features
# Clean-up the incomplete row, if necessary
tableSel<-tableSel[complete.cases(tableSel),]

# 3. Uses descriptive activity names to name the activities in the data set

# It could be done earlier, so we just repeat the trick
cleanActivityNames <- data.frame(Activity=as.factor(
    c("Walking","WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying")))
colnames(cleanActivityNames)<-c("Activity")

# This (activities renaming) operation will be completed at the next setp

# 4. Appropriately labels the data set with descriptive variable names. 

# Disclaimer: another approach (may be more elegant), 
#             would be to perform all the name transformations 
#             using tidyr, but it is not clear whether this would be more
#             intuitive.
# All the transformations are done below directly on the column names vector
 
# First handle tricky names like angle(word1,word2)
cleanSelFeatNames <- gsub("[()-]","",selFeatNames)

stdNames<-grepl('[sS]td',cleanSelFeatNames)
meanNames<-grepl('[mM]ean',cleanSelFeatNames)
freqMeanNames<-grepl('[mM]ean[fF]req',cleanSelFeatNames)
meanNames <-meanNames&(!freqMeanNames)


strippedNames <-  gsub('[fF]req',"",gsub('[mM]ean',"", gsub('[Ss]td','',gsub('meanFreq','',cleanSelFeatNames))))

tnames<-grepl('^t',strippedNames)
fnames<-grepl('^f',strippedNames)
strippedNames <-  gsub('^f','',gsub('^t','',strippedNames))

# Clean the names
strippedNames<-gsub('BodyBody','Body',strippedNames) # Duplicate: readability
strippedNames<-gsub('Mag','Magnitude',strippedNames)                # Redundant: t prefix
strippedNames<-gsub('Acc','Acceleration',strippedNames)    # Full names
strippedNames<-gsub('Gyro','Gyroscope',strippedNames)    # Full names


strippedNames[stdNames]<-sapply(strippedNames[stdNames], function (s) { paste0(s,'STD')} )
strippedNames[freqMeanNames]<-sapply(strippedNames[freqMeanNames], function (s) paste0(s,'FreqMean') )
strippedNames[meanNames]<-sapply(strippedNames[meanNames], function (s) paste0(s,'Mean') )
strippedNames[fnames]<-sapply(strippedNames[fnames], function (s) { paste0('FrequencyDomain',s)} )
strippedNames[tnames]<-sapply(strippedNames[tnames], function (s) { paste0('TimeDomain',s) } )

colnames(tableSel)<-c(strippedNames,c('Subject','activity'))

tableSel <- 
    inner_join(tableSel,cbind(activitiestbl,cleanActivityNames),by="activity") %>%
    select(-c(activity,actcode))


# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

tidyTable <- tableSel %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

# Save tidy data

write.table(tidyTable,file="tidyDataset.",row.name=FALSE)

checkData <- read.table("tidyDataset.txt", header = TRUE)
View(checkData)



