library(ggplot2)

#second one
#comment this out after first run
crime <- read.csv("../data/Crime_Data.csv", stringsAsFactors = FALSE)
for (row in 1:nrow(crime)) {
  date = crime[row, "Occurred.Date"]
  crime[row, "Year"] = substring(date,7,10)
}

second_scatter <- function(a) {
  crime <- read.csv("../data/Crime_Data.csv", stringsAsFactors = FALSE)
  
  four <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2014"), ])
  five <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2015"), ])
  six <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2016"), ])
  seven <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2017"), ])
  eight <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2018"), ])
  
  plot(c(four,five,six,seven,eight))
}