library("shiny")
library("dplyr")
library("ggplot2")
library("data.table")

# Load data
police_report <- fread("bzcat Seattle_Police_Department_Police_Report_Incident.csv.bz2")

# Define server
shinyServer(function(input, output) {
  url <- a("Seattle Police Department Police Report Incident", href='https://data.seattle.gov/Public-Safety/Seattle-Police-Department-Police-Report-Incident/7ais-f98f')
  output$home <- renderUI({
    tagList("We will be using the", url, "dataset to 
    help our audience learn if there has been an increase or decrease in crime overtime, 
    what are the most common types of crime, and which areas/locations in Seattle has the 
    highest crime rate.")
  })
                             
  output$crimetypes <- renderPlot({
    
  })
                                  
  output$time <- renderPlot({
    years <- select(data, Year)
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
  
  output$map <- renderImage({
    
  })

})