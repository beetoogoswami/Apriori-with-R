rm(list = ls())

trans = read.transactions(file="Transactions.csv", format = "single", sep=",", cols = c(1,2)  )

summary(trans)
inspect(trans)

rules=apriori(trans,parameter = list(sup = 0.5, conf = 0.6,target="rules"))

inspect(rules)
####################################################################

data=read.csv("Pharmacovigilance_audit_Data.csv", sep = ",")
data=data[,-c(6)]
data

sapply(data,function(x)sum(is.na(x)))

data$Age <- cut(data$Age, c(0,7,14,21,28,35), right=FALSE, labels=c(0:4))

install.packages("DMwR")
library(DMwR)

data=knnImputation(data,k=10)

trans=as(data,"transactions")
trans

inspect(trans)

rule=apriori(trans, parameter = list(sup=0.05, conf=0.6, target="rules"))
rule
inspect(rule)

as(subset(rule, subset = rhs %in% "LocationID=Location2"),"data.frame")
