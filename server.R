library(shiny)

data(mtcars)

# Make cyl (number of cylinders) and am (0 = auto, 1 = manual) into factors
mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am)

# Predict MPG from
# - wt (weight in 1000 lbs)
# - hp (horsepower)
# - cyl (number of cylinders)
# - am (0 = auto, 1 = manual)

MPGModel <- lm(mpg ~ cyl + hp + wt + am, data = mtcars)

# predict(MPGModel, data.frame(wt=3, hp=3, cyl=as.factor(8), am=as.factor(1)))

shinyServer(function(input, output) {
  output$mpg <- renderText({
    wt <- input$wt
    hp <- input$hp
    cyl <- input$cyl
    am <- input$am
    
    newdf <- data.frame(
      wt = wt, hp = hp, cyl = cyl, am = am
    )
    MPGPredict <- predict(MPGModel, newdf)
    MPGPredict
  })
})
