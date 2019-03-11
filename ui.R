library(shiny)
library(leaflet)
library(shinythemes)
library(ggvis)
library(leaflet)

#s <- crimes[which(crimes$Year == "2014"), ]

#crimes[which(crimes$Year == "2010" & crimes$crime_category == "Assault"), "lat"]

# lintr::lint("ui.R")

# Create a UI
my_ui <- fluidPage(
  navbarPage(
    theme = "style.css",
    "Seattle Crimes",
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
            inputId = "in1",
            label = "Year:",
            choices = c("2010", "2011", "2012", "2013",
                        "2014")
          ),
            selectInput(
              inputId = "in2",
              label = "Crime:",
              choices = c("Vehicle Theft", "Assault")
            )
        
        ),
        mainPanel(
          leafletOutput(outputId = "crime_map")
        )
      )
    )
  )
)
shinyUI(my_ui)