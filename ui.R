library(shiny)
library(shinyapps)
source("res.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Property Info for Cambridge:"),

  # Sidebar with a slider input for the number of bins
  # min_price = res_blds$SALE.PRICE.1[which.min(res_blds$SALE.PRICE.1)],
  # max_price = res_blds$SALE.PRICE.1[which.max(res_blds$SALE.PRICE.1)],
  sidebarLayout(
    sidebarPanel(
      sliderInput("range",
                  "Sale Price:",
                  min = 0,
                  max = 1200000,
                  value = c(300000, 700000)),
      actionButton("goButton", "Go!")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      dataTableOutput("topTable")
    )
  )
))

