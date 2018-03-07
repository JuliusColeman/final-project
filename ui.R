# install.packages("data.table")
# install.packages("leaflet")
library("shiny")
library("dplyr")
library("data.table")
library("leaflet")
library(readr)

# Load data
#police_report <- fread("bzcat Seattle_Police_Department_Police_Report_Incident.csv.bz2")
police_report <- read_csv("Seattle_Police_Department_Police_Report_Incident.csv.zip")

crime_types <- c("animal", "assault", "burglary", "counterfeit", "dispute", "disturbance", "dui", 
                 "embezzle", "false report", "forgery check", "fraud", "harassment", "homicide",
                 "injury", "liquor law", "malicious harassment", "narcotics", "obstruct", 
                 "property damage", "prostitution", "reckless burning", "robbery", "theft",
                 "violation of court order", "warrant", "weapon")

# Define UI
shinyUI(navbarPage(title = "Seattle Crime Rate",
  
  tabPanel("Home",
    mainPanel(
      h2("About Our Project"),
      p("We created this project tailored for residents of Seattle, Washington or those who are planning to move here."),
      uiOutput("home"),
      h2("About Us"),
      p("Our team consists of four members: Julius Coleman, Lin Lin, Jordan Lucas, and Ryan Dang."),
      p("To view our code for this project, feel free to check out our",
        a("GibHub Repository.",
          href = "https://github.com/JuliusColeman/final-project"))
    )
  ),  
  
  tabPanel("Crime Types",
    # title of page
    h1("Graph of Crimes in Seattle", align ="center"),
    h5("This interactive graph displays the most common crimes in Seattle. You can select a year from 2008 and up and it will display
       a graph showing different crimes that have been committed in the selected year. This will allow the user to see what the 
       most/least common crime was."),
      sidebarLayout(
        sidebarPanel(
          selectInput("select", "Select Year:", choices = list( "2008"="2008", "2009"="2009", "2010"="2010","2011" = "2011",
                      "2012" = "2012","2013"="2013","2014"="2014","2015"="2015","2016"="2016","2017"= "2017",
                      "2018" = "2018"))
        ),
        mainPanel(plotOutput("crimetypes"))
      )
  ),
                   
  tabPanel("Rate",
    # Title of the page
    h1("Graph of Seattle Crime Rates", align = "center"),
    h5("This interactive graph show the rate of crime in Seattle from 2008 and 2017. You can use 
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
    h1("Map of Crimes in Seattle (2017)", align = "center"),
    h5("This interactive map shows the locations of crime within the City of Seattle during 2017. 
       You can zoom in to view the clusters and individual markers. To find out information about
       the type of crime that was committed, you can click on the marker to display a popup."),
                            
    # Making the map fill the whole page
    tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
                            
    # Outputting the map
    leafletOutput(outputId = "map"))
  )
)