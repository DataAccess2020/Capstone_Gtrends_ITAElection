#individual plot for each subject with the distribution of his/her keywords

library(lubridate)
library(plotly)

#plot - Giorgia Meloni-----

data.meloni$date <- as_date(data.meloni$date)

meloni_plot <- ggplot(data.meloni, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple", "deepskyblue3", "darkorange2"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Giorgia Meloni", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
           plot.subtitle = element_text(hjust = 0.5))


meloni_plot_int <- ggplotly(meloni_plot)

#plot - Enrico Letta----

data.letta$date <- as_date(data.letta$date)

letta_plot <- ggplot(data.letta, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple", "deepskyblue3", "darkorange2", "gold3"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Enrico Letta", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

letta_plot_int <- ggplotly(letta_plot)


#plot - Matteo Salvini-----

data.salvini$date <- as_date(data.salvini$date)

salvini_plot <- ggplot(data.salvini, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple", "deepskyblue3", "darkorange2", "gold3"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Matteo Salvini", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

salvini_plot_int <- ggplotly(salvini_plot)

#plot - Silvio Berlusconi----

data.berlu$date <- as_date(data.berlu$date)
berlusconi_key
berlu_plot <- ggplot(data.berlu, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple", "deepskyblue3", "darkorange2"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Silvio Berlusconi", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
berlu_plot_int <- ggplotly(berlu_plot)

#plot - Giuseppe Conte-----

data.conte$date <- as_date(data.conte$date)

conte_plot <- ggplot(data.conte, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple", "deepskyblue3", "darkorange2", "gold3"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Giuseppe Conte", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
conte_plot_int <- ggplotly(conte_plot)

#plot - terzo polo: Calenda e Renzi----

data.3polo$date <- as_date(data.3polo$date)

terzopolo_plot <- ggplot(data.3polo, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  scale_color_manual(values = c("purple", "deepskyblue3", "darkorange2", "gold3"), "keyword") +
  ylab("hits") +
  xlab("date") +
  ggtitle("Terzo polo", subtitle = "interest over time") +
  scale_x_date(date_labels = "%d %b %Y", date_breaks = "10 days") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
terzopolo_plot_int <- ggplotly(terzopolo_plot)
