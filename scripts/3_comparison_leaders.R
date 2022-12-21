#comparison between different surname of the party leaders----

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

#merge the two dataset usign the date as a key
library(dplyr)
merge_data <- bind_rows(data_leader1, data_leader2)

#recoding hits into a numeric variable

merge_data$hits_score <- as.numeric(merge_data$hits) 

#plot for all party leaders: surname

leaders_plot <- ggplot(merge_data, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
leaders_plot

#adding "pd" for letta----

pd <- gtrends(
  keyword = c("meloni", "pd"),
  geo = "IT",
  time = "2022-07-21 2022-09-25",
  gprop = c("web"),
  hl = "it",
  compared_breakdown = FALSE,
  low_search_volume = FALSE,
  cookie_url = "http://trends.google.com/Cookies/NID",
  onlyInterest = FALSE
)

data_pd <- as.data.frame(pd$interest_over_time)

merge_dataPD <- bind_rows(merge_data, data_pd)

merge_dataPD$hits_score <- as.numeric(merge_dataPD$hits)

#plot with surnames + "pd"

leaders_plot2 <- ggplot(merge_dataPD, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
leaders_plot2

#doesn't change anything