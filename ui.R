library("shiny")
library("dplyr")
library("data.table")

# Load data
police_report <- fread("bzcat Seattle_Police_Department_Police_Report_Incident.csv.bz2")

crime_types <- c("animal", "assault", "burglary", "counterfeit", "dispute", "disturbance", "dui", 
                  "embezzle", "false report", "forgery check", "fraud", "harassment", "homicide",
                  "injury", "liquor law", "malicious harassment", "narcotics", "obstruct", 
                  "property damage", "prostitution", "reckless burning", "robbery", "theft",
                  "violation of court order", "warrant", "weapon")

# Define UI
shinyUI(navbarPage(title = "Seattle Crime Rate",
      tabPanel("Home",
        mainPanel(uiOutput("home"))
      ),  
    
      tabPanel("Crime Types",
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "type", label = strong("Types of Crime"),
                        choices = crime_types,
                        selected = "animal")
          ),
          mainPanel(plotOutput("crimetypes"))
        )
      ),
  
      tabPanel("Time",
        sidebarLayout(
          sidebarPanel(
            sliderInput(inputId = "year", label = strong("Year"), min = 2008, max = 2017,
                        value = c(2008, 2017))
          ),
          mainPanel(plotOutput("time"))
        )            
      ),

      tabPanel("Map",
        mainPanel(plotOutput("map"))
      )
  )
)