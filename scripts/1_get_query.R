library(gtrendsR)
library(rio)
library(tidyverse)
library(ggplot2)


#keywords per GIORGIA MELONI/FRATELLID'ITALIA-----
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


data.meloni$searches <- as.numeric(data.meloni$hits) #transfrom "hits" into a numeric variable 


library(plyr)  #value hits= "<1" become missing "NA", so i transform them in zero

#i create a new recoded variable "searches2"
data.meloni <- data.meloni %>% 
  mutate(hits_score=mapvalues(searches, from = c(NA),
                             to = c(0)))
export(data.meloni, "meloni_keywords.csv")


#keywords ENRICO LETTA/PARTITO DEMOCRATICO----

letta_key <- c("letta", "enrico letta", "partito democratico", "pd")

#get data from Google trends
letta <- gtrends(
  keyword = letta_key,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)


data.letta <- as.data.frame(letta$interest_over_time)

data.letta$searches <- as.numeric(data.letta$hits) 

data.letta <- data.letta %>% 
  mutate(hits_score=mapvalues(searches, from = c(NA),
                              to = c(0)))

export(data.letta, "letta_keywords.csv")

#keywords MATTEO SALVINI/LEGA-----
salvini_key <- c("salvini", "matteo salvini", "lega per salvini premier", "lega nord")

#get data from Google trends
salvini <- gtrends(
  keyword = salvini_key,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)


data.salvini <- as.data.frame(salvini$interest_over_time)

data.salvini$searches <- as.numeric(data.salvini$hits) 

data.salvini <- data.salvini %>% 
  mutate(hits_score=mapvalues(searches, from = c(NA),
                              to = c(0)))

export(data.salvini, "salvini_keywords.csv")

#keywords SILVIO BERLUSCONI/FORZA ITALIA -----
berlusconi_key <- c("berlusconi", "silvio berlusconi", "forza italia")

#get data from Google trends
berlusconi <- gtrends(
  keyword = berlusconi_key,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)


data.berlu <- as.data.frame(berlusconi$interest_over_time)

data.berlu$hits_score <- as.numeric(data.berlu$hits) 

export(data.berlu, "berlusconi_keywords.csv")

#keywords GIUSEPPE CONTE/MOVIMENTO 5 STELLE----
conte_key <- c("conte", "giuseppe conte", "movimento 5 stelle", "m5s")

#get data from Google trends
conte <- gtrends(
  keyword = conte_key,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)


data.conte <- as.data.frame(conte$interest_over_time)

data.conte$hits_score <- as.numeric(data.conte$hits) 

export(data.conte, "conte_keywords.csv")

#keywords MATTEO RENZI/CARLO CALENDA/TERZO POLO-----
terzopolo_key <- c("renzi", "calenda", "azione italia viva", "terzo polo")

terzopolo <- gtrends(
  keyword = terzopolo_key,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)

data.3polo <- as.data.frame(terzopolo$interest_over_time)

data.3polo$searches <- as.numeric(data.3polo$hits) 

data.3polo <- data.3polo %>% 
  mutate(hits_score=mapvalues(searches, from = c(NA),
                              to = c(0)))

export(data.3polo, "terzopolo_keywords.csv")
