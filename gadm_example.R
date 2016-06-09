library(raster)

# Level 0
moz0 <- getData('GADM', country = 'MOZ', level = 0)
plot(moz0)

# Level 1
moz1 <- getData('GADM', country = 'MOZ', level =1)
plot(moz1)

# Level 2
moz2 <- getData('GADM', country = 'MOZ', level =2)
plot(moz2)

# Level 3
moz3 <- getData('GADM', country = 'MOZ', level =3)
plot(moz3)
plot(moz3, 
     col = ifelse(moz3@data$NAME_3 == 'Magude', 'red', 'grey'),
     border = NA)

# Subset for only manhica
man <- moz3[moz3@data$NAME_2 == 'Manhiça',]
plot(man)

# Subset for only maputo
maputo <- moz3[moz3@data$NAME_1 == 'Maputo',]

# Man over moz
plot(maputo)
plot(man, col = 'red', add = TRUE)
