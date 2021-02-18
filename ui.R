library(shiny)
library(shinydashboard)
library(ggplot2)

ui <- dashboardPage( skin = "green",
  
  dashboardHeader(title = "Online Education"),
  dashboardSidebar(
    sidebarMenu(
      sliderInput("bins", "Number of bins", min = 1, max = 310, value = 100),
    menuItem("data analysis", tabName = "dataanalysis"), 
    menuSubItem("scatter plot", tabName = "scatter"),
    menuSubItem("histogram", tabName = "histogram"),
    menuItem("predictions", tabName = "decisiontree")
    
  )
  ),
  dashboardBody(
    
    tabItems(
      tabItem( tabName = "dataanalysis",
               h1("press tab of scatter plot for scatter plot analysis of data"),
               h2("press tab of histogram for histogram analysis")
        
        
             ),
      tabItem(tabName = "scatter",
              h1("scatter"),
              
              fluidRow(
                box(plotOutput("education_plot"), width = 8),
                box(
                  selectInput("features", "Xlabel:", c("powercut","hour","device.hunged","answering.question", "completing.assignment","submitting.assignment","understanding.online","lab.problem")), width = 4
                ),
                box(
                  selectInput("characters", "Ylabel:", c("powercut","hour","device.hunged","answering.question", "completing.assignment","submitting.assignment","understanding.online","lab.problem")), width = 4
                )
                
                ) 
              
              ),
      
      tabItem(tabName = "histogram",
              h2("histogram"),
              fluidRow(
               
                box(plotOutput("histo_plot"), width = 8),
                box(
                  selectInput("traits", "Features:", c("powercut","hour","device.hunged","answering.question", "completing.assignment","submitting.assignment","understanding.online","lab.problem")), width = 4
                )
              )
              ),
      tabItem(
        
        tabName = "decisiontree",
        h2("predictions"),
        box(plotOutput("predict"), width = 8),
        box(
          selectInput("data", "Types:", c("hour", "phi.ear", "phi.eye", "phi.joint", "phi.obesity"))
        ),
        box(
          selectInput("data1", "Types1:", c("hour", "phi.ear", "phi.eye", "phi.joint", "phi.obesity"))
          
        ),
        
        box(
          selectInput("data2", "Types2:", c("hour", "phi.ear", "phi.eye", "phi.joint", "phi.obesity")) 
        ),
        
        box(
          selectInput("data3", "Types3", c("yes", "no"))
        ), 
        
        box(
          selectInput("data4", "Types4", c("yes", "no"))
        )
      )
    )
    
  )
)
    
   
  
  
