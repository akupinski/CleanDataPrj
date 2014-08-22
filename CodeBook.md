
Contents of summaryData.txt
===========================

The run_analysis.R script produces a summary of some of the measures from 
the Samsung data (UCI HAR data - Univ. of CA, Irvine Human Activity Recognition
data).  The summary data is written to a whitespace delimited text file called in your working directory for R.  Below is a description of the fields in summaryData.txt.

See also:  
- features_info.txt (in the UCI HAR Dataset directory)
- [README.md][readme] for more information about run_analysis.R

[readme]: README.md

###Data Processing

The summary data was produced by merging the testing and training datasets, 
saving only the measurements that represented the mean and standard deviation of
the accelerometer and gyroscope signals.  This merged dataset is produced by
the run_analysis.R program as a data.frame named `fullData`.

The merged testing+training data is further summarized by averaging each variable for each (activity x subject) pair.

###summaryData.text File Layout

1. **subject** (*int*)     Unique identifier of a subject
2. **activity** (*factor*) Activity performed (WALKING, WALKING_UPSTAIRS, etc.)

The following *numeric* variables are averages of the measurements for this (subject, activity).

3. **avg_tBodyAccMeanX** 
4. **avg_tBodyAccMeanY**
5. **avg_tBodyAccMeanZ**
6. **avg_tBodyAccStdX**
7. **avg_tBodyAccStdY**
8. **avg_tBodyAccStdZ**
9. **avg_tGravityAccMeanX**
10. **avg_tGravityAccMeanY**
11. **avg_tGravityAccMeanZ**
12. **avg_tGravityAccStdX**
13. **avg_tGravityAccStdY**
14. **avg_tGravityAccStdZ**
15. **avg_tBodyAccJerkMeanX**
16. **avg_tBodyAccJerkMeanY**
17. **avg_tBodyAccJerkMeanZ**
18. **avg_tBodyAccJerkStdX**
19. **avg_tBodyAccJerkStdY**
20. **avg_tBodyAccJerkStdZ**
21. **avg_tBodyGyroMeanX**
22. **avg_tBodyGyroMeanY**
23. **avg_tBodyGyroMeanZ**
24. **avg_tBodyGyroStdX**
25. **avg_tBodyGyroStdY**
26. **avg_tBodyGyroStdZ**
27. **avg_tBodyGyroJerkMeanX**
28. **avg_tBodyGyroJerkMeanY**
29. **avg_tBodyGyroJerkMeanZ**
30. **avg_tBodyGyroJerkStdX**
31. **avg_tBodyGyroJerkStdY**
32. **avg_tBodyGyroJerkStdZ**
33. **avg_tBodyAccMagMean**
34. **avg_tBodyAccMagStd**
35. **avg_tGravityAccMagMean**
36. **avg_tGravityAccMagStd**
37. **avg_tBodyAccJerkMagMean**
38. **avg_tBodyAccJerkMagStd**
39. **avg_tBodyGyroMagMean**
40. **avg_tBodyGyroMagStd**
41. **avg_tBodyGyroJerkMagMean**
42. **avg_tBodyGyroJerkMagStd**
43. **avg_fBodyAccMeanX**
44. **avg_fBodyAccMeanY**
45. **avg_fBodyAccMeanZ**
46. **avg_fBodyAccStdX**
47. **avg_fBodyAccStdY**
48. **avg_fBodyAccStdZ**
49. **avg_fBodyAccJerkMeanX**
50. **avg_fBodyAccJerkMeanY**
51. **avg_fBodyAccJerkMeanZ**
52. **avg_fBodyAccJerkStdX**
53. **avg_fBodyAccJerkStdY**
54. **avg_fBodyAccJerkStdZ**
55. **avg_fBodyGyroMeanX**
56. **avg_fBodyGyroMeanY**
57. **avg_fBodyGyroMeanZ**
58. **avg_fBodyGyroStdX**
59. **avg_fBodyGyroStdY**
60. **avg_fBodyGyroStdZ**
61. **avg_fBodyAccMagMean**
62. **avg_fBodyAccMagStd**
63. **avg_fBodyBodyAccJerkMagMean**
64. **avg_fBodyBodyAccJerkMagStd**
65. **avg_fBodyBodyGyroMagMean**
66. **avg_fBodyBodyGyroMagStd**
67. **avg_fBodyBodyGyroJerkMagMean**
68. **avg_fBodyBodyGyroJerkMagStd**

