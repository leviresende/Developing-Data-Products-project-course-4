library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)

# Selection of the colums to analyze
diam <- diamonds[,c(1:4,7)]

# Definition of the server
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
    # Select diamonds depending of user input
    diam <- filter(diamonds, grepl(input$col, color), grepl(input$cut, cut), grepl(input$clar, clarity))
    # build linear regression model
    fit <- lm( price~carat, diam)
    # predicts the price
    pred <- predict(fit, newdata = data.frame(carat = input$car,
                                              cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar))
    # Plot using ggplot2
    plot <- ggplot(data=diam, aes(x=carat, y = price))+
      geom_point(aes(color = cut), alpha = 0.3)+
      geom_smooth(method = "lm")+
      geom_vline(xintercept = input$car, color = "red")+
      geom_hline(yintercept = pred, color = "green")
    plot
  })
  output$result <- renderText({

    diam <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
    fit <- lm( price~carat, diam)
    pred <- predict(fit, newdata = data.frame(carat = input$car,
                                              cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar))
    res <- paste(round(pred, digits = 1),"$" )
    res
  })
  
})