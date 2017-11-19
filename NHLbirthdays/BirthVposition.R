suppressMessages({
  library(maptools)
  library(ggplot2)
  library(extrafont)
  library(viridis)
  
})

players <- read.csv("/Users/Heinrick/DS/Dataviz/gpby.csv")
players$Born


players$Born <-factor(players$Born, 
                       levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
players$Born

# Basic barplot
p<-ggplot(data=players, aes(x=Born, y=Prct, fill=Position)) +
  geom_bar(stat="identity")+
  theme_classic() + scale_fill_manual(values=c('#66BFBF','#EAF6F6', '#F76B8A'))+
  scale_y_continuous(expand = c(0, 0), limits = c(0, 35)) +
  labs(y = 'ratio', x = NULL, fill = NULL,
       title = "Proportion of birthdays per position",
       subtitle = "D: Defensemen, FW: Forward, G: Goalies")+
  theme(text = element_text(family = "Helvetica", size = 8),
        plot.title = element_text(size = 12, face = "bold"),
        plot.subtitle = element_text(size = 9),
        plot.margin = unit(c(0.25, 0.5, 0.25, 0.5), "in"),
        legend.text = element_text(size = 8),
        legend.position = "right")
p



ggsave("birthdays_position.pdf")