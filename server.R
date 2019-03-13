library(dplyr)
library(shiny)
library(ggplot2)
source("./scripts/third.R")
source("./scripts/mapp.R")

my_server <- function(input,output) {
  output$img1 <- renderImage({
    list(src = "data/intro.jpg", width = 400, height = 390)
  }, deleteFile = FALSE)
  
  output$crime_map <- renderLeaflet({
    return(mapp(input$in1, input$in2))
  })
  
  output$third <- renderPlot({
    return(third(input$in3))
  })
}

shinyServer(my_server)