# Codebook
Yuri-Sh  
Friday, December 19, 2014  

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
measured during 6 different activities of 30 different subjects.

These time domain signals (prefix 'TimeDomain' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

In addition a Fast Fourier Transform (FFT) was applied to some of these signals. 
Note the 'FrequencyDomain' to indicate frequency domain signals. 

The set of variables that were estimated from these signals are: 

 - Mean value (Mean)
 - Standard deviation (STD)
 - Weighted average of the frequency components to obtain a mean frequency (MeanFreq)

The data was in addition post-processed:
for all observations for a given subject and given activity each variable was averaged.

This resulting dataset contains 79 measurements (variables) for each of 6 activities performed by 30 subjects (180 rows).


The notation for the variables is defined by the the following convention:
      <Domain><Type><Measurement/Calculation><Axis/Magnitude><Processing type>

      Domain                    : TimeDomain or FrequencyDomain
      Type                      : Body or Gravity
      Measurement/Calculated    : Acceleration (measured) or AccelerationJerk (calculated) 
                                        or Gyroscope (measured) GyroscopeJerk (calculated) 
      Axis/Magnitude            :  X or Y or Z or Magnitude
      Processing type           : Mean or STD or FreqMean
    
    
The following activities were considered in this data collection:
       - Walking
       - WalkingUpstairs
       - WalkingDownstairs
       - Sitting
       - Standing
       - Laying





<!-- html table generated in R 3.1.2 by xtable 1.7-4 package -->
<!-- Sun Dec 21 21:21:00 2014 -->
<table border=1>
<tr> <th>  </th> <th> Variable name </th>  </tr>
  <tr> <td> 1 </td> <td align="center"> TimeDomainBodyAccelerationXMean </td> </tr>
  <tr> <td> 2 </td> <td align="center"> TimeDomainBodyAccelerationYMean </td> </tr>
  <tr> <td> 3 </td> <td align="center"> TimeDomainBodyAccelerationZMean </td> </tr>
  <tr> <td> 4 </td> <td align="center"> TimeDomainBodyAccelerationXSTD </td> </tr>
  <tr> <td> 5 </td> <td align="center"> TimeDomainBodyAccelerationYSTD </td> </tr>
  <tr> <td> 6 </td> <td align="center"> TimeDomainBodyAccelerationZSTD </td> </tr>
  <tr> <td> 7 </td> <td align="center"> TimeDomainGravityAccelerationXMean </td> </tr>
  <tr> <td> 8 </td> <td align="center"> TimeDomainGravityAccelerationYMean </td> </tr>
  <tr> <td> 9 </td> <td align="center"> TimeDomainGravityAccelerationZMean </td> </tr>
  <tr> <td> 10 </td> <td align="center"> TimeDomainGravityAccelerationXSTD </td> </tr>
  <tr> <td> 11 </td> <td align="center"> TimeDomainGravityAccelerationYSTD </td> </tr>
  <tr> <td> 12 </td> <td align="center"> TimeDomainGravityAccelerationZSTD </td> </tr>
  <tr> <td> 13 </td> <td align="center"> TimeDomainBodyAccelerationJerkXMean </td> </tr>
  <tr> <td> 14 </td> <td align="center"> TimeDomainBodyAccelerationJerkYMean </td> </tr>
  <tr> <td> 15 </td> <td align="center"> TimeDomainBodyAccelerationJerkZMean </td> </tr>
  <tr> <td> 16 </td> <td align="center"> TimeDomainBodyAccelerationJerkXSTD </td> </tr>
  <tr> <td> 17 </td> <td align="center"> TimeDomainBodyAccelerationJerkYSTD </td> </tr>
  <tr> <td> 18 </td> <td align="center"> TimeDomainBodyAccelerationJerkZSTD </td> </tr>
  <tr> <td> 19 </td> <td align="center"> TimeDomainBodyGyroscopeXMean </td> </tr>
  <tr> <td> 20 </td> <td align="center"> TimeDomainBodyGyroscopeYMean </td> </tr>
  <tr> <td> 21 </td> <td align="center"> TimeDomainBodyGyroscopeZMean </td> </tr>
  <tr> <td> 22 </td> <td align="center"> TimeDomainBodyGyroscopeXSTD </td> </tr>
  <tr> <td> 23 </td> <td align="center"> TimeDomainBodyGyroscopeYSTD </td> </tr>
  <tr> <td> 24 </td> <td align="center"> TimeDomainBodyGyroscopeZSTD </td> </tr>
  <tr> <td> 25 </td> <td align="center"> TimeDomainBodyGyroscopeJerkXMean </td> </tr>
  <tr> <td> 26 </td> <td align="center"> TimeDomainBodyGyroscopeJerkYMean </td> </tr>
  <tr> <td> 27 </td> <td align="center"> TimeDomainBodyGyroscopeJerkZMean </td> </tr>
  <tr> <td> 28 </td> <td align="center"> TimeDomainBodyGyroscopeJerkXSTD </td> </tr>
  <tr> <td> 29 </td> <td align="center"> TimeDomainBodyGyroscopeJerkYSTD </td> </tr>
  <tr> <td> 30 </td> <td align="center"> TimeDomainBodyGyroscopeJerkZSTD </td> </tr>
  <tr> <td> 31 </td> <td align="center"> TimeDomainBodyAccelerationMagnitudeMean </td> </tr>
  <tr> <td> 32 </td> <td align="center"> TimeDomainBodyAccelerationMagnitudeSTD </td> </tr>
  <tr> <td> 33 </td> <td align="center"> TimeDomainGravityAccelerationMagnitudeMean </td> </tr>
  <tr> <td> 34 </td> <td align="center"> TimeDomainGravityAccelerationMagnitudeSTD </td> </tr>
  <tr> <td> 35 </td> <td align="center"> TimeDomainBodyAccelerationJerkMagnitudeMean </td> </tr>
  <tr> <td> 36 </td> <td align="center"> TimeDomainBodyAccelerationJerkMagnitudeSTD </td> </tr>
  <tr> <td> 37 </td> <td align="center"> TimeDomainBodyGyroscopeMagnitudeMean </td> </tr>
  <tr> <td> 38 </td> <td align="center"> TimeDomainBodyGyroscopeMagnitudeSTD </td> </tr>
  <tr> <td> 39 </td> <td align="center"> TimeDomainBodyGyroscopeJerkMagnitudeMean </td> </tr>
  <tr> <td> 40 </td> <td align="center"> TimeDomainBodyGyroscopeJerkMagnitudeSTD </td> </tr>
  <tr> <td> 41 </td> <td align="center"> FrequencyDomainBodyAccelerationXMean </td> </tr>
  <tr> <td> 42 </td> <td align="center"> FrequencyDomainBodyAccelerationYMean </td> </tr>
  <tr> <td> 43 </td> <td align="center"> FrequencyDomainBodyAccelerationZMean </td> </tr>
  <tr> <td> 44 </td> <td align="center"> FrequencyDomainBodyAccelerationXSTD </td> </tr>
  <tr> <td> 45 </td> <td align="center"> FrequencyDomainBodyAccelerationYSTD </td> </tr>
  <tr> <td> 46 </td> <td align="center"> FrequencyDomainBodyAccelerationZSTD </td> </tr>
  <tr> <td> 47 </td> <td align="center"> FrequencyDomainBodyAccelerationXFreqMean </td> </tr>
  <tr> <td> 48 </td> <td align="center"> FrequencyDomainBodyAccelerationYFreqMean </td> </tr>
  <tr> <td> 49 </td> <td align="center"> FrequencyDomainBodyAccelerationZFreqMean </td> </tr>
  <tr> <td> 50 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkXMean </td> </tr>
  <tr> <td> 51 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkYMean </td> </tr>
  <tr> <td> 52 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkZMean </td> </tr>
  <tr> <td> 53 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkXSTD </td> </tr>
  <tr> <td> 54 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkYSTD </td> </tr>
  <tr> <td> 55 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkZSTD </td> </tr>
  <tr> <td> 56 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkXFreqMean </td> </tr>
  <tr> <td> 57 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkYFreqMean </td> </tr>
  <tr> <td> 58 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkZFreqMean </td> </tr>
  <tr> <td> 59 </td> <td align="center"> FrequencyDomainBodyGyroscopeXMean </td> </tr>
  <tr> <td> 60 </td> <td align="center"> FrequencyDomainBodyGyroscopeYMean </td> </tr>
  <tr> <td> 61 </td> <td align="center"> FrequencyDomainBodyGyroscopeZMean </td> </tr>
  <tr> <td> 62 </td> <td align="center"> FrequencyDomainBodyGyroscopeXSTD </td> </tr>
  <tr> <td> 63 </td> <td align="center"> FrequencyDomainBodyGyroscopeYSTD </td> </tr>
  <tr> <td> 64 </td> <td align="center"> FrequencyDomainBodyGyroscopeZSTD </td> </tr>
  <tr> <td> 65 </td> <td align="center"> FrequencyDomainBodyGyroscopeXFreqMean </td> </tr>
  <tr> <td> 66 </td> <td align="center"> FrequencyDomainBodyGyroscopeYFreqMean </td> </tr>
  <tr> <td> 67 </td> <td align="center"> FrequencyDomainBodyGyroscopeZFreqMean </td> </tr>
  <tr> <td> 68 </td> <td align="center"> FrequencyDomainBodyAccelerationMagnitudeMean </td> </tr>
  <tr> <td> 69 </td> <td align="center"> FrequencyDomainBodyAccelerationMagnitudeSTD </td> </tr>
  <tr> <td> 70 </td> <td align="center"> FrequencyDomainBodyAccelerationMagnitudeFreqMean </td> </tr>
  <tr> <td> 71 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkMagnitudeMean </td> </tr>
  <tr> <td> 72 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkMagnitudeSTD </td> </tr>
  <tr> <td> 73 </td> <td align="center"> FrequencyDomainBodyAccelerationJerkMagnitudeFreqMean </td> </tr>
  <tr> <td> 74 </td> <td align="center"> FrequencyDomainBodyGyroscopeMagnitudeMean </td> </tr>
  <tr> <td> 75 </td> <td align="center"> FrequencyDomainBodyGyroscopeMagnitudeSTD </td> </tr>
  <tr> <td> 76 </td> <td align="center"> FrequencyDomainBodyGyroscopeMagnitudeFreqMean </td> </tr>
  <tr> <td> 77 </td> <td align="center"> FrequencyDomainBodyGyroscopeJerkMagnitudeMean </td> </tr>
  <tr> <td> 78 </td> <td align="center"> FrequencyDomainBodyGyroscopeJerkMagnitudeSTD </td> </tr>
  <tr> <td> 79 </td> <td align="center"> FrequencyDomainBodyGyroscopeJerkMagnitudeFreqMean </td> </tr>
   </table>



