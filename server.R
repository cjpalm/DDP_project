library(UsingR)
library(caret)
library(randomForest)
library(e1071)
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
      output$Sepal.Length <- renderText({paste0("Sepal Length: ", input$Sepal.Length,sep="")})
      output$Sepal.Width <- renderText({paste0("Sepal Width: ",input$Sepal.Width,sep="")})
      output$Petal.Length <- renderText({paste0("Petal Length: ",input$Petal.Length,sep="")})
      output$Petal.Width <- renderText({paste0("Petal Width: ", input$Petal.Width,sep="")})
  #    predictSpecies <- predictedSpecies(input$Petal.Width,input$Sepal.Length, 
  #                     input$Sepal.Width,input$Petal.Length)
      output$Species <- renderText({paste0("Predicted Species: ",predictedSpecies(input$Petal.Width,input$Sepal.Length, 
                                input$Sepal.Width,input$Petal.Length))})
filename <- filename <- normalizePath(file.path('images','Iris_setosa.jpg'))
#output$Species <- renderPrint(filename)
      output$image1 <- renderImage({    
                    ps <-predictedSpecies(input$Petal.Width,input$Sepal.Length, 
                                          input$Sepal.Width,input$Petal.Length)
                    filename <-paste("images/Iris_",ps,".jpg",sep="")
                    list(src = filename,
                    contentType = 'image/jpeg',
                    alt = "Iris photo here")
      }, deleteFile = FALSE)
})