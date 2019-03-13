




crime_plot <- function(a,b) {
  crime_data <- read_csv("../data/Crime_Data.csv")
  
  Crime_Data_csv <- crime_data %>% 
    rename(Occurred_Time = "Occurred Time", Occurred_Date = "Occurred Date",
           Crime_Subcategory = "Crime Subcategory" )
  # selecting the colums we want to display and  changing 12/15/ 2015 to only year
  data_selct <- Crime_Data_csv %>% select(Neighborhood,Occurred_Date,Occurred_Time,
                                          Crime_Subcategory) %>% mutate(year =
                                                                          substring(Occurred_Date,7,10)) 
  
  #group_by Neighborhood,year,Crime_Subcategory since we want see the number of reported crime based on those colum
  sum_Occurred_Time<- data_selct %>% group_by(Neighborhood,year,Crime_Subcategory) %>% 
    count() %>% rename(Number_of_Occurred = "n") 
  
  # since the data have data since 1975, we made it where want just view data from 2015 to now
  search_by_crime_Neighborhood <- sum_Occurred_Time %>%  filter(year >= 2015) 
  
  crime_2015_2019 <- search_by_crime_Neighborhood %>% filter( Neighborhood == input$Neighborhood,
                                                              Crime_Subcategory == input$Crime_Subcategory)  
  
  ggplot(data=crime_2015_2019 , aes(x= year , y= Number_of_Occurred )) +
    geom_bar(stat="identity", fill = "coral4") +  
    labs(x = paste("The Years of", input$Crime_Subcategory, "Occurred in", input$Neighborhood), y = "Number of Time Occurred" , 
         title =  paste(" Number of ", input$Crime_Subcategory," Reported in ", input$Neighborhood, " between 2015 to 2019:",sep  = "" )) 
}