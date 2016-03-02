library(plotly)
library(dplyr)

make_plot <- function(data,
      species,
      lengthOrWidth,
      sepalLengthRange,
      petalLengthRange,
      sepalWidthRange,
      petalWidthRange
) {
  if(lengthOrWidth == 'length') {
    plot_title <- paste("Sepal Length vs. Petal Length:", species)
    data <- data %>%
      filter(
        Species == species,
        Sepal.Length >= sepalLengthRange[1],
        Sepal.Length <= sepalLengthRange[2],
        Petal.Length >= petalLengthRange[1],
        Petal.Length <= petalLengthRange[2]
      ) %>%
      select(Sepal.Length, Petal.Length, Species)
    plot <- plot_ly(
      data = data, x = Sepal.Length, y = Petal.Length, mode = "markers") %>%
      layout(title = plot_title)
  } else {
    plot_title <- paste("Sepal Width vs. Petal Width:", species)
    data <- data %>%
      filter(
        Species == species,
        Sepal.Width >= sepalWidthRange[1],
        Sepal.Width <= sepalWidthRange[2],
        Petal.Width >= petalWidthRange[1],
        Petal.Width <= petalWidthRange[2]
      ) %>%
      select(Sepal.Width, Petal.Width, Species)
    plot <- plot_ly(
      data = data, x = Sepal.Width, y = Petal.Width, mode = "markers") %>%
      layout(title = plot_title)
  }
  
  return(plot)
}






