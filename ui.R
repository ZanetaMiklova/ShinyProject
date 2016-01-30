library(shiny)

shinyUI(pageWithSidebar(
     headerPanel("Linear Regression for Dataset IRIS"),
     sidebarPanel(
          p('Choose your option:'),
          selectInput("X", "Choose X:", choices = c('Sepal.Length'='Sepal.Length','Sepal.Width'='Sepal.Width', 'Petal.Length'='Petal.Length','Petal.Width'='Petal.Width'),selected = 'Petal.Width'),
          selectInput("Y", "Choose Y:", choices = c('Sepal.Length'='Sepal.Length','Sepal.Width'='Sepal.Width', 'Petal.Length'='Petal.Length','Petal.Width'='Petal.Width'), selected ='Petal.Length'),
          checkboxInput("bestModel", "Best model", value = TRUE, width = NULL),
          sliderInput("intercept",
                      "Intercept",
                      min = -7.2,
                      max = 9.1,
                      step=0.1,
                      value = 2.5),
          sliderInput("slope",
                      "Slope",
                      min = -1.74,
                      max = 2.3,
                      step=0.01,
                      value = 1.24),
          submitButton("Submit")
     ),
     mainPanel(
          h2("Message"),
          verbatimTextOutput("warnings"),
          plotOutput("distPlot"),
          h2("Your model"),
          p("Intercept"),
          verbatimTextOutput("interceptINT"),
          p("Slope"),
          verbatimTextOutput("slopeINT"),
          h2("Best Model"),
          verbatimTextOutput("interceptBEST"),
          verbatimTextOutput("slopeBEST")
          
     )
)
)