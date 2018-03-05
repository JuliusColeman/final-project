library("shiny")
library("dplyr")

# Load data
police_report <- read.csv("Seattle_Police_Department_Police_Report_Incident.csv.bz2")

# Define UI
ui <- fluidPage(
  titlePanel("Seattle Crime Rate"),
  sidebarLayout(
    sidebarPanel(

      sliderInput(inputId = "year", label = strong("Year"), min = 2012, max = 2018,
                  value = 2016)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("tab 1", "contents"),
        tabPanel("tab 2", "contents"),
        tabPanel("tab 3", "contents"))
      
    )
  )
)