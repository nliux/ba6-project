library(shiny)
library(leaflet)
library(shinythemes)
library(ggvis)
library(leaflet)
library(shinyWidgets)





crime <- read.csv("data/data_map.csv", stringsAsFactors = FALSE)
crime_another <- read.csv("data/crime_modified.csv", stringsAsFactors = FALSE)

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
        "The data we picked to do for our final project is a data set of crime 
        in Seattle. This data represents crime reported to the Seattle Police
        Department (SPD). Each row contains the record of a unique event where
        at least one criminal offense was reported by a member of the community
        or detected by an officer in the field. This data contains offenses and
        offense categorization coded to simulate the standard reported to the
        FBI under the National Incident Based Reporting System (NIBRS) and used
        to generate Uniform Crime Report (UCR) summary statistics."
      ),
      titlePanel(h2("Why is this important")),
      p("This project answers some very important questions, such as:"),
      p("1. How does the distribution of specific types of crime change based
        on year and month?"),
      p("2. What are the crime rates for the different neighborhoods? Is crime
        increasing or decreasing as the years pass?"),
      p("3. What types of crimes are most common in which neighborhoods based
        on time of day?")
    ),
    tabPanel(
      "Seattle Crime Map",
      titlePanel(h1("A Map of Crimes in Seattle")),
      sidebarLayout(
        sidebarPanel(
          selectInput(
            inputId = "crime",
            label = "Crime:",
            choices = c(unique(crime$crime_category))
          ),
          selectInput(
            inputId = "month",
            label = "Month:",
            choices = list(
              "January" = 1,
              "February" = 2,
              "March" = 3,
              "April" = 4,
              "May" = 5,
              "June" = 6,
              "July" = 7,
              "August" = 8,
              "September" = 9,
              "October" = 10,
              "November" = 11,
              "December" = 12
            )
          ),
          selectInput(
            inputId = "year",
            label = "Year:",
            choices = c("2010", "2011", "2012", "2013","2014")
          )
        ),
        mainPanel(
          leafletOutput(outputId = "crime_map"),
          textOutput(outputId = "crime_txt")
        )
      )
    ),
    tabPanel(
      "Crime by Neighborhood",
      pageWithSidebar(
        headerPanel("Crime Statistics Over Time"),
        sidebarPanel(
          selectInput(
            "Neighborhood",
            label = "Select a Neighborhood",
            choices = as.list(unique(crime_another$Neighborhood))
          ),
          selectInput(
            "Crime_Subcategory", 
            label = "Select a Crime", 
            choices =  as.list(unique(crime_another$Crime.Subcategory)) 
          )
        ),
        mainPanel(plotOutput("plot"))
      )
    ),
    tabPanel(
      "Crime Related to Time",
      titlePanel(h1("Crime Based on Time of Day")),
      sidebarLayout(
        sidebarPanel(
          radioButtons(
            inputId = "radio",
            label = h3("Select a Time of Day"),
            choices = list(
              "Early Morning (12:00am - 6:00am)" = "Early Morning",
              "Morning (6:00am - 11:00am)" = "Morning",
              "Noon (11:00am - 2:00pm)" = "Noon",
              "Afternoon (2:00pm - 6:00pm)" = "Afternoon",
              "Night (6:00pm - 12:00am)" = "Night"
            ),
            selected = "Early Morning"
            )
        ),
        mainPanel(tableOutput("time"))
      )
    )
  )
)
shinyUI(my_ui)