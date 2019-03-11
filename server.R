library(dplyr)
library(shiny)
library(ggplot2)
source("./scripts/third.R")

my_server <- function(input,output) {
  
  #modify dataset
  
  
  
  output$img1 <- renderImage({
    list(src = "data/intro.jpg", width = 400, height = 390)
  }, deleteFile = FALSE)
  
  output$crime_map <- renderLeaflet({
    crimes <- read.csv("data/data_map.csv", stringsAsFactors = FALSE)
    
    crimes <- crimes[which(crimes$crime_category == "Assault" | crimes$crime_category == "Vehicle Theft"), ]
    
    palette_fn <- colorFactor(
      palette = "Dark2",
      domain = crimes$crime_category
    )
    
    leaflet(data = crimes) %>%
      addProviderTiles("Stamen.TonerLite") %>% # add Stamen Map Tiles
      addCircleMarkers( # add markers for each shooting
        lat = crimes[which(crimes$Year == input$in1 & crimes$crime_category == input$in2), "lat"],
        lng = crimes[which(crimes$Year == input$in1 & crimes$crime_category == input$in2), "long"],
        color = ~palette_fn(crimes$crime_category), # set color w/ input,
        fillOpacity = .7,
        radius = 4,
        stroke = FALSE
      )
  })
  
  output$third <- renderPlot({
    return(third(input$in3))
  })
}

shinyServer(my_server)