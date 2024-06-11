library(shiny)



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
  
  
  output$distPlot <- renderPlot({
    x    <- data[,input$download]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(data[,input$download],breaks = bins, main = paste(input$download),freq = F, xlab = "Values"); lines(density(data[,input$download]))
    
    
  })
  
  output$distPlot3 <- renderPlot({
    qqnorm(data[,input$download], main = paste(input$download))
    qqline(data[,input$download],col=2,lwd=2)
    if( input$somevalue == TRUE){ abline(h=median(data[,input$download]))
      abline(h=mean(data[,input$download]),col=4)
    }
    
    
  })
  output$distPlot4 <- renderPlot({
    boxplot(data[,input$download], horizontal = T, main = paste(input$download))
  })
  
  
  
  
}
