# ui.R: example on project for product, ui side
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Guess it!"),
    sidebarPanel(
        h5('One of the R build-in datasets, ChickWeight, recorded an experiment on the effect of diet on early growth of chicks'),
        h5('Chicks were divided into 4 diet groups and weighted at day 21' ),
        h5('Let us play a simple game to guess the mean value of each diet group'),
        h5('To start, choose diet group from first panel, guess mean value from second panel, then hit Sumit button (the actual mean value of your selected group will display)'),
        h5('Good luck and have fun!'),
        
        selectInput(inputId = "dietID",
                    label = "choose diet group",
                    choices = c("choose","diet 1", "diet 2", "diet 3", "diet 4"),
                    selectize=FALSE),
        selectInput(inputId = "mean",
                    label = "guess mean of the selected group",
                    choices = c("guess","177.75", "214.70", "270.3", "238.6"),
                    selectize=FALSE),
        submitButton('Submit')
                ),
    mainPanel(
        h4('You choose (dietGroup)'),
        verbatimTextOutput("dietGroup"),
        
        h4('You guess (meanValue)'),
        verbatimTextOutput("meanValue"),
        
        h4("The actual chick weight(mean) of your selected diet group is"),
        verbatimTextOutput("result")
                

)
))
