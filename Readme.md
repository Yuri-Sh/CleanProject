# Data processing explanation
Yuri-Sh  
Friday, December 19, 2014  

The processing is performed by the script run_analysis.R explained below.

## Construction of a single dataset

    Note: the placeholder <settype> below represents both "test" and  "train" 
          (the partial datasets to be combined and cleaned).
    
    - Load the feature list (features.txt). These are the names of the variables (columns).
    - Load activity_labels.txt. This is the conversion dictionary for 6 activity codes.
     
    - For each partial dataset (test, train) contruct the table
    
        1. Load the activity table (activity code per observation) 
           from <settype>/y_<settype>.txt and convert the activities
           codes to the activities names (strings) using common features conversion dictionary,
           This is the activity column for the resepective partial dataset.
           
        2. Load the subject data (subject id per observation) from <settype>/subject_<settype>.txt.
           This is the subject column for the resepective partial dataset.
           
        3. Load the observations from respective file <settype>/X_<settype>.txt
           This file comprises all the measured variables (features) for each observation.
           
        4. Combine the columns of activities and subject with the measurements table.
        
        
    - Merge each of the resulting tables into the unified data table.
    
## Cleaning the dataset

    - Select only the columns which contain in their name mean (or meanFreq) or std
      (ignoring the letter case).
      Exclude from this list the columns which are functions of other columns
      Note: these 7 columns have naming format *angle(<var1>,<var2>)*.
      There are 79 remaining features.
      
    - Select only complete observations (rows) for the selected features.       
    
    - Convert the column (feature) names to a single tidy format according to 
      the following convention:
      <Domain><Type><Measurement/Calculation><Axis/Magnitude><Processing type>

      Domain                    : TimeDomain or FrequencyDomain
      Type                      : Body or Gravity
      Measurement/Calculated    : Acceleration (measured) or AccelerationJerk (calculated) 
                                  or Gyroscope (measured) GyroscopeJerk (calculated) 
      Axis/Magnitude            :  X or Y or Z or Magnitude
      Processing type           : Mean or STD or FreqMean
             
      
      Additional two columns are marked **Activity** and **Subject** as described above.
      
      
      In addition, the activities naming was changed to
      
       - Walking
       - WalkingUpstairs
       - WalkingDownstairs
       - Sitting
       - Standing
       - Laying
       
      
      
## Creation of the final dataset

      All variables are summarized (averaged)  per subject (30 subjects) and per activity (6 activities).
      The resulting tidy dataset is saved to a file.
      

## Appendix 1: Summary of variable conversions 
  



<!-- html table generated in R 3.1.2 by xtable 1.7-4 package -->
<!-- Sun Dec 21 21:22:56 2014 -->
<table border=1>
<tr> <th>  </th> <th> Original variable name (raw) </th> <th> Tidy variable name </th>  </tr>
  <tr> <td> 1 </td> <td align="center"> tBodyAcc-mean()-X </td> <td align="center"> TimeDomainBodyAccelerationXMean </td> </tr>
  <tr> <td> 2 </td> <td align="center"> tBodyAcc-mean()-Y </td> <td align="center"> TimeDomainBodyAccelerationYMean </td> </tr>
  <tr> <td> 3 </td> <td align="center"> tBodyAcc-mean()-Z </td> <td align="center"> TimeDomainBodyAccelerationZMean </td> </tr>
  <tr> <td> 4 </td> <td align="center"> tBodyAcc-std()-X </td> <td align="center"> TimeDomainBodyAccelerationXSTD </td> </tr>
  <tr> <td> 5 </td> <td align="center"> tBodyAcc-std()-Y </td> <td align="center"> TimeDomainBodyAccelerationYSTD </td> </tr>
  <tr> <td> 6 </td> <td align="center"> tBodyAcc-std()-Z </td> <td align="center"> TimeDomainBodyAccelerationZSTD </td> </tr>
  <tr> <td> 7 </td> <td align="center"> tGravityAcc-mean()-X </td> <td align="center"> TimeDomainGravityAccelerationXMean </td> </tr>
  <tr> <td> 8 </td> <td align="center"> tGravityAcc-mean()-Y </td> <td align="center"> TimeDomainGravityAccelerationYMean </td> </tr>
  <tr> <td> 9 </td> <td align="center"> tGravityAcc-mean()-Z </td> <td align="center"> TimeDomainGravityAccelerationZMean </td> </tr>
  <tr> <td> 10 </td> <td align="center"> tGravityAcc-std()-X </td> <td align="center"> TimeDomainGravityAccelerationXSTD </td> </tr>
  <tr> <td> 11 </td> <td align="center"> tGravityAcc-std()-Y </td> <td align="center"> TimeDomainGravityAccelerationYSTD </td> </tr>
  <tr> <td> 12 </td> <td align="center"> tGravityAcc-std()-Z </td> <td align="center"> TimeDomainGravityAccelerationZSTD </td> </tr>
  <tr> <td> 13 </td> <td align="center"> tBodyAccJerk-mean()-X </td> <td align="center"> TimeDomainBodyAccelerationJerkXMean </td> </tr>
  <tr> <td> 14 </td> <td align="center"> tBodyAccJerk-mean()-Y </td> <td align="center"> TimeDomainBodyAccelerationJerkYMean </td> </tr>
  <tr> <td> 15 </td> <td align="center"> tBodyAccJerk-mean()-Z </td> <td align="center"> TimeDomainBodyAccelerationJerkZMean </td> </tr>
  <tr> <td> 16 </td> <td align="center"> tBodyAccJerk-std()-X </td> <td align="center"> TimeDomainBodyAccelerationJerkXSTD </td> </tr>
  <tr> <td> 17 </td> <td align="center"> tBodyAccJerk-std()-Y </td> <td align="center"> TimeDomainBodyAccelerationJerkYSTD </td> </tr>
  <tr> <td> 18 </td> <td align="center"> tBodyAccJerk-std()-Z </td> <td align="center"> TimeDomainBodyAccelerationJerkZSTD </td> </tr>
  <tr> <td> 19 </td> <td align="center"> tBodyGyro-mean()-X </td> <td align="center"> TimeDomainBodyGyroscopeXMean </td> </tr>
  <tr> <td> 20 </td> <td align="center"> tBodyGyro-mean()-Y </td> <td align="center"> TimeDomainBodyGyroscopeYMean </td> </tr>
  <tr> <td> 21 </td> <td align="center"> tBodyGyro-mean()-Z </td> <td align="center"> TimeDomainBodyGyroscopeZMean </td> </tr>
  <tr> <td> 22 </td> <td align="center"> tBodyGyro-std()-X </td> <td align="center"> TimeDomainBodyGyroscopeXSTD </td> </tr>
  <tr> <td> 23 </td> <td align="center"> tBodyGyro-std()-Y </td> <td align="center"> TimeDomainBodyGyroscopeYSTD </td> </tr>
  <tr> <td> 24 </td> <td align="center"> tBodyGyro-std()-Z </td> <td align="center"> TimeDomainBodyGyroscopeZSTD </td> </tr>
  <tr> <td> 25 </td> <td align="center"> tBodyGyroJerk-mean()-X </td> <td align="center"> TimeDomainBodyGyroscopeJerkXMean </td> </tr>
  <tr> <td> 26 </td> <td align="center"> tBodyGyroJerk-mean()-Y </td> <td align="center"> TimeDomainBodyGyroscopeJerkYMean </td> </tr>
  <tr> <td> 27 </td> <td align="center"> tBodyGyroJerk-mean()-Z </td> <td align="center"> TimeDomainBodyGyroscopeJerkZMean </td> </tr>
  <tr> <td> 28 </td> <td align="center"> tBodyGyroJerk-std()-X </td> <td align="center"> TimeDomainBodyGyroscopeJerkXSTD </td> </tr>
  <tr> <td> 29 </td> <td align="center"> tBodyGyroJerk-std()-Y </td> <td align="center"> TimeDomainBodyGyroscopeJerkYSTD </td> </tr>
  <tr> <td> 30 </td> <td align="center"> tBodyGyroJerk-std()-Z </td> <td align="center"> TimeDomainBodyGyroscopeJerkZSTD </td> </tr>
  <tr> <td> 31 </td> <td align="center"> tBodyAccMag-mean() </td> <td align="center"> TimeDomainBodyAccelerationMagnitudeMean </td> </tr>
  <tr> <td> 32 </td> <td align="center"> tBodyAccMag-std() </td> <td align="center"> TimeDomainBodyAccelerationMagnitudeSTD </td> </tr>
  <tr> <td> 33 </td> <td align="center"> tGravityAccMag-mean() </td> <td align="center"> TimeDomainGravityAccelerationMagnitudeMean </td> </tr>
  <tr> <td> 34 </td> <td align="center"> tGravityAccMag-std() </td> <td align="center"> TimeDomainGravityAccelerationMagnitudeSTD </td> </tr>
  <tr> <td> 35 </td> <td align="center"> tBodyAccJerkMag-mean() </td> <td align="center"> TimeDomainBodyAccelerationJerkMagnitudeMean </td> </tr>
  <tr> <td> 36 </td> <td align="center"> tBodyAccJerkMag-std() </td> <td align="center"> TimeDomainBodyAccelerationJerkMagnitudeSTD </td> </tr>
  <tr> <td> 37 </td> <td align="center"> tBodyGyroMag-mean() </td> <td align="center"> TimeDomainBodyGyroscopeMagnitudeMean </td> </tr>
  <tr> <td> 38 </td> <td align="center"> tBodyGyroMag-std() </td> <td align="center"> TimeDomainBodyGyroscopeMagnitudeSTD </td> </tr>
  <tr> <td> 39 </td> <td align="center"> tBodyGyroJerkMag-mean() </td> <td align="center"> TimeDomainBodyGyroscopeJerkMagnitudeMean </td> </tr>
  <tr> <td> 40 </td> <td align="center"> tBodyGyroJerkMag-std() </td> <td align="center"> TimeDomainBodyGyroscopeJerkMagnitudeSTD </td> </tr>
  <tr> <td> 41 </td> <td align="center"> fBodyAcc-mean()-X </td> <td align="center"> FrequencyDomainBodyAccelerationXMean </td> </tr>
  <tr> <td> 42 </td> <td align="center"> fBodyAcc-mean()-Y </td> <td align="center"> FrequencyDomainBodyAccelerationYMean </td> </tr>
  <tr> <td> 43 </td> <td align="center"> fBodyAcc-mean()-Z </td> <td align="center"> FrequencyDomainBodyAccelerationZMean </td> </tr>
  <tr> <td> 44 </td> <td align="center"> fBodyAcc-std()-X </td> <td align="center"> FrequencyDomainBodyAccelerationXSTD </td> </tr>
  <tr> <td> 45 </td> <td align="center"> fBodyAcc-std()-Y </td> <td align="center"> FrequencyDomainBodyAccelerationYSTD </td> </tr>
  <tr> <td> 46 </td> <td align="center"> fBodyAcc-std()-Z </td> <td align="center"> FrequencyDomainBodyAccelerationZSTD </td> </tr>
  <tr> <td> 47 </td> <td align="center"> fBodyAcc-meanFreq()-X </td> <td align="center"> FrequencyDomainBodyAccelerationXFreqMean </td> </tr>
  <tr> <td> 48 </td> <td align="center"> fBodyAcc-meanFreq()-Y </td> <td align="center"> FrequencyDomainBodyAccelerationYFreqMean </td> </tr>
  <tr> <td> 49 </td> <td align="center"> fBodyAcc-meanFreq()-Z </td> <td align="center"> FrequencyDomainBodyAccelerationZFreqMean </td> </tr>
  <tr> <td> 50 </td> <td align="center"> fBodyAccJerk-mean()-X </td> <td align="center"> FrequencyDomainBodyAccelerationJerkXMean </td> </tr>
  <tr> <td> 51 </td> <td align="center"> fBodyAccJerk-mean()-Y </td> <td align="center"> FrequencyDomainBodyAccelerationJerkYMean </td> </tr>
  <tr> <td> 52 </td> <td align="center"> fBodyAccJerk-mean()-Z </td> <td align="center"> FrequencyDomainBodyAccelerationJerkZMean </td> </tr>
  <tr> <td> 53 </td> <td align="center"> fBodyAccJerk-std()-X </td> <td align="center"> FrequencyDomainBodyAccelerationJerkXSTD </td> </tr>
  <tr> <td> 54 </td> <td align="center"> fBodyAccJerk-std()-Y </td> <td align="center"> FrequencyDomainBodyAccelerationJerkYSTD </td> </tr>
  <tr> <td> 55 </td> <td align="center"> fBodyAccJerk-std()-Z </td> <td align="center"> FrequencyDomainBodyAccelerationJerkZSTD </td> </tr>
  <tr> <td> 56 </td> <td align="center"> fBodyAccJerk-meanFreq()-X </td> <td align="center"> FrequencyDomainBodyAccelerationJerkXFreqMean </td> </tr>
  <tr> <td> 57 </td> <td align="center"> fBodyAccJerk-meanFreq()-Y </td> <td align="center"> FrequencyDomainBodyAccelerationJerkYFreqMean </td> </tr>
  <tr> <td> 58 </td> <td align="center"> fBodyAccJerk-meanFreq()-Z </td> <td align="center"> FrequencyDomainBodyAccelerationJerkZFreqMean </td> </tr>
  <tr> <td> 59 </td> <td align="center"> fBodyGyro-mean()-X </td> <td align="center"> FrequencyDomainBodyGyroscopeXMean </td> </tr>
  <tr> <td> 60 </td> <td align="center"> fBodyGyro-mean()-Y </td> <td align="center"> FrequencyDomainBodyGyroscopeYMean </td> </tr>
  <tr> <td> 61 </td> <td align="center"> fBodyGyro-mean()-Z </td> <td align="center"> FrequencyDomainBodyGyroscopeZMean </td> </tr>
  <tr> <td> 62 </td> <td align="center"> fBodyGyro-std()-X </td> <td align="center"> FrequencyDomainBodyGyroscopeXSTD </td> </tr>
  <tr> <td> 63 </td> <td align="center"> fBodyGyro-std()-Y </td> <td align="center"> FrequencyDomainBodyGyroscopeYSTD </td> </tr>
  <tr> <td> 64 </td> <td align="center"> fBodyGyro-std()-Z </td> <td align="center"> FrequencyDomainBodyGyroscopeZSTD </td> </tr>
  <tr> <td> 65 </td> <td align="center"> fBodyGyro-meanFreq()-X </td> <td align="center"> FrequencyDomainBodyGyroscopeXFreqMean </td> </tr>
  <tr> <td> 66 </td> <td align="center"> fBodyGyro-meanFreq()-Y </td> <td align="center"> FrequencyDomainBodyGyroscopeYFreqMean </td> </tr>
  <tr> <td> 67 </td> <td align="center"> fBodyGyro-meanFreq()-Z </td> <td align="center"> FrequencyDomainBodyGyroscopeZFreqMean </td> </tr>
  <tr> <td> 68 </td> <td align="center"> fBodyAccMag-mean() </td> <td align="center"> FrequencyDomainBodyAccelerationMagnitudeMean </td> </tr>
  <tr> <td> 69 </td> <td align="center"> fBodyAccMag-std() </td> <td align="center"> FrequencyDomainBodyAccelerationMagnitudeSTD </td> </tr>
  <tr> <td> 70 </td> <td align="center"> fBodyAccMag-meanFreq() </td> <td align="center"> FrequencyDomainBodyAccelerationMagnitudeFreqMean </td> </tr>
  <tr> <td> 71 </td> <td align="center"> fBodyBodyAccJerkMag-mean() </td> <td align="center"> FrequencyDomainBodyAccelerationJerkMagnitudeMean </td> </tr>
  <tr> <td> 72 </td> <td align="center"> fBodyBodyAccJerkMag-std() </td> <td align="center"> FrequencyDomainBodyAccelerationJerkMagnitudeSTD </td> </tr>
  <tr> <td> 73 </td> <td align="center"> fBodyBodyAccJerkMag-meanFreq() </td> <td align="center"> FrequencyDomainBodyAccelerationJerkMagnitudeFreqMean </td> </tr>
  <tr> <td> 74 </td> <td align="center"> fBodyBodyGyroMag-mean() </td> <td align="center"> FrequencyDomainBodyGyroscopeMagnitudeMean </td> </tr>
  <tr> <td> 75 </td> <td align="center"> fBodyBodyGyroMag-std() </td> <td align="center"> FrequencyDomainBodyGyroscopeMagnitudeSTD </td> </tr>
  <tr> <td> 76 </td> <td align="center"> fBodyBodyGyroMag-meanFreq() </td> <td align="center"> FrequencyDomainBodyGyroscopeMagnitudeFreqMean </td> </tr>
  <tr> <td> 77 </td> <td align="center"> fBodyBodyGyroJerkMag-mean() </td> <td align="center"> FrequencyDomainBodyGyroscopeJerkMagnitudeMean </td> </tr>
  <tr> <td> 78 </td> <td align="center"> fBodyBodyGyroJerkMag-std() </td> <td align="center"> FrequencyDomainBodyGyroscopeJerkMagnitudeSTD </td> </tr>
  <tr> <td> 79 </td> <td align="center"> fBodyBodyGyroJerkMag-meanFreq() </td> <td align="center"> FrequencyDomainBodyGyroscopeJerkMagnitudeFreqMean </td> </tr>
   </table>
 
      
      

    
     
      
      
      
      
      
       
        
