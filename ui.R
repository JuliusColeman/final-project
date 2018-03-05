library("shiny")
library("dplyr")

# Load data
police_report <- read.csv("Seattle_Police_Department_Police_Report_Incident.csv.bz2")

# Define UI
ui <- fluidPage(
  titlePanel("Seattle Crime Rate"),
  sidebarLayout(
    sidebarPanel(

      sliderInput(inputId = "year", label = strong("Year"), min = 2008, max = 2017,
                  value = 2017)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Home", "home"),
        tabPanel("Crime Types", "crimetype"),
        tabPanel("Time", "time"),
        tabPanel("Map", "map"))
      
    )
  )
)