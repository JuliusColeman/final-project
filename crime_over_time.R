library(dplyr)
library(ggplot2)
library(data.table)

data <- fread("bzcat Seattle_Police_Department_Police_Report_Incident.csv.bz2")

years <- select(data, Year)
years <- table(years)
years <- as.data.frame(years)
years <- filter(years, Freq > 27000)

crimeplot <- ggplot(years, aes(x=years, y=Freq, group = 1)) +
  geom_line()

