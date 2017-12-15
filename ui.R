# Create UI, set up list of charts to be used, and set up chart style options of quantmod
shinyUI(pageWithSidebar(
  headerPanel("Stock Charts"),
  
  sidebarPanel(
    wellPanel(
      p(strong("List of Stocks to choose from")),
      checkboxInput(inputId = "stock_aapl",  label = "Apple (AAPL)",     value = TRUE),
      checkboxInput(inputId = "stock_msft",  label = "Microsoft (MSFT)", value = FALSE),
      checkboxInput(inputId = "stock_amzn",  label = "Amazon (AMZN)",    value = FALSE),
      checkboxInput(inputId = "stock_googl", label = "Google (GOOGL)",   value = TRUE),
      checkboxInput(inputId = "stock_intc",   label = "Intel (INTC))",     value = FALSE),
      checkboxInput(inputId = "stock_IBM",   label = "IBM (IBM)",     value = FALSE),
      checkboxInput(inputId = "stock_ORCL",   label = "Oracle (ORCL)",     value = FALSE),
      checkboxInput(inputId = "stock_TSLA",   label = "Tesla (TLSA)",     value = FALSE),
      checkboxInput(inputId = "stock_EA",   label = "Electronic Arts (EA)",     value = FALSE),
      checkboxInput(inputId = "stock_fb",   label = "Facebook (FB)",     value = FALSE)
       ),
    
    selectInput(inputId = "chart_type",
                label = "Chart type",
                choices = c("Candlestick" = "candlesticks",
                            "Matchstick" = "matchsticks",
                            "Bar" = "bars",
                            "Line" = "line")
    ),
    
    dateRangeInput(inputId = "daterange", label = "Date range \n (Must be at least 10 open market days)",
                   start = Sys.Date() - 30, end = Sys.Date()),
    
    checkboxInput(inputId = "log_y", label = "Trandform to log y axis", value = FALSE)
  ),
  
  mainPanel(
    conditionalPanel(condition = "input.stock_aapl",
                     div(plotOutput(outputId = "plot_aapl"))),
    
    conditionalPanel(condition = "input.stock_msft",
                     div(plotOutput(outputId = "plot_msft"))),
    
    conditionalPanel(condition = "input.stock_amzn",
                     div(plotOutput(outputId = "plot_amzn"))),
    
    conditionalPanel(condition = "input.stock_googl",
                     div(plotOutput(outputId = "plot_googl"))),
    
    conditionalPanel(condition = "input.stock_intc",
                     div(plotOutput(outputId = "plot_intc"))),
    
    conditionalPanel(condition = "input.stock_IBM",
                     div(plotOutput(outputId = "plot_IBM"))),
    
    conditionalPanel(condition = "input.stock_ORCL",
                     div(plotOutput(outputId = "plot_ORCL"))),
    
    conditionalPanel(condition = "input.stock_TSLA",
                     div(plotOutput(outputId = "plot_TSLA"))),
    
    conditionalPanel(condition = "input.stock_EA",
                     div(plotOutput(outputId = "plot_EA"))),
    
    conditionalPanel(condition = "input.stock_fb",
                     plotOutput(outputId = "plot_fb"))
    
  )
))