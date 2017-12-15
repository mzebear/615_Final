#
# This shiny app is designed to utlize the package quantmod to show stock price and volume with the user
#  being able to select the style of chart
#
library(quantmod)

#Download  the stock and and retrn date
require_symbol <- function(symbol, envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
  }
  
  envir[[symbol]]
}


shinyServer(function(input, output) {
  
  #Create new environment
  symbol_env <- new.env()
  
  #using input from ui, make chart
  make_chart <- function(symbol) {
    symbol_data <- require_symbol(symbol, symbol_env)
    
    chartSeries(symbol_data,
                name      = symbol,
                type      = input$chart_type,
                subset    = paste(input$daterange, collapse = "::"),
                log.scale = input$log_y,
                theme     = "white")
  }
  
  output$plot_aapl <- renderPlot({ make_chart("AAPL") })
  output$plot_msft <- renderPlot({ make_chart("MSFT") })
  output$plot_amzn  <- renderPlot({ make_chart("AMZN")  })
  output$plot_googl <- renderPlot({ make_chart("GOOGL") })
  output$plot_intc <- renderPlot({ make_chart("INTC") })
  output$plot_IBM <- renderPlot({ make_chart("IBM") })
  output$plot_ORCL <- renderPlot({ make_chart("ORCL") })
  output$plot_TSLA <- renderPlot({ make_chart("TSLA") })
  output$plot_EA <- renderPlot({ make_chart("EA") })
  output$plot_fb <- renderPlot({ make_chart("FB") })
})