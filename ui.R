library(shiny)

# ===============================================================
# Author:      Michael O'Flaherty (michael@oflaherty.com)
# Create date: 9/19/2014
# ===============================================================

shinyUI(fluidPage(
  
  titlePanel("Color Explorer"),
  
  # create the sidebar with controls
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a chart type, number of bars/slices, and a color scheme:"),
      selectInput("chart", "Choose a chart type:", multiple = FALSE, 
                  choices = c("barplot", "pie")),
      sliderInput("bars",
                  "# of Bars/Slices:",
                  min = 1,
                  max = 50,
                  value = 25),
      selectInput("color", "Choose a color theme:", multiple = FALSE,
                  choices = c("cm", "heat", "rainbow", "terrain", "topo")),
      helpText("This example uses rnorm() for data generation.")
    ),
    
    # show the chart
    mainPanel(plotOutput("displayChart"),
              textOutput("data"))
  )
))