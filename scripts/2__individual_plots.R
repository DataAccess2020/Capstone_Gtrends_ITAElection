#individual plot for each subject with the distribution of his/her keywords

#plot - Giorgia Meloni-----

#library(viridis)
#
#ggplot(data.meloni, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
#  geom_line(size=1) +
#  scale_color_viridis(discrete = TRUE, option = "viridis") +
#  theme_bw()


meloni_plot <- ggplot(data.meloni, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()

meloni_plot

#plot - Enrico Letta----

letta_plot <- ggplot(data.letta, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
letta_plot
#plot - Matteo Salvini-----

salvini_plot <- ggplot(data.salvini, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
salvini_plot

#plot - Silvio Berlusconi----

berlu_plot <- ggplot(data.berlu, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
berlu_plot

#plot - Giuseppe Conte-----
conte_plot <- ggplot(data.conte, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
conte_plot

#plot - terzo polo: Calenda e Renzi----
terzopolo_plot <- ggplot(data.3polo, aes(y = hits_score, x = date, group = keyword, color=keyword)) +
  geom_line(size=1) +
  theme_bw()
terzopolo_plot
