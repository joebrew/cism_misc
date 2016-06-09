library(weatherData)

# Get weather in maputo
weather <- getWeatherForYear(station_id = 'FQMA',
                             # station_type = 'airportCode',
                             year = 2015,
                             opt_detailed = TRUE)

# Alternative
# require(devtools)
# install_github("mpiccirilli/weatheR")
require(weatheR)

data(stations)
# or
moz <- station.list[station.list$CTRY == 'MZ',]

cities <- c("MAPUTO, MZ")

plotStations(cities, station.list, 1)

# Interpolated data
hourly.data <- getInterpolatedDataByCity(cities, station.list, k = 1, 
                                         2015, 2015, 100, 24, tolerance= .05)

plotDailyMax(hourly.data$station_data)
