library(dplyr)
library(leaflet)
library(readr)

data <- read_csv("~/Documents/Info 201 Assignments/final-project/Seattle_Police_Department_Police_Report_Incident.csv.zip") %>% 
  filter(Year == 2017)

map = leaflet(data) %>% 
  addTiles() %>% 
  addMarkers(
    lng = ~Longitude, lat = ~Latitude,
    clusterOptions = markerClusterOptions()
  )

print(map)