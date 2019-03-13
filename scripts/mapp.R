mapp <- function(a,b,c) {
  crimes <- read.csv("data/data_map.csv", stringsAsFactors = FALSE)
  
  crimes <- crimes %>% 
    filter(crime_category == b,
           Year == a,
           Month == c)
  
  palette_fn <- colorFactor(
    palette = "Dark2",
    domain = crimes$crime_category
  )
  
  leaflet(data = crimes) %>%
    addProviderTiles("Stamen.TonerLite") %>% # add Stamen Map Tiles
    addCircleMarkers( # add markers for each shooting
      lat = crimes[, "lat"],
      lng = crimes[, "long"],
      color = ~palette_fn(crimes$crime_category), # set color w/ input,
      fillOpacity = .7,
      radius = 4,
      stroke = FALSE
    )
}
