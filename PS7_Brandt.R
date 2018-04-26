## Problem Set 7 - Tyler Brandt
library(dplyr)
library(ggplot2)

# 1. Import dataset
crime_data <- read.csv("~/Documents/Applied_Statistical_Programming/March2018.csv.html")
View(crime_data)

# 2. Crimes per day by type of crime
crime_data <- mutate(crime_data, cleaned_description = gsub("-.*$", "", crime_data$Description))
daily_rates_crime_type <- crime_data %>%
  group_by(cleaned_description) %>%
  summarise(count = n()/31) %>%
  arrange(desc(count))
daily_rates_crime_type

## Larceny has the most occurrences

# 3. Number of crime per day by neighborhood
daily_rates_neighborhood <- crime_data %>%
  group_by(Neighborhood) %>%
  summarise(count = n()/31) %>%
  arrange(desc(count))
daily_rates_neighborhood

## Neighborhood 35 has the most crimes

