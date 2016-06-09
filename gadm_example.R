library(raster)

# Level 0
moz0 <- getData('GADM', country = 'MOZ', level = 0)
plot(moz0)

# Level 1
moz1 <- getData('GADM', country = 'MOZ', level =1)
plot(moz1)

# Level 2
moz1 <- getData('GADM', country = 'MOZ', level =2)
plot(moz1)

# Level 3
moz1 <- getData('GADM', country = 'MOZ', level =3)
plot(moz3)
