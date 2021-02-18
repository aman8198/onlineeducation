server <- function(input, output){
  
  
  output$education_plot<- renderPlot({
    ggplot(aman12, aes(x=aman12[[input$features]], y=aman12[[input$characters]], color = aman12$gender)) + geom_point(bins = input$bins) + geom_smooth()

  })
  
  output$histo_plot<- renderPlot({
   
 
    ggplot(aman12,aes(x=aman12[[input$traits]], color = aman12$education)) + 
  geom_histogram(bins = input$bins, fill = "white")  })
  
  output$predict<- renderPlot({
    library(rpart)
    library(rpart.plot)
    tree <- rpart(aman13[[input$data]] ~ aman13[[input$data1]] + aman13[[input$data2]])
    a<- data.frame(aman13[[input$data1]] == aman13[[input$data3]], aman13[[input$data2]] == aman13[[input$data4]])
    result <- predict(tree, a)
    print(result)
    rpart.plot(tree)
    
  })
}
