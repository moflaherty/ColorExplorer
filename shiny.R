library(shiny)

# ===============================================================
# Author:      Michael O'Flaherty (michael@oflaherty.com)
# Create date: 9/19/2014
# ===============================================================

shinyServer(function(input, output) {
  
  # get the data
  dataset <- rnorm(50, mean=5, sd=2)
  
  output$displayChart <- renderPlot({
    n <- input$bars
    c <- switch(input$color,
                "rainbow" = rainbow(n),
                "heat"    = heat.colors(n),
                "terrain" = terrain.colors(n),
                "topo"    = topo.colors(n),
                "cm"      = cm.colors(n))
    
    if (input$chart == 'pie') {
      pie(seq(1:n), col=c)
    }
    else {
      barplot(dataset[0:n], col=c)
    }
  })
  
  output$data <- renderText({
    dataset[0:input$bars]
  })
})