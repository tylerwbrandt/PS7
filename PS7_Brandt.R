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

# 4. Proportion of crime related to robbery by district
robbery_district <- crime_data %>%
  group_by(District) %>%
  mutate(robbery = ifelse(cleaned_description == "ROBBERY", 1, 0)) %>%
  summarise(crime_count = n(),
            robbery_count = sum(robbery),
            pct = robbery_count/crime_count) %>%
  arrange(desc(pct))
robbery_district

## District 5 has the most robberies per crime

# 5. Changes of all types of crime over time
daily_crimes <- crime_data %>%
  mutate(date = substr(as.character(crime_data$DateOccur), 0, 10)) %>%
  mutate(date2 = as.Date.character(date, "%m/%d/%Y")) %>%
  group_by(date2) %>%
  summarise(count = n()) %>%
  filter (date2 > "2017-12-31")

ggplot(data = daily_crimes, aes(date2, count)) +
  geom_line(position = "dodge") + xlab("Date") + ylab("number of daily crimes") +
  ggtitle ("Daily crimes over time")


