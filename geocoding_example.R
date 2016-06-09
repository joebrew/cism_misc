library(ggmap)
library(maps)
places <- read.csv('places.csv', stringsAsFactors = FALSE)
geocoded <- geocode(places$place)
places <- cbind(places, geocoded)

map('world')
points(places$lon, places$lat, col = 'red')
