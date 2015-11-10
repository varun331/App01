library(shiny)

# Define server logic for slider examples
shinyServer(function(input, output) {
  
  # Reactive expression to compose a data frame containing all of
  # the values
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("V1", 
               "V2",
               "V3"),
      Values = as.character(c(input$integer,
                             input$integer1,
                             input$integer2
                             #paste(input$range, collapse=' '),
                             #input$format,
                             #input$animation
                             )), 
      stringsAsFactors=FALSE)
  }) 
  
  # Show the values using an HTML table
  output$value <- renderPrint({
   data <- as.numeric(c(input$integer,input$integer1,input$integer2))
   mean(data)
      })
 
  
})
change


