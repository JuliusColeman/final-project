library("shiny")
library("dplyr")
library("ggplot2")
library("data.table")

# Load data
police_report <- read.csv("Seattle_Police_Department_Police_Report_Incident.csv.bz2")

# Define server
server <- function(input, output) {
  url <- a("Seattle Police Department Police Report Incident", href='https://data.seattle.gov/Public-Safety/Seattle-Police-Department-Police-Report-Incident/7ais-f98f')
  output$home <- renderUI({
    tagList("We will be using the", url, "dataset to 
    help our audience learn if there has been an increase or decrease in crime overtime, 
    what are the most common types of crime, and which areas/locations in Seattle has the 
    highest crime rate.")
  })
                             
  #output$crimetypes <- renderPrint({expr, env, quoted, func, width})
                                  
  output$time <- renderPlot({
    years <- select(data, Year)
    years <- table(years)
    years <- as.data.frame(years)
    years <- filter(years, Freq > 27000)
    
    ggplot(years, aes(x=years, y=Freq, group = 1)) +
      geom_line()
    
  })
  
  #output$map <- renderImage({expr, env, quoted, deleteFile})

}

shinyServer(server)