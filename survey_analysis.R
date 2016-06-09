library(gsheet)
library(dplyr)
library(ggmap)
library(ggplot2)

# Read in the survey
url_survey <- 'https://docs.google.com/spreadsheets/d/1iSn98ahGwZOQbBYVw8h0UeRnk_XBRLGPhmwMediDBnY/edit?usp=sharing'
survey <- gsheet2tbl(url_survey)

# Clean up the column names
names(survey) <- c('time', 'sex', 'age', 'food', 'city', 'eradication')

# Geocode the cities
geocoded <- geocode(survey$city)
survey <- cbind(survey, geocoded)
