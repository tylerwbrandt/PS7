## Problem Set 7 - Tyler Brandt
library(dplyr)
library(ggplot2)

# 1. Import dataset
crime_data <- read.csv("~/Documents/Applied_Statistical_Programming/March2018.csv.html")
View(crime_data)

# 2. Crimes per day by type of crime
View(mutate(crime_data, cleaned_description = gsub("-.*$", "", crime_data$Description)))
