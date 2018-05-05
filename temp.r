library(dplyr)
library(readr)

## Clear out workspace
#rm(list = ls())

### Step 1. Merge the training and test sets to create one data set
#   read test set data
testx<-read_fwf("./dataset/test/X_test.txt", fwf_widths(c(rep(16,561))), na = c("", "NA"))
print(dim(testx))