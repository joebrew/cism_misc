library(dplyr)
library(ggplot2)
library(leaflet)
library(readxl)
library(RColorBrewer)
library(raster)
source('prepare_africa_data.R')

df <- prepare_africa_data()
df <- data.frame(df)

colspal <- brewer.pal(n=9,name="Spectral")
colspal <- colorRampPalette(colspal)(nrow(df))
colspal <- colspal[sample(1:length(colspal))]
cols <- colspal
x <- leaflet() %>%
  addProviderTiles("Stamen.TonerLite") %>%
  addCircleMarkers(lng=df$lon,
                   lat=df$lat,
                   popup=paste0(df$ADMNM1),
                   color=cols,
                   radius=3,
                   opacity=0,
                   fillOpacity=1)

x

# Polygon example

# Get canada shapefile
moz3 <- getData('GADM', country = 'MOZ', level = 3)

# Subset to just include area of Manhica and Magude
man <- moz3[moz3@data$NAME_1 == 'Maputo', ]

# cols
cols0 <- colorRampPalette(brewer.pal(9, 'Spectral'))(nrow(man))

m <- leaflet(man) %>%
  addProviderTiles("Esri.DeLorme") %>%
  # addProviderTiles("OpenStreetMap.BlackAndWhite") %>%
  # addProviderTiles('Stamen.Watercolor') %>%
  addPolygons(
    stroke = FALSE, fillOpacity = 0.9, smoothFactor = 0.5,
    # color = ~colorQuantile("YlOrRd", moz$ID_1)(ID_1)
    color = cols0)
m
