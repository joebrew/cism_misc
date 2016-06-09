library(ggplot2)
library(plotly)
library(ggthemes)

# Get data
library(gapminder)
df <- gapminder
moz <- df[df$country == 'Mozambique',]
afr <- df[df$country %in% 
            c('Mozambique',
              'Swaziland',
              'South Africa',
              'Kenya',
              'Uganda',
              'Somalia'),]

# Old way
plot(moz$year,
     moz$lifeExp,
     type = 'l',
     xlab = 'Year',
     ylab = 'Life expectancy',
     main = 'Life expectancy in Mozambique')

# New way
g <- 
  ggplot(data = afr,
         aes(x = year,
             y = lifeExp,
             group = country,
             color = country)) +
  geom_line() +
  theme_fivethirtyeight() +
  ggtitle('Life expectancy by country')

ggplotly(g)
