library(UsingR)
library(caret)
data(iris)

set.seed(1231)
inTrain <- createDataPartition(y=iris$Species,p=0.60,list=FALSE)
train <- iris[inTrain,]
test <- iris[-inTrain,]
modFit <- train(Species~.,data=iris,method="rf",verbose=FALSE)
predictedSpecies <- function(pw,sl,sw,pl)  
            as.character(predict(modFit,data.frame(Petal.Width=pw,Sepal.Length=sl, 
                              Sepal.Width=sw, Petal.Length=pl)))

shinyServer(
  function(input, output) {
      output$Sepal.Length <- renderPrint({paste("a", input$Sepal.Length)})
      output$Sepal.Width <- renderText({input$Sepal.Width})
      output$Petal.Length <- renderText({input$Petal.Length})
      output$Petal.Width <- renderPrint({input$Petal.Width})
  #    predictSpecies <- predictedSpecies(input$Petal.Width,input$Sepal.Length, 
  #                     input$Sepal.Width,input$Petal.Length)
      output$Species <- renderPrint({predictedSpecies(input$Petal.Width,input$Sepal.Length, 
                                input$Sepal.Width,input$Petal.Length)})
filename <- filename <- normalizePath(file.path('images','Iris_setosa.jpg'))
#output$Species <- renderPrint(filename)
      output$image1 <- renderImage({    

                    list(src = "images/Iris_setosa.jpg",
                    contentType = 'image/jpeg',
                    alt = "Iris photo here")
      }, deleteFile = FALSE)
})