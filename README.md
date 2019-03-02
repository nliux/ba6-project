# ba6-project

## Project Description
The data from this project was aquired from the [City of Seattle Open Data Portal](https://data.seattle.gov/), we have selected the [Crime Data](https://data.seattle.gov/Public-Safety/Crime-Data/4fs7-3vj5) record provided bt the _Seattle Police Department_. The data represents crime reported to the _Seattle Police Department_ and was updated frequently, recorded data all the way from _1975_ to recent years. The record contains _515,000_ rows with _11_ columns, each providing useful information to help create this project. The data will be read directly from a CSV file downloaded from [City of Seattle Open Data Portal](https://data.seattle.gov/).

There are multiple target audiences for our project. Government officials, the SPD, real estate agents, Seattle residents, and people who are interested in moving to Seattle are all examples of people who would be able to utilize our project. Specifically, someone who is interested in moving to Seattle would want to know about the different neighborhoods and which one is the safest. They would be able to compare neighbordhood crime rates and see what kind of crime is the most common.

1) Based on the dataset, what locations/neighborhoods have had the most crime over the time period?

2) Based on the dataset, what crimes are most common in which neighborhoods?

3) Based on the dataset, what are the crime rates for the different neighborhoods? Is crime increasing or decreasing?

### Summary

### Audience

### Questions answered

## Technical Description
### About the Data


For this project, we will need to work on reshaping and reformating the raw data. More specifically, we will need to use both techniques to turn some specific columns in the dataset to readable data and abandon some columns that are not so useful, for example, the _report number_. 

### Libraries
We will be using provided packages in `R` as well as some useful functions, if apply, in `SQL`. 
These libraries from `R` might be used in this project:
- `tidyr`: Help flatten the data.
- `Google Map API`: Generate crime report based on locations.
- `ggplot2`: Create visualizations.
- `plotly`: Create visualizations.

### Challenges
The first major challenge would be how to convert this dataset to an _interactive map_. It might require work with joining other datasets from provided by [City of Seattle Open Data Portal](https://data.seattle.gov/), or the use of _[Google Map's API](https://developers.google.com/maps/documentation/). Other challenges will be how to choose between which crime activity we want to focus the most and how are we going to represent it in graph. The dataset is really large so it might take time to process, but not big enough to use cloud services like `Azure`.
