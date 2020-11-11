<<<<<<< HEAD
setwd("E:\\DataScience_2019501119\\Exam Solutions\\Final exam")
d = read.csv("Data.csv", header = TRUE);

View(d)
d$TID <- NULL
library(arules)

write.csv(d, "Frequent-Itemsets.csv", quote = FALSE, row.names = TRUE)
transactions = read.transactions("Frequent-Itemsets.csv", sep=',', rm.duplicates = TRUE)
inspect(transactions)

frequent_itemsets <- apriori(transactions, parameter = list(sup = 0.03, conf = 0.5,target="frequent itemsets"))

inspect(sort(frequent_itemsets)[1:15])

itemFrequencyPlot(transactions, topN = 5, col = "violet")
||||||| 077398b
=======
setwd("E:\\DataScience_2019501119\\Exam Solutions\\Final exam")
d = read.csv("Data.csv", header = TRUE);

View(d)
d$TID <- NULL
library(arules)

write.csv(d, "Frequent-Itemsets.csv", quote = FALSE, row.names = TRUE)
transactions = read.transactions("Frequent-Itemsets.csv", sep=',', rm.duplicates = TRUE)
inspect(transactions)

frequent_itemsets <- apriori(transactions, parameter = list(sup = 0.03, conf = 0.5,target="frequent itemsets"))

inspect(sort(frequent_itemsets)[1:15])

itemFrequencyPlot(transactions, topN = 5, col = "violet")
>>>>>>> 96ea3af6caa430152316f102f878651b6d1a064d
