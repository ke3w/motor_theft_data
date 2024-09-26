#### Preamble ####
# Purpose: Simulates data about theft from motor vehicles
# Author: Xinze Wu
# Date: 24 Sep 2024
# Contact: kerwin.wu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)
library(dplyr)

#### Simulate data ####
raw_data <- read.csv("data/raw_data/theft_raw_data.csv")
head(raw_data)
summary(raw_data)

set.seed(4478)
start_date <- as.Date('2020-01-01')
end_date <- as.Date('2024-06-30')

#Randomly select target based on the features of actual data structure
simulated_data <- data.frame(
  OCC_DATE = sample(seq(start_date, end_date, by = "day"), 100, replace = TRUE),
  REPORT_DATE = sample(seq(start_date, end_date, by = "day"), 100, replace = TRUE),
  DIVISION = sample(unique(raw_data$DIVISION), 100, replace = TRUE),
  LOCATION_TYPE = sample(unique(raw_data$LOCATION_TYPE), 100, replace = TRUE),
  PREMISES_TYPE = sample(unique(raw_data$PREMISES_TYPE), 100, replace = TRUE),
  OFFENCE = sample(unique(raw_data$OFFENCE), 100, replace = TRUE),
  HOOD_158 = sample(unique(raw_data$HOOD_158), 100, replace = TRUE)
)

#Run anova test to check the reliability of the simulated data.
anova_result <- aov(REPORT_DOY ~ LOCATION_TYPE, data = raw_data)
summary(anova_result)
write.csv(simulated_data, "data/analysis_data/theft_analysis_data.csv", row.names = FALSE)
cat("Simulated data successfully saved to data/simulated_theft_data.csv")

