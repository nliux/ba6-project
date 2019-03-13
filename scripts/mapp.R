mapp <- function(a,b) {
  crimes <- read.csv("data/data_map.csv", stringsAsFactors = FALSE)
  
  crimes <- crimes[which(crimes$crime_category == "Assault" | crimes$crime_category == "Vehicle Theft"), ]
  
  palette_fn <- colorFactor(
    palette = "Dark2",
    domain = crimes$crime_category
  )
  
  leaflet(data = crimes) %>%
    addProviderTiles("Stamen.TonerLite") %>% # add Stamen Map Tiles
    addCircleMarkers( # add markers for each shooting
      lat = crimes[which(crimes$Year == a & crimes$crime_category == b), "lat"],
      lng = crimes[which(crimes$Year == a & crimes$crime_category == b), "long"],
      color = ~palette_fn(crimes$crime_category), # set color w/ input,
      fillOpacity = .7,
      radius = 4,
      stroke = FALSE
    )
}