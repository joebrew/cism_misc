library(weatherData)

# Get weather in maputo
weather <- getWeatherForYear(station_id = 'FQMA',
                             # station_type = 'airportCode',
                             year = 2015,
                             opt_detailed = TRUE)
