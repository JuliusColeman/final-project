library("shiny")
library("dplyr")

# Load data
police_report <- read.csv("Seattle_Police_Department_Police_Report_Incident.csv.bz2")

crime_types <- c("animal", "assault", "burglary", "counterfeit", "dispute", "disturbance", "dui", 
                 "embezzle", "false report", "forgery check", "fraud", "harassment", "homicide",
                 "injury", "liquor law", "malicious harassment", "narcotics", "obstruct", 
                 "property damage", "prostitution", "reckless burning", "robbery", "theft",
                 "violation of court order", "warrant", "weapon")

# Define UI
ui <- fluidPage(
  titlePanel("Seattle Crime Rate"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "type", label = strong("Types of Crime"),
                  choices = crime_types,
                  selected = "animal"),
      
      sliderInput(inputId = "year", label = strong("Year"), min = 2008, max = 2017,
                  value = 2017)
      )
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Home", verbatimTextOutput("home")),
        tabPanel("Crime Types", verbatimTextOutput("crimetypes")),
        tabPanel("Time", plotOutput("time")),
        tabPanel("Map", imageOutput("map"))
    )
  )
)