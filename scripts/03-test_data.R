#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Xinze Wu
# Date: 24 Sep 2024
# Contact: kerwin.wu@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(dplyr)

test_data <- read.csv("data/analysis_data/theft_analysis_data.csv")
str(test_data)
head(test_data)

#Check if there is any missing data
missing_data_summary <- sapply(test_data, function(x) sum(is.na(x)))
print("Missing values summary:")
print(missing_data_summary)

#Check if there is any duplicate rows
duplicate_rows <- test_data[duplicated(test_data), ]
cat("Number of duplicate rows: ", nrow(duplicate_rows), "\n")

#Check for outliers in Numeric Data
numeric_columns <- sapply(test_data, is.numeric)
summary(test_data[, numeric_columns])