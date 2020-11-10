setwd("E:\\DataScience_2019501119\\Exam Solutions\\Final exam")

data = read.csv("BSE_Sensex_Index.csv", header = TRUE)

View(data)
summary(data)

data$Date = as.Date(data$Date, format='%m/%d/%Y')
%c(data$Date)

randomRows = function(df,n){
  return(df[sample(nrow(df),n, replace = TRUE),])
}

successive_diff <- function(x) {
  n = length(x)
  for (i in 1:(length(x))) {
    x[i] <- (x[i] - x[i + 1]) / x[i + 1]
  }
  x[length(x)] = (x[length(x) - 1] + x[length(x) - 2] + x[length(x) - 3]) / 3
  return(x)
}

data$Date <- NULL

data$open_new <- successive_diff(data$Open)
data$high_new <- successive_diff(data$High)
data$low_new <- successive_diff(data$Low)
data$close_new <- successive_diff(data$Close)
data$volume_new <- successive_diff(data$Volume)
data$Adj.close_new <- successive_diff(data$Adj.Close)

set.seed(123)

data_1000 = randomRows(data, 1000)
summary(data_1000)
data_3000 = randomRows(data, 3000)
summary(data_3000)
......................................
mean(data_1000$open_new)
mean(data_1000$high_new)
mean(data_1000$low_new)
mean(data_1000$close_new)
mean(data_1000$volume_new)
mean(data_1000$Adj.close_new)

var(data_1000$open_new)
var(data_1000$high_new)
var(data_1000$low_new)
var(data_1000$close_new)
var(data_1000$volume_new)
var(data_1000$Adj.close_new)

max(data_1000$open_new)
max(data_1000$high_new)
max(data_1000$low_new)
max(data_1000$close_new)
max(data_1000$volume_new)
max(data_1000$Adj.close_new)

quantile(data_1000$open_new,0.25)
quantile(data_1000$high_new,0.25)
quantile(data_1000$low_new,0.25)
quantile(data_1000$close_new,0.25)
quantile(data_1000$volume_new,0.25)
quantile(data_1000$Adj.close_new,0.25)

mean(data_3000$open_new)
mean(data_3000$high_new)
mean(data_3000$low_new)
mean(data_3000$close_new)
mean(data_3000$volume_new)
mean(data_3000$Adj.close_new)

var(data_3000$open_new)
var(data_3000$high_new)
var(data_3000$low_new)
var(data_3000$close_new)
var(data_3000$volume_new)
var(data_3000$Adj.close_new)

max(data_3000$open_new)
max(data_3000$high_new)
max(data_3000$low_new)
max(data_3000$close_new)
max(data_3000$volume_new)
max(data_3000$Adj.close_new)

quantile(data_3000$open_new,0.25)
quantile(data_3000$high_new,0.25)
quantile(data_3000$low_new,0.25)
quantile(data_3000$close_new,0.25)
quantile(data_3000$volume_new,0.25)
quantile(data_3000$Adj.close_new,0.25)

mean(data$open_new)
mean(data$high_new)
mean(data$low_new)
mean(data$close_new)
mean(data$volume_new)
mean(data$Adj.close_new)

var(data$open_new)
var(data$high_new)
var(data$low_new)
var(data$close_new)
var(data$volume_new)
var(data$Adj.close_new)

max(data$open_new)
max(data$high_new)
max(data$low_new)
max(data$close_new)
max(data$volume_new)
max(data$Adj.close_new)

quantile(data$open_new,0.25)
quantile(data$high_new,0.25)
quantile(data$low_new,0.25)
quantile(data$close_new,0.25)
quantile(data$volume_new,0.25)
quantile(data$Adj.close_new,0.25)
# They appear to be very similar

boxplot(data$Open, data$High, data$Low, data$Adj.close, data$Close)
hist(data$Close, freq = TRUE, w = 2000)
