mapp <- function(a,b,c) {
  setwd("/Users/mabochen/Info201/ba6-project/scripts")
  crimes <- read.csv("../data/data_map.csv", stringsAsFactors = FALSE)
  
  crimes <- crimes %>% 
    filter(crime_category == b,
           Year == a,
           Month == c)
  
  leaflet(data = crimes) %>%
    addProviderTiles("Stamen.TonerLite") %>% # add Stamen Map Tiles
    addCircleMarkers( # add markers for each shooting
      lat = crimes[, "lat"],
      lng = crimes[, "long"],
      color = "blue", # set color w/ input,
      fillOpacity = .5,
      radius = 4,
      stroke = FALSE
    )
}
