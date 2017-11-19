suppressMessages({
  library(maptools)
  library(ggplot2)
  library(extrafont)
  library(viridis)
  
})

players <- read.csv("/Users/Heinrick/DS/Dataviz/BD_1617_SPLIT.csv")
players$Born


players$Born <-factor(players$Born, 
                      levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
players$Born

p<-ggplot(data=players, aes(x=Born, y=Ratio, fill=Pop_NHL)) +
  geom_bar(stat="identity",width=0.5, position = position_dodge(width=0.6))+
 scale_fill_manual(values=c('#66BFBF','#D15E62'))+
  theme_classic()+
  scale_y_continuous(expand = c(0, 0), limits = c(0, 10), breaks = c(5, 7.5,10)) + 
  labs(x = 'ratio', y = NULL, fill = NULL,
       title = "NHL players birthdays vs US population")+
  theme(text = element_text(family = "Helvetica", size = 8),
        plot.title = element_text(size = 12, face = "bold"),
        plot.subtitle = element_text(size = 9),
        plot.margin = unit(c(0.25, 0.5, 0.25, 0.5), "in"),
        legend.text = element_text(size = 8),
        legend.position = "right")
p



