setwd("E:\\DataScience_2019501119\\Data Mining\\DM Assignment 5")
exams <- read.csv("spring2008exams.csv")
str(exams)
mean1 <- mean(exams$Midterm.1, na.rm = TRUE)
sd1 <- sd(exams$Midterm.1, na.rm = TRUE)
z_score <- (exams$Midterm.1 - mean1)/sd1
sort(z_score)