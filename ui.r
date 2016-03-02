library(shiny)
library(dplyr)
library(stringr)

data <- iris
listOfSpecies <- as.character(unique(data$Species))
sepalLengthRange <- c(min(data$Sepal.Length), max(data$Sepal.Length))
petalLengthRange <- c(min(data$Petal.Length), max(data$Petal.Length))
sepalWidthRange <- c(min(data$Sepal.Width), max(data$Sepal.Width))
petalWidthRange <- c(min(data$Petal.Width), max(data$Petal.Width))

shinyUI(fluidPage(
  
  # Create a title
  titlePanel('Assignment 8: Iris Dataset with Shiny'),
  
  # Create sidebar layout
  sidebarLayout(
    
    # Side panel for controls
    sidebarPanel(
      radioButtons("species",
                   label = h3("Choose a Species"),
                   choices = str_to_title(listOfSpecies)
      ),
      
      radioButtons("lengthOrWidth",
                   label = h3("Pick: Length or Width"),
                   choices = list("Length" = 'length', "Width" = 'width')
      ),
      
      sliderInput("sepalLengthRange",
                  label = h3("Sepal.Length Range"),
                  min = sepalLengthRange[1], 
                  max = sepalLengthRange[2],
                  value = c(sepalLengthRange[1], sepalLengthRange[2]),
                  step = 0.1),
      
      sliderInput("petalLengthRange",
                  label = h3("Petal.Length Range"),
                  min = petalLengthRange[1], 
                  max = petalLengthRange[2],
                  value = c(petalLengthRange[1], petalLengthRange[2]),
                  step = 0.1),
      
      sliderInput("sepalWidthRange",
                  label = h3("Sepal.Width Range"),
                  min = sepalWidthRange[1], 
                  max = sepalWidthRange[2],
                  value = c(sepalWidthRange[1], sepalWidthRange[2]),
                  step = 0.1),
      
      sliderInput("petalWidthRange",
                  label = h3("Petal.Width Range"),
                  min = petalWidthRange[1], 
                  max = petalWidthRange[2],
                  value = c(petalWidthRange[1], petalWidthRange[2]),
                  step = 0.1)
    ),
    
    # Main panel: display plotly scatterplot
    mainPanel(
      plotlyOutput('plot')
    )
  )
))



