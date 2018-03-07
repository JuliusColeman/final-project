# install.packages("data.table")
# install.packages("leaflet")
library("shiny")
library("dplyr")
library("data.table")
library("leaflet")

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
  
      tabPanel("Rate",
        # Title of the page
        h1("Graph of Seattle Crime Rate", align = "center"),
        h6("This interactive graph show the rate of crime in Seattle from 2008 and 2017. You can use 
           the sliders to adjust the range of years that is shown in the graph."),
        sidebarLayout(
          sidebarPanel(
            sliderInput(inputId = "year", label = strong("Year"), min = 2008, max = 2017,
                        value = c(2008, 2017))
          ),
          mainPanel(plotOutput("time"))
        )            
      ),

      tabPanel("Map",
        # Title of the page
        h1("Map of Crime in Seattle (2017)", align = "center"),
        h6("This interactive map shows the locations of crime within the City of Seattle during 2017. 
           You can zoom in to view the clusters and individual markers. To find out information about
           the type of crime that was committed, you can click on the marker to display a popup."),
               
        # Making the map fill the whole page
        tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
               
        # Outputting the map
        leafletOutput(outputId = "map")
               
      )
  )
)