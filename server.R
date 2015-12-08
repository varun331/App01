library(shiny)
# Define server logic for slider examples
shinyServer(function(input, output) {
  rw <- read.csv("~/Documents/R Projects/McCormick.csv",header=T)
  rw2 <- subset(rw,rw$ER<5)
  rw4 <- rw2[,c(8,10,12,14,16,18,21,23,27,29,34,36,38,40,42,44,46,48)]
  dat <- rw4[,c(1:18)]
  dat <- na.omit(dat)
  for (i in 1:18){dat[,c(i)] <- as.numeric(dat[,c(i)])}
  set.seed(2)
  sub <- sample(nrow(dat),floor(nrow(dat)*.5))
  train <- dat[sub,]
  library(survival)
  library(lattice)
  library(parallel)
  library(splines)
  library(gbm)
  set.seed(1)
  boost.train=gbm(ER~.,data=train,distribution = "gaussian",
                  n.trees=5000)  
  # Reactive expression to compose a data frame containing all of
  # the values
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("Placement", 
               "Campaign.Type",
               "Image.Type",
               "Receipe.Type",
               "CTA",
               "Emotional.or.Functional",
               "Month.1",
               "Day.of.Week",
               "Time.of.Day",
               "Word.Count",
               "Question",
               "Link",
               "Link.Count",
               "Blogger.Influencer",
               "Video",
               "Content",
               "Cross.Platform"),
      Values = as.character   (c(input$integer,
                             input$integer1,
                             input$integer2,
                             input$integer3,
                             input$integer4,
                             input$integer5,
                             input$integer6,
                             input$integer7,
                             input$integer8,
                             input$integer9,
                             input$integer10,
                             input$integer11,
                             input$integer12,
                             input$integer13,
                             input$integer14,
                             input$integer15,
                             input$integer16
                             #paste(input$range, collapse=' '),
                             #input$format,
                             #input$animation
                             )), 
      stringsAsFactors=FALSE)
  }) 
  
  # Show the values using an HTML table
  output$value <-   renderPrint ({ 
   test1 <- data.frame (c(input$integer,
                          input$integer1,
                          input$integer2,
                          input$integer3,
                          input$integer4,
                          input$integer5,
                          input$integer6,
                          input$integer7,
                          input$integer8,
                          input$integer9,
                          input$integer10,
                          input$integer11,
                          input$integer12,
                          input$integer13,
                          input$integer14,
                          input$integer15,
                          input$integer16
                        ))
   test1 <- t(test1)
   test1 <- data.frame(test1)
   rownames(test1) <- c(1)
   colnames(test1) <-c ("Coded.Placement",
                        "Coded.Campaign.Type",
                        "Coded.Image.Type",
                        "Coded.Recipe.Type",
                        "Coded.CTA",
                        "Coded.Emotional.or.Functional",
                        "Month.1",
                        "Coded.Day.of.Week",
                        "Coded.Time.of.Day",
                        "Coded.Word.Count",
                        "Coded.Question",
                        "Coded.Link",
                        "Coded.Link.Count",
                        "Coded.Blogger...Influencer",
                        "Coded.Video",
                        "Coded.Content",
                        "Coded.Cross.Platform")
   yhat.boost <- predict(boost.train,newdata = test1,n.trees = 5000)
   print(yhat.boost)
   
  })
 
  
  
  
  
})  


