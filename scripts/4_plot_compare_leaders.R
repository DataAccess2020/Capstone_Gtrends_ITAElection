library(tidyverse)
library(ggplot2)
library(rio)
library(plotly)

#plot for all party leaders: surname----

leaders_plot <- ggplot(merge_data, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
leaders_plot

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

leaders_plot
