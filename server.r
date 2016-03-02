library(shiny)
source('make_plot.r')

# Save iris data into variable
data <- iris

shinyServer(function(input, output) {
  # Create a map via your build_map function
  output$plot <- renderPlotly({
    make_plot(data,
              tolower(input$species),
              input$lengthOrWidth,
              input$sepalLengthRange,
              input$petalLengthRange,
              input$sepalWidthRange,
              input$petalWidthRange
    )
  })
})





