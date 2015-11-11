library(shiny)

# Define UI for slider demo application
shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Sliders"),
  
  # Sidebar with sliders that demonstrate various available
  # options
  sidebarLayout(
    sidebarPanel(
      # Simple integer interval
      sliderInput("integer", "Placement:",
                  min=0, max=5, value=50),
      
      sliderInput("integer1", "Campaign.Type:",
                  min=0, max=7, value=50),
      
      sliderInput("integer2", "Image.Type:",
                  min=0, max=19, value=50),
      
      sliderInput("integer3", "Receipe.Type:",
                  min=2, max=14, value=50),
     
       sliderInput("integer4", "CTA:",
                  min=1, max=16, value=50),
      
      sliderInput("integer5", "Emotional.or.Functional:",
                  min=1, max=2, value=500),
      
      sliderInput("integer6", "Month.1:",
                  min=1, max=12, value=50),
    
     sliderInput("integer7", "Day.of.Week:",
                  min=1, max=7, value=500),
     
     sliderInput("integer8", "Time.of.Day:",
                 min=1, max=6, value=500),
     
     sliderInput("integer9", "Word.Count:",
                 min=1, max=5, value=500),
     
     sliderInput("integer10", "Question:",
                 min=1, max=2, value=500),
     
     sliderInput("integer11", "Link:",
                 min=1, max=2, value=500),
     
     sliderInput("integer12", "Link.Count:",
                 min=1, max=3, value=500),
     
     sliderInput("integer13", "Blogger.Influencer:",
                 min=1, max=2, value=500),
     
     sliderInput("integer14", "Video:",
                 min=1, max=2, value=500),
     
     sliderInput("integer15", "Content:",
                 min=1, max=6, value=500), 
     
     sliderInput("integer16", "Cross.Platform:",
                 min=1, max=2, value=500)
     
      
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
    tableOutput("value")
      
    ) 
  )
))

# Decimal interval with step value
#sliderInput("decimal", "Decimal:",
#            min = 0, max = 1, value = 0.5, step= 0.1),


# Specification of range within an interval
#sliderInput("range", "Range:",
#            min = 1, max = 1000, value = c(200,500)),

# Provide a custom currency format for value display,
# with basic animation
#sliderInput("format", "Custom Format:",
#            min = 0, max = 10000, value = 0, step = 2500,
#            pre = "$", sep = ",", animate=TRUE),

# Animation with custom interval (in ms) to control speed,
# plus looping
#sliderInput("animation", "Looping Animation:", 1, 2000, 1,
#           step = 10, animate=
#             animationOptions(interval=300, loop=TRUE)) 