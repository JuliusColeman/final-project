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
ui <- (navbarPage(title = "Seattle Crime Rate",
      tabPanel("Home", uiOutput("home"),
      mainPanel(uiOutput("home"))
    ),  
    
      tabPanel("Crime Types", verbatimTextOutput("crimetypes"),
        sidebarLayout(
          sidebarPanel(
            selectInput(inputId = "type", label = strong("Types of Crime"),
                        choices = police_report$Offense.Type,
                        selected = "animal")
          ),
          mainPanel(verbatimTextOutput("crimetypes"))
        )
      ),
  
      tabPanel("Time", plotOutput("time"),
        sidebarLayout(
          sidebarPanel(
            sliderInput(inputId = "year", label = strong("Year"), min = 2008, max = 2017,
                        value = 2017)
          ),
          mainPanel(plotOutput("time"))
        )            
      ),

      tabPanel("Map", imageOutput("map"),
        mainPanel(imageOutput("map"))
      )
  )
)