library(shiny)
library(ggplot2) # used to plot ggplot2 graphs
##ui code begin here
ui <- fluidPage(
   h4("PLOT of MTCARS"),
  # sidebarPanel(
  #   selectInput('xCol', 'X', names(mtcars)),
  #   selectInput('yCol', 'Y', names(mtcars))),
  # 
  # Shows the plot in mainpanel
  mainPanel(plotOutput('plot',click = "clicks")),
  verbatimTextOutput("rt")
   )

  
### server side code begins here ###
server <- function(input, output, session){
# scatter plot the mtcars dataset - mpg vs hp
output$plot <- renderPlot({
    ggplot(data = mtcars, aes(x = mpg, y = hp)) +
      geom_point()
  })
## It prints selected points in main window
output$rt <- renderPrint({
  
  ss<- nearPoints(mtcars,input$clicks, "mpg", "hp")
  st= as.data.frame(ss)
  st
  })
                         
observeEvent(input$clicks,{showModal(modalDialog(
  
 plotOutput("plt2")
))
## It add plot to pop-up window.  
  output$plt2<-renderPlot({
    ##subsetting and changing to data frame
    ss<- nearPoints(mtcars,input$clicks, "mpg", "hp")
    st= as.data.frame(ss)
    st
    ggplot(data=st, aes(x = mpg, y = hp)) +
      geom_point()})
  })
  }
shinyApp(ui = ui, server = server)
  
