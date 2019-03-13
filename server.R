library(dplyr)
library(shiny)
library(ggplot2)
library(snakecase)
options(scipen = 999)
library(tidyr)
source("./scripts/third.R")
source("./scripts/mapp.R")
source("./scripts/crime_plot.R")

my_server <- function(input,output) {
  
  output$img1 <- renderImage({
    list(src = "data/intro.jpg", width = 400, height = 390)
  }, deleteFile = FALSE)
  
  output$crime_map <- renderLeaflet({
    return(mapp(input$year, input$crime, input$month))
  })
  
  output$third <- renderPlot({
    return(third(input$in3))
  })
  
  output$plot <- renderPlot({
    return(crime_plot(input$Neighborhood, input$Crime_Subcategory))
  })
}

shinyServer(my_server)