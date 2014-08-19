# server.R: example on project for product, server side
library(shiny)
library(datasets)

diet1 <- subset(ChickWeight,Diet==1 & Time==21, select=c(weight,Chick))
diet2 <- subset(ChickWeight,Diet==2 & Time==21, select=c(weight,Chick))
diet3 <- subset(ChickWeight,Diet==3 & Time==21, select=c(weight,Chick))
diet4 <- subset(ChickWeight,Diet==4 & Time==21, select=c(weight,Chick))

shinyServer(
    function(input, output) {
        output$dietGroup <- renderPrint({input$dietID})
        output$meanValue <- renderPrint({input$mean})
        
        datasetInput <- reactive({
            switch(input$dietID,
                   "diet 1" = diet1,
                   "diet 2" = diet2,
                   "diet 3" = diet3,
                   "diet 4" = diet4)
        })
        
        output$result <- renderPrint({
            dataset <- datasetInput()
            x <- mean(dataset$weight)
            print(x)
                       
        })       
                 
    }
          
)

