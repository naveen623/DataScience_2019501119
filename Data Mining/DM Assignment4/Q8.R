setwd("E:\\DataScience_2019501119\\Data Mining\\DM Assignment4")
library(class)

train <- read.csv("sonar_test.csv", header = FALSE)
test <- read.csv("sonar_test.csv", header = FALSE)

x_train = train[,1:60]
y_train = as.factor(train[,61])

x_test = test[,1:60]
y_test = as.factor(test[,61])

help("knn")
model1<-knn(x_train, x_test,y_train, k = 5) 
1 - sum(y_test == model1) / length(y_test)

model2<-knn(x_train, x_test, y_train, k = 6)
1 - sum(y_test == model2) / length(y_test) 
