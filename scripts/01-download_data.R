#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Xinze Wu
# Date: 24 Sep 2024
# Contact: kerwin.wu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)
library(dplyr)

#### Download data ####
package <- opendatatoronto::search_packages("theft from motor vehicle")

#Using search package to get the list of the target files and print it out
resources <- list_package_resources(package)
print(resources)

#Choose the one needed in this paper
theft_data <- get_resource(resources$id[9])

write.csv(theft_data, "data/raw_data/theft_raw_data.csv", row.names = FALSE)
cat("Data successfully saved to data/raw_data/theft_from_motor_vehicle.csv")

         
