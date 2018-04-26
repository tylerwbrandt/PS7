## Problem Set 7 - Tyler Brandt
library(dplyr)
library(ggplot2)

# 1. Import dataset
crime_data <- read.csv("~/Documents/Applied_Statistical_Programming/March2018.csv.html")
View(crime_data)

# 2. Crimes per day by type of crime
crime_data <- mutate(crime_data, cleaned_description = gsub("-.*$", "", crime_data$Description))
daily_rates_march <- crime_data %>%
  group_by(cleaned_description) %>%
  summarise(count = n()/31)
daily_rates_march
