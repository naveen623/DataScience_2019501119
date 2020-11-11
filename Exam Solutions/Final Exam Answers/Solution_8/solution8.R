<<<<<<< HEAD
setwd("E:\\DataScience_2019501119\\Exam Solutions\\Final exam")

d = read.csv("BSE_Sensex_Index.csv", header = TRUE)

View(d)
summary(d)
d$Date = as.Date(d$Date, format='%m/%d/%Y')

successive_difference <- function(x) {
  n = length(x)
  for (i in 1:(length(x))) {
    x[i] <- (x[i] - x[i + 1]) / x[i + 1]
  }
  x[length(x)] = (x[length(x) - 1] + x[length(x) - 2] + x[length(x) - 3]) / 3
  return(x)
}

d$successive_growth <- successive_difference(d$Close)


#calculating z-scores
sgrmean <- mean(d$successive_growth, na.rm=TRUE)
sgrsd <- sd(d$successive_growth,na.rm=TRUE)
z<-(d$successive_growth - sgrmean) / sgrsd
sort(z)
d$zscores <- z

#Dates of the outliers 
dates<-subset(d[,1],d[,"zscores"] >= 3.0 | d[,"zscores"] <= -3.0)
View(dates)

write.csv(dates,"Dates-Outliers.csv",quote = FALSE,row.names = TRUE)
||||||| 077398b
=======
setwd("E:\\DataScience_2019501119\\Exam Solutions\\Final exam")

d = read.csv("BSE_Sensex_Index.csv", header = TRUE)

View(d)
summary(d)
d$Date = as.Date(d$Date, format='%m/%d/%Y')

successive_difference <- function(x) {
  n = length(x)
  for (i in 1:(length(x))) {
    x[i] <- (x[i] - x[i + 1]) / x[i + 1]
  }
  x[length(x)] = (x[length(x) - 1] + x[length(x) - 2] + x[length(x) - 3]) / 3
  return(x)
}

d$successive_growth <- successive_difference(d$Close)


#calculating z-scores
sgrmean <- mean(d$successive_growth, na.rm=TRUE)
sgrsd <- sd(d$successive_growth,na.rm=TRUE)
z<-(d$successive_growth - sgrmean) / sgrsd
sort(z)
d$zscores <- z

#Dates of the outliers 
dates<-subset(d[,1],d[,"zscores"] >= 3.0 | d[,"zscores"] <= -3.0)
View(dates)

write.csv(dates,"Dates-Outliers.csv",quote = FALSE,row.names = TRUE)
>>>>>>> 96ea3af6caa430152316f102f878651b6d1a064d
