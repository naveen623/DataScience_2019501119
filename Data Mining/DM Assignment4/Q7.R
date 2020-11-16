install.packages("randomForest")
library("randomForest")

train <- read.csv("sonar_test.csv", header = FALSE)
test <- read.csv("sonar_test.csv", header = FALSE)

x_train = train[,1:60]
y_train = as.factor(train[,61])

x_test = test[,1:60]
y_test = as.factor(test[,61])

model<-randomForest(x_train, y_train)
1 - sum(y_train == predict(model, x_train)) / length(y_train)
