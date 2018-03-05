library("shiny")
library("dplyr")
library("ggplot2")
library("data.table")

# Load data
police_report <- read.csv("Seattle_Police_Department_Police_Report_Incident.csv.bz2")

# Define server
server <- function(input, output) {
  
  #output$home <- renderPrint({expr, env, quoted, func, width})
                             
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