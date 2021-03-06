# This is a function which generates a map based on crime, year, and month.
mapp <- function(a,b,c) {
  crimes <- read.csv("data/data_map.csv", stringsAsFactors = FALSE)
  
  crimes <- crimes %>% 
    filter(crime_category == b,
           Year == a,
           Month == c)
  
  leaflet(data = crimes) %>%
    addProviderTiles("Stamen.TonerLite") %>% # add Stamen Map Tiles
    addCircleMarkers( # add markers for each occurrence
      lat = crimes[, "lat"],
      lng = crimes[, "long"],
      color = "blue", # set color w/ input,
      fillOpacity = .5,
      radius = 4,
      stroke = FALSE
    )
}
