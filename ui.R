library(shiny)
library(leaflet)
library(shinythemes)
library(ggvis)
library(leaflet)
library(shinyWidgets)

top_left <- "http://shimlaw.ca/wp-content/uploads/2018/05/Assault-Battery.jpg"
top_right <- "http://cliparts.co/cliparts/pi5/rL8/pi5rL87KT.gif"
bottom_left <- "http://nationalbuzz.in/wp-content/uploads/2016/06/car-chori-1024x720.jpg"

bottom_right <- "https://www.reviews.org/app/uploads/2018/01/theft-e1523389451321.jpg"


tags$head(
  tags$link(href="app.css", rel="stylesheet", type="text/css")
)

crime <- read.csv("data/data_map.csv", stringsAsFactors = FALSE)
crime_another <- read.csv("data/crime_modified.csv", stringsAsFactors = FALSE)

my_ui <- fluidPage(
  navbarPage(
    theme = "style.css",
    "Seattle Crimes",
    tabPanel("HOME",
            # setBackgroundImage(src = "https://giphy.com/gifs/seattle-6OVesXvDu88Ra/fullscreen")
            tags$div(class = "landing-wrapper",
                     tags$div(class= "landing-block background-content",
                              # top left
                              img(src=top_left),
                              
                              # top right
                              img(src=top_right),
                              
                              # bottom left
                              img(src=bottom_left), 
                              
                              # bottom right
                              
                              img(src=bottom_right)
                     )
            ),
            tags$div(class="landing-block foreground-content",
                     tags$div(class="foreground-text",
                              tags$h1("Welcome"),
                              tags$p("This shiny app demonstrates
                                     how to create a 2 x 2 layout
                                     using css grid and
                                     overlaying content."),
                              tags$p("Isn't this cool?"),
                              tags$p("Yes it is!")
                              )
                     )
            ),
    tabPanel("Crime by Neighborhood  ",
             #setBackgroundColor("azure"),  
             # Sidebar with a slider input for number of bins 
             pageWithSidebar(
               headerPanel("crime demographics in Seattle"),
               sidebarPanel(
                 selectInput("Neighborhood",label = "Select a Neighborhood", 
                             choices = as.list(unique(crime_another$Neighborhood))
                             
                 ),
                 selectInput("Crime_Subcategory", label = "Select a Crime", 
                             choices =  as.list(unique(crime_another$Crime.Subcategory)) 
                 )
               ),
               mainPanel(
                 plotOutput("plot")
               )
             ),
             # A paragraph with a hyperlink to the data source http://gabriel-zucman.eu/usdina/
             p("Source:", a(href = "http://gabriel-zucman.eu/usdina/", "http://gabriel-zucman.eu/usdina/"))
    ),
    tabPanel(
      "Introduction",
      titlePanel(h1("Seattle Crime Report")),
      mainPanel(
        imageOutput("img1")
      ),
      titlePanel(h2("Summary of the Data")),
      
      p(
        "The data we picked to do for our final project is a data set of crime in Seattle. 
        This data represents crime reported to the Seattle Police Department (SPD). 
        Each row contains the record of a unique event where at least one criminal offense 
        was reported by a member of the community or detected by an officer in the field. 
        This data contains offenses and offense categorization coded to simulate the standard 
        reported to the FBI under the National Incident Based Reporting System (NIBRS) and used 
        to generate Uniform Crime Report (UCR) summary statistics."
      ),
      titlePanel(h2("Why is this important")),
      p(
        "This project answers some very important questions, such as 
        1. Based on the dataset, what locations/neighborhoods have had the most crime over the time period?
        2. Based on the dataset, what crimes are most common in which neighborhoods?
        3. Based on the dataset, what are the crime rates for the different neighborhoods? Is crime increasing or decreasing?"
      )
    ),
    tabPanel(
      "Seattle Crime Map",
      titlePanel(h1("A Map of Crimes in Seattle")),
      sidebarLayout(
        sidebarPanel(
          selectInput(
            inputId = "year",
            label = "Year:",
            choices = c("2010", "2011", "2012", "2013",
                        "2014")
          ),
          selectInput(
            inputId = "crime",
            label = "Crime:",
            choices = c(unique(crime$crime_category))
          ),
          selectInput(
            inputId = "month",
            label = "Month:",
            choices = c(1:12)
          )
        
        ),
        mainPanel(
          leafletOutput(outputId = "crime_map")
        )
      )
    ),
    tabPanel(
      "Crime Rates",
      titlePanel(h1("Crime Rates in recent years")),
      sidebarLayout(
        sidebarPanel(
          selectInput(
            inputId = "in3",
            label = "Neighborhood:",
            choices = c(unique(crime_another$Neighborhood))
          ),
          p(
            "put something here"
          )
          ),
        mainPanel(
          plotOutput("third")
        )
      )
    )
  )
)
shinyUI(my_ui)