# install.packages("data.table")
# install.packages("leaflet")
# install.packages("htmltools")
library("shiny")
library("dplyr")
library("ggplot2")
library("data.table")
library("leaflet")
library("htmltools")

# Load data
police_report <- fread("bzcat Seattle_Police_Department_Police_Report_Incident.csv.bz2")

# Define server
shinyServer(function(input, output, session) {
  url <- a("Seattle Police Department Police Report Incident", href='https://data.seattle.gov/Public-Safety/Seattle-Police-Department-Police-Report-Incident/7ais-f98f')
  output$home <- renderUI({
    tagList("We will be using the", url, "dataset to 
    help our audience learn if there has been an increase or decrease in crime overtime, 
    what are the most common types of crime, and which areas/locations in Seattle has the 
    highest crime rate.")
  })
  
  ## Crime Filter Data Set 
  datatest <- select(police_report, Offense.Type, Year)
  datatest$Offense.Type <- gsub('-.*',"",datatest$Offense.Type)
  datatest$Offense.Type <- gsub(' .*',"",datatest$Offense.Type)
  
  ## focuses on the most common offenses 
  target <- c("WARRARR", "VEH", "THEFT", "ROBBERY", "NARC", "PROPERTY", "HARASSMENT", "FRAUD", "DISTURBANCE", "BURGLARY", "ASSLT")
  newdata <- datatest%>%
    filter(Offense.Type %in% target)
                             
  output$crimetypes <- renderPlot({
    
    ## filters the year
    year.graph <- newdata[newdata$Year == input$select,]
    
    ## prints graph of crimes for that year 
    offeneses_graph <- ggplot(data = year.graph) +
      geom_bar(width = .2, mapping = aes(x = Offense.Type, fill = Offense.Type)) + ggtitle("Offenses in Seattle") + coord_flip() + scale_y_continuous(name="Freq", labels = scales::comma) 
    print(offeneses_graph)
    
  })
                                  
  output$time <- renderPlot({
    years <- select(police_report, Year)
    years <- table(years)
    years <- as.data.frame(years)
    years$years <- as.numeric(as.character(years$years))
    years$Freq <- as.numeric(as.character(years$Freq))
    years <- filter(years, Freq > 27000)
    
    
    ggplot(years, aes(x=years, y=Freq, group = 1)) +
      stat_smooth(geom = 'area', method = 'loess', fill = "steelblue") +
      scale_x_continuous(breaks = years$years, name="Year", limits=c(input$year[1], input$year[2])) +
      ylab("Count") + labs(title="Seattle Crime Rate")
  
  })
  
  output$map <- renderLeaflet({
    
    # Filtering out years beside 2017 
    data <- filter(police_report, Year == 2017)
    
    # Creating the map
    map <- leaflet(data) %>% 
      addTiles() %>% 
      addMarkers(
        lng = ~Longitude, lat = ~Latitude,
        popup = ~htmlEscape(Summarized.Offense.Description),
        clusterOptions = markerClusterOptions()
      )
    
    # Displaying the map
    map
  })
})