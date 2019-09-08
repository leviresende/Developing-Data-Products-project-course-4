library(shiny)

# Definition of UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamonds - Price predictor"),
  
  # Sidebar with the featerus of diamons
  sidebarLayout(
    sidebarPanel(
      helpText("Predicting a dimond price based on its features."),
      h3(helpText("Choose:")),
      # The number of carats
      numericInput("car", label = h4("Carats"), step = 0.02, value = 1),
      # A color of the diamond
      selectInput("col", label = h4("Color"),
                  choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                 "F" = "F", "G" ="G",
                                 "H" = "H", "I" = "I",
                                 "J" = "J")),
      # The type of cut
      selectInput("cut", label = h4("Cut"),
                  choices = list("Unknown" = "*", "Fair" = "Fair", "Good" = "^Good",
                                 "Very Good" = "Very Good", "Premium" = "Premium",
                                 "Ideal" = "Ideal")),
      # The type of clarity
      selectInput("clar", label = h4("Clarity"),
                  choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                 "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                 "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" ))
    ),
    
    # Build a plot with diamonds and regression line to predict the price
    mainPanel(
      plotOutput("distPlot"),
      h4("Value of this diamond is:"),
      h3(textOutput("result"))
    )
  )
))