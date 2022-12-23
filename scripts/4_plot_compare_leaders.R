library(tidyverse)
library(ggplot2)
library(rio)
library(plotly)

#plot for all party leaders: surname----

merge_data$date <- as_date(merge_data$date)

leaders_plot <- ggplot(merge_data, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple3", "deepskyblue3", "darkorange2", "gold3", "orchid3", "royalblue4", "chartreuse4"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Comparison between leaders", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

leaders_plot_int <- ggplotly(leaders_plot)

#plot with separed lines for each leader------


facet_plots <- ggplot(merge_data, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  facet_wrap(~keyword, ncol = 3) +
  scale_color_manual(values = c("purple3", "deepskyblue3", "darkorange2", "gold3", "orchid3", "royalblue4", "chartreuse4"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Comparison between leaders", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %m", date_breaks = "2 weeks") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))


facet_plots_int <- ggplotly(facet_plots)

#adding "pd" for letta----

#always use keyword "meloni" as key for merge because has the highest value
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

data_pd <- data_pd[-(1:67),]

merge_data.pd <- bind_rows(merge_data, data_pd)

merge_data.pd$hits_score <- as.numeric(merge_data.pd$hits)
merge_data.pd$date <- as_date(merge_data.pd$date)

#plot with surnames + "pd"

leaders_plot.pd <- ggplot(merge_data.pd, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple3", "deepskyblue3", "darkorange2", "gold3", "orchid3", "red2", "royalblue4", "chartreuse4"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Comparison between leaders + PD", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

#also considering "pd", doesn't change anything