setwd("E:\\DataScience_2019501119\\Data Mining\\DM Assignment4")
getwd()

train = read.csv("sonar_train.csv",header = FALSE)
test = read.csv("sonar_test.csv",header = FALSE)
summary(train)
dim(train)
summary(test)
dim(test)

library(rpart)
library(rpart.plot)
help("rpart.control")
help("rpart.plot")
x <- train[,1:60]
y <- as.factor(train[,61])
model <- rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))
rpart.plot(model, box.palette="RdBu", shadow.col="gray", nn=TRUE)

x_test <- test[,1:60]
y_test <- as.factor(test[,61])
1 - sum(y_test == predict(model,x_test,type = "class")) / length(y_test)
