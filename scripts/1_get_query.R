library(gtrendsR)
library(rio)
library(tidyverse)
library(ggplot2)


#prova 1: keywords per Giorgia Meloni/Fratelli d'Italia
#confronto cognome/nome + cognome/partito

meloni_key <- c("meloni", "giorgia meloni", "fratelli d'italia")

#get data from Google trends
meloni <- gtrends(
  keyword = meloni_key,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)

#transform into a data frame

data.meloni <- as.data.frame(meloni$interest_over_time)
view(data.meloni)

typeof(data.meloni$date)
typeof(data.meloni$hits)
typeof(data.meloni$searches)

data.meloni$searches <- as.numeric(data.meloni$hits) #transfrom "hits" into a numeric variable 

count(data.meloni$searches)

library(plyr)  #value hits= "<1" become missing "NA", so i transform them in zero

#i create a new recoded variable "searches2"
data.meloni <- data.meloni %>% 
  mutate(searches2=mapvalues(searches, from = c(NA),
                             to = c(0)))


#plot: distribution 3 keyword for Giorgia Meloni-----

library(viridis)

ggplot(data.meloni, aes(y = searches2, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_viridis(discrete = TRUE, option = "viridis") +
  theme_bw()

#need to add title, label and other graphic features
