library(shiny)
library(markdown)

shinyUI(navbarPage("Miles Per Gallon (MPG) Predictor",
                   tabPanel("Predictor",
                            sidebarLayout(
                              sidebarPanel(
                                h3('Input for the car'),
                                numericInput('wt', 'Weight (in 1000 lbs)', 0.5, min=0.5, max=10, step=0.1),
                                sliderInput('hp', 'Horsepower', 50,  min=50, max=500, step=10),
                                radioButtons('cyl', 'Number of Cylinders', c('4' = '4', '6' = '6', '8' = '8')),
                                radioButtons('am', 'Transmission Type', c('Automatic' = '0', 'Manual' = '1')),
                                submitButton('Submit')
                              ),
                              
                              mainPanel(
                                h4('Description'),
                                p('This Shiny application predicts the MPG of a car based on the following four parameters:'),
                                tags$ul(
                                  tags$li('Weight of the car (in 1000 lbs)'),
                                  tags$li('Horsepower of the car'),
                                  tags$li('Number of cylinders in the car (4, 6 or 8)'),
                                  tags$li('Transmission type of the car (Automatic or Manual)')
                                ),
                                
                                h4('How it works'),
                                tags$ul(
                                  tags$li('Input the four parameters of a car.'),
                                  tags$li('Click the Submit button.'),
                                  tags$li('The predicted MPG will be shown under "Predicted MPG".')
                                ),
                                
                                h4('Predicted MPG'),
                                verbatimTextOutput('mpg')
                              )
                            ))
                   
))
