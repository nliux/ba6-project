library(dplyr)
library(shiny)
library(ggplot2)

my_server <- function(input,output) {
  output$img1 <- renderImage({
    list(src = "data/intro.jpg", width = 400, height = 390)
  }, deleteFile = FALSE)
  
  output$crime_map <- renderLeaflet({
    crimes <- read.csv("data/data_map.csv", stringsAsFactors = FALSE)
    
    leaflet(data = crimes) %>%
      addProviderTiles("Stamen.TonerLite") %>% # add Stamen Map Tiles
      addCircleMarkers( # add markers for each shooting
        lat = crimes[which(crimes$Year == input$in1 & crimes$crime_category == input$in2), "lat"],
        lng = crimes[which(crimes$Year == input$in1 & crimes$crime_category == input$in2), "long"],
        color = "Grey",
        fillOpacity = .7,
        radius = 4,
        stroke = FALSE
      )
  })
}

shinyServer(my_server)