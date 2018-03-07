## Offenses Filtered to find highest offense in Seattle 
library('dplyr')
library('stringr')
library('ggplot2')
## reads data
datat <- read.csv("~/Desktop/info_201/final-project/offenses/Seattle_Police_Department_Police_Report_Incident.csv.bz2", header = TRUE)

## Filters offenses and removes spacing + "-"
datatest <- select(datat, Offense.Type, Year)
datatest$Offense.Type <- gsub('-.*',"",datatest$Offense.Type)
datatest$Offense.Type <- gsub(' .*',"",datatest$Offense.Type)

## focuses on the most common offenses 
target <- c("WARRARR", "VEH", "THEFT", "ROBBERY", "NARC", "PROPERTY", "HARASSMENT", "FRAUD", "DISTURBANCE", "BURGLARY", "ASSLT")
newdata <- datatest%>%
  filter(Offense.Type %in% target)

## example of 2014 crime data 
year.graph <- newdata[newdata$Year == "2014",]

## creates graph for the crimes 
offeneses_graph <- ggplot(data = year.graph) +
  geom_bar(width = .2, mapping = aes(x = Offense.Type, fill = Offense.Type)) + ggtitle("Offenses in Seattle") + coord_flip()+ scale_y_continuous(name="Freq", labels = scales::comma)


