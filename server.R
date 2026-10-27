
library(shiny)

server <- function(input, output, session) {
  
  # Train a regression model using real built-in data
  model <- lm(
    mpg ~ wt + hp + factor(cyl),
    data = mtcars
  )
  
  # Calculate the predicted fuel efficiency
  predicted_mpg <- reactive({
    
    new_car <- data.frame(
      wt = input$wt,
      hp = input$hp,
      cyl = factor(
        as.character(input$cyl),
        levels = c("4", "6", "8")
      )
    )
    
    as.numeric(predict(model, newdata = new_car))
  })
  
  # Display the prediction
  output$prediction <- renderText({
    
    paste(
      "Estimated Fuel Efficiency:",
      round(predicted_mpg(), 2),
      "MPG"
    )
  })
  
  # Compare prediction with average observed MPG
  output$comparison <- renderPlot({
    
    averages <- tapply(
      mtcars$mpg,
      mtcars$cyl,
      mean
    )
    
    values <- c(
      averages[c("4", "6", "8")],
      predicted_mpg()
    )
    
    barplot(
      values,
      names.arg = c(
        "4 cylinders",
        "6 cylinders",
        "8 cylinders",
        "Your prediction"
      ),
      main = "Fuel Efficiency Comparison",
      ylab = "Miles Per Gallon (MPG)",
      col = c("skyblue", "skyblue", "skyblue", "orange"),
      ylim = c(0, max(values) * 1.2)
    )
  })
}
