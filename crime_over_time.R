library(dplyr)
library(ggplot2)
library(data.table)

data <- fread("bzcat Seattle_Police_Department_Police_Report_Incident.csv.bz2")

years <- select(data, Year)
years <- table(years)
years <- as.data.frame(years)
years$years <- as.numeric(as.character(years$years))
years$Freq <- as.numeric(as.character(years$Freq))
years <- filter(years, Freq > 27000)


crimeplot <- ggplot(years, aes(x=years, y=Freq, group = 1)) +
  stat_smooth(geom = 'area', method = 'loess', fill = "steelblue") +
  scale_x_continuous(breaks = years$years, name="Year", limits=c(2008, 2017)) +
  ylab("Count") + labs(title="Seattle Crime Rate")

print(crimeplot)