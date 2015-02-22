library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Ocean liner Titanic's passenger survival"),
  br(),
  p(em("The following graph and analysis is based on a data set that provides information on fate of passengers on the fatal maiden voyage of the ocean liner 'Titanic', summarized according to economic status (class), sex, age and survival.")),
  strong("Instructions for users"),br(),
  strong("1. Use the right panel to select sex and economic status (class)",style = "color: blue;"),br(),
  strong("2. Based on your selection, the app would first show the probability of survival on Titanic ship for the demographic selected. This is shown in red text",style = "color: blue;"),br(),
  strong("3. In addition, the bar plot would show the distribution of survival across Ages for the selected demographic",style = "color: blue;"),br(),
  br(),
  br(),
  # Sidebar with a slider input for the number of bins
  sidebarLayout(position = "right",
    sidebarPanel(     
      selectInput("Sex","Sex",choices = c("Male","Female"),selected = "Male"),
      selectInput("Class","Economic Status (Class)",choices = c("1st","2nd","3rd","Crew"),selected = "1st")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        strong(textOutput("text"),style = "color: red; font-si20pt",align='center'),
        plotOutput("plot")
    )
  )
))