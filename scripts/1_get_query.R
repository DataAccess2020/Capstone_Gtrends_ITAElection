library(gtrendsR)
library(rio)
library(tidyverse)
library(ggplot2)


#prova 1: keywords per Giorgia Meloni/Fratelli d'Italia
#confronto cognome/nome + cognome/partito

meloni <- gtrends(
  keyword = c("Meloni", "Giorgia Meloni", "fratelli d'italia"),
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)

print(meloni$interest_over_time)
print(meloni)

data.frame <- as.data.frame(meloni$interest_over_time)
view(data.frame)

ggplot(data.frame, aes(x=date, y=hits)) +
  geom_point(aes(date, hits,color = keyword), position = 'jitter') +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme(legend.position = "none")
theme_bw()

#vedi plot per evoluzione temporale