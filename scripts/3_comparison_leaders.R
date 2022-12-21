#comparison between different surname of the party leaders

library(gtrendsR)
library(rio)
library(tidyverse)
library(ggplot2)

leaders_surname <- c("meloni", "letta", "salvini", "berlusconi")
leaders_surname2 <- c("meloni", "conte", "calenda", "renzi")

#we cannot get a query with >5 keywords, 
#so I divided the seven subjects into two groups, mantaining "meloni" as a key in order to merge the data
#I chose "meloni" because it's the highest value on which the others are scaled

party_leaders <- gtrends(
  keyword = leaders_surname,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)

party_leaders2 <-  gtrends(
  keyword = leaders_surname2,
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)


data_leader1 <- as.data.frame(party_leaders$interest_over_time)
data_leader2 <- as.data.frame(party_leaders2$interest_over_time)
