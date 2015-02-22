library(shiny)
require(reshape)
require(ggplot2)
require(plyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  data(Titanic)
  Titanicdata<-melt(Titanic)
  dataInput<-reactive({ddply(Titanicdata[Titanicdata$Sex == input$Sex & Titanicdata$Class == input$Class,],c("Age","Survived"),summarize,number=sum(value))})
    
  output$plot <- renderPlot({    
          ggplot(dataInput(),aes(x=Age,y=number,fill=Survived)) +geom_bar(stat = "identity") + scale_fill_hue(l=40) + xlab("Age") + ylab("Number of Passengers")
      
  })
  
  output$text<-renderText({
        paste("For a",input$Sex,"in",input$Class, "class, the probability of surviving Titanic voyage was", round((sum(dataInput()[dataInput()$Survived == "Yes",]$number)/sum(dataInput()$number)*100)),"%")        
    })   
  
})