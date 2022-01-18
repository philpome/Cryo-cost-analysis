setwd("/Users/meganphilpott/Desktop/IMLS Meeting 2020")
library(ggplot2)
library(viridis)
focal<-read.csv("focal_species.csv",header=TRUE)
unique(focal$Family)

p1<-ggplot(focal, aes(Family)) + 
  geom_bar(fill = "#440154FF") + 
  theme_classic() + 
  theme(axis.text.x=element_text(angle=45, hjust=1))
p1

p2<-ggplot(focal, aes(Natureserve_Status)) + 
  geom_bar(fill = "#33638DFF") + 
  labs(x="NatureServe Status") +
  theme_classic()
p2

all<-read.csv("all_species.csv",header=TRUE)

p3<-ggplot(focal, aes(Family, fill=Institution)) + 
  geom_bar() + 
  theme_classic() + 
  theme(axis.text.x=element_text(angle=45, hjust=1))
p3
p3 +   scale_colour_viridis_d()

costs <- read.csv("prop-costs-nolyon.csv")

library(dplyr)
costs2 <- costs %>% 
  arrange(desc(Cost_type)) %>%
  mutate(ypos = cumsum(Prop.nolyon)- 0.5*Prop.nolyon )

p4 <- ggplot(costs2, aes(x="", y=Prop.nolyon, fill=Cost_type)) +
        geom_bar(stat="identity", width=1) +
        coord_polar("y", start=0) +
        theme_void() +
        scale_fill_viridis_d(name = "Cost Type", labels = c("Labor (49.58%)", "Other (0.05%)", "Overhead (16.67%)", "Supplies (31.66%)", "Transportation (2.05%)"), guide = guide_legend(reverse=TRUE))
        #theme(legend.position="none") +
        #geom_text(aes(y = ypos, label = Cost_type), color = "white", size=4) 
p4

