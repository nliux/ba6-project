library(shiny)
library(dplyr)
library(lubridate)
library(stringr)

# This is a function which generates a chart comparing the highest and lowest
# rates of crime depending on the time of day selected.
time <- function(period){
  crime_another <- read.csv("data/crime_modified.csv", stringsAsFactors = FALSE)
  crime_clean <- crime_another %>%
    select(Occurred.Time, Crime.Subcategory, Neighborhood)
    
  crime_clean$Time.Of.Day <- ifelse(crime_clean$Occurred.Time >= 0 & crime_clean$Occurred.Time <= 559, 'Early Morning',
                                    ifelse(crime_clean$Occurred.Time >= 600 & crime_clean$Occurred.Time <= 1059, 'Morning',
                                           ifelse(crime_clean$Occurred.Time >= 1100 & crime_clean$Occurred.Time <= 1359, 'Noon',
                                                  ifelse(crime_clean$Occurred.Time >= 1400 & crime_clean$Occurred.Time <= 1759, 'Afternoon',
                                                         ifelse(crime_clean$Occurred.Time >= 1800 & crime_clean$Occurred.Time <= 2359, 'Night', 'No Time Specified')))))
  crime_time <- crime_clean %>%
    filter(Time.Of.Day == period)
    
  Crime.Number <- summary(as.factor(crime_time$Crime.Subcategory))
  Most.Crime <- sort(as.factor(Crime.Number), decreasing = TRUE)
  Most.Crime <- data.frame(Most.Crime)
  Most.Crime <- row.names(Most.Crime)
  Most.Crime <- data.frame(Most.Crime)
   
  Neighborhood.Number <- summary(as.factor(crime_time$Neighborhood))
  Most.Neighborhood <- sort(as.factor(Neighborhood.Number), decreasing = TRUE)
  Most.Neighborhood <- data.frame(Most.Neighborhood)
  Most.Neighborhood <- row.names(Most.Neighborhood)
  Most.Neighborhood <- data.frame(Most.Neighborhood)
   
  most_neighborhood <- head(Most.Neighborhood, 5)
  most_crime <- head(Most.Crime, 5)
  least_neighborhood <- slice(Most.Neighborhood, 55:59)
  least_crime <- slice(Most.Crime, 27:31)
    
  summary <- bind_cols(most_neighborhood, most_crime, least_neighborhood, least_crime)
  
  colnames(summary) <- c("Neighborhood w/ Most Crime",
                         "Most Common Crime",
                         "Neighborhood w/ Least Crime",
                         "Least Common Crime")
  
  summary

}

