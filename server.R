library(dplyr)
library(shiny)
library(ggplot2)
library(snakecase)
options(scipen = 999)
library(tidyr)
source("./scripts/mapp.R")
source("./scripts/crime_plot.R")
source("./scripts/time.R")

my_server <- function(input,output) {
  
  output$img1 <- renderImage({
    list(src = "data/seattle.jpg", width = "100%", height = "100%")
  }, deleteFile = FALSE)
  
  output$crime_map <- renderLeaflet({
    return(mapp(input$year, input$crime, input$month))
  })
  
  output$plot <- renderPlot({
    return(crime_plot(input$Neighborhood, input$Crime_Subcategory))
  })
  
  output$time <- renderTable({
    return(time(input$radio))
  })
}

shinyServer(my_server)