ui <- fluidPage(
  
  sidebarPanel(width = 3,
               
               fluidRow(
                 column(6,offset=0,
                        div(style = "font-size: 8px;",      
                            selectInput(inputId = "size",
                                        label = "Tree Size",
                                        choices = c("All","Canopy","Subcanopy","Small"),
                                        selected = "All")
                )
                 ),
                 
                 column(6,offset=0,
                        div(style = "font-size: 8px;padding:0px;",
                            checkboxGroupInput(inputId = "labels",
                                               label = "Labels",
                                               choices = c("SPEC","Plot-End","Plot-Start"),
                                               selected = c("SPEC","Plot-End","Plot-Start")
                            )    
                        )
                 )
               ),
               
               fluidRow(
                 column(6,offset=0,
                        div(style = "font-size: 8px;",      
                            radioButtons(inputId = "data",
                                         label = "Data",
                                         choices = c("PSP Only","PSP + MAP"),
                                         selected = "PSP + MAP")
                        )    
                 ),
                 
                 column(2,offset=0,
                        div(style = "font-size: 8px;padding:0px;",  
                            radioButtons(inputId = "freq",
                                         label = "Frequency",
                                         choices = c(0.025,0.05),
                                         selected = 0.05)
                        )
                 )
               )
  )
  
  mainPanel(
    plotOutput(outputId = "plot")
  )
)

server <- function(input, output) {
  
  output$nms <- renderPlot({
    plot(runif(99),runif(99))
    
  })
  
}

shinyApp(ui = ui, server = server)