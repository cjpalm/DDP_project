selibrary(UsingR)
library(caret)
data(iris)


set.seed(1231)
inTrain <- createDataPartition(y=iris$Species,p=0.60,list=FALSE)
train <- iris[inTrain,]
test <- iris[-inTrain,]
modFit <- train(Species~.,data=train,method="rf",verbose=FALSE)
varImp(modFit)
modFit2 <- train(Species~Petal.Width*Petal.Length,data=train,method="rf",verbose=FALSE)
confusionMatrix(predict(modFit,train),train$Species)
confusionMatrix(predict(modFit,test),test$Species)
confusionMatrix(predict(modFit2,train),train$Species)
confusionMatrix(predict(modFit2,test),test$Species)
confusionMatrix(predict(modFit,test),test$Species)$table