# This is a function which generates a plot based on crime and neighborhood.
crime_plot <- function(a,b) {
  crime_data <- read.csv("data/crime_modified.csv")
  
  # selecting the colums we want to display and  changing 12/15/ 2015 to only year
  data_selct <- crime_data %>% select(Neighborhood,Occurred.Date,Occurred.Time,
                                          Crime.Subcategory, Year)
  
  #group_by Neighborhood,year,Crime_Subcategory since we want see the number of reported crime based on those colum
  sum_Occurred_Time<- data_selct %>% group_by(Neighborhood,Year,Crime.Subcategory) %>% 
    count() %>% rename(Number_of_Occurred = "n") 
  
  # since the data have data since 1975, we made it where want just view data from 2015 to now
  search_by_crime_Neighborhood <- sum_Occurred_Time %>%  filter(Year >= 2015) 
  
  crime_2015_2019 <- search_by_crime_Neighborhood %>% filter( Neighborhood == a,
                                                              Crime.Subcategory == b)  
  
  ggplot(data=crime_2015_2019 , aes(x= Year, y= Number_of_Occurred)) +
    geom_bar(stat="identity", fill = "coral4") +  
    labs(x = "Year", y = "Number of Occurrences" , 
         title =  paste(" Number of ", b," Reported in ", a, sep  = "" )) 
}