library(ggplot2)

#second one
#comment this out after first run
#crime <- read.csv("../data/crime_modified.csv", stringsAsFactors = FALSE)
#for (row in 1:nrow(crime)) {
  #date = crime[row, "Occurred.Date"]
  #crime[row, "Year"] = substring(date,7,10)
#}

#write.csv(crime,'crime_modified.csv')

third <- function(a) {
  setwd("/Users/mabochen/Info201/ba6-project/scripts")
  crime <- read.csv("../data/crime_modified.csv", stringsAsFactors = FALSE)
  four <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2014"), ])
  five <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2015"), ])
  six <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2016"), ])
  seven <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2017"), ])
  eight <- nrow(crime[which(crime$Neighborhood == a & crime$Year == "2018"), ])
  
 #plot(c(four,five,six,seven,eight))
  chart_df <- data.frame(year=c("2014", "2015", "2016", "2017", "2018"),
                         Num=c(four, five, six, seven, eight))
  
  bar_graph <-ggplot(data=chart_df, aes(x=year, y=Num, fill = year)) +
    geom_bar(stat="identity") +
    geom_text(aes(label=Num), vjust=-0.3, size=3.5)+
    theme_minimal()+
    xlab("Year")+
    ylab("Police Reports")
  bar_graph
}
