library(shiny)
library(ggplot2)
source("res.R")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot

  bld_range <- reactive({res_blds[res_blds$SALE.PRICE.1 > input$range[1] &
                                  res_blds$SALE.PRICE.1 <= input$range[2], ]})


  output$distPlot <- renderPlot({
    x <- bld_range()

    # draw the histogram with the specified number of bins
    #hist(x$SALE.PRICE.1, col = 'skyblue', border = 'white')
    ggplot(x, aes(SALE.PRICE.1, fill=YEAR)) + geom_bar()
  })

  output$topTable <- renderDataTable({
    input$goButton
    df <- isolate({
      y <- res_blds[res_blds$SALE.PRICE.1 > input$range[1] &
                                  res_blds$SALE.PRICE.1 <= input$range[2], ]
      y <- y[with(y, order(-SALE.PRICE.1)),]
      if (input$goButton >= 1) data.frame(address = y$Location.1[1:10], price = y$SALE.PRICE.1[1:10])
      else data.frame()
    })
  })
})

