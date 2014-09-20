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
      helpText("This example uses rnorm() for data generation."),
      helpText("Color Explorer Help"),
      helpText("The Chart Type drop-down is what type of chart is displayed. The Number of Bars/Slices control controls the number of elements displayed in the chart. The Color Theme drop-down controls what color theme to display. If you have any problems what-so-ever, you may contact technical support at michael@oflaherty.com.")
    ),
    
    # show the chart
    mainPanel(plotOutput("displayChart"),
              textOutput("data"))
  )
))