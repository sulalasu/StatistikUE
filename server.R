library(shiny)
source("functions.R", local = TRUE)


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
  datensatz <- reactive({
    switch(input$download)
  })
  
  
  data = data.frame(swiss)
  df <- swiss
  i= 1
  for (k in df){
    mycols <- colnames(df)
    i<-i+1
  }
  #plot histogram unsing function
  output$histPlot <- renderPlot(
  {
    plotting_histogram(data, input$download, input$bins)
  })

  #QQ Plot
  output$distPlot3 <- renderPlot({
    qqnorm(data[,input$download], main = paste(input$download))
    qqline(data[,input$download],col=2,lwd=2)
    if( input$somevalue == TRUE){ abline(h=median(data[,input$download]))
      abline(h=mean(data[,input$download]),col=4)
    }
  })
  
  #Boxplot
  output$distPlot4 <- renderPlot({
    boxplot(data[,input$download], horizontal = T, main = paste(input$download))
  })
  
  
  
  
}
