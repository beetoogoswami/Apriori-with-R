rm(list = ls())

setwd("C:/Users/PC/Desktop/Data Science - Ayub/Lab Activity/Flight_dealy_Apriori_Algo")

flight=read.csv("FlightDelays.csv", sep = ",", header = T)

sapply(flight, function(x)sum(is.na(x)))

a=flight[,-c(1)]

flight[,-c(1)]=data.frame(apply(a, 2, function(x){as.factor(x)}))



flight$CRS_DEP_TIME <- cut(flight$CRS_DEP_TIME, c(0,600,1200,1800,2400), right=FALSE, labels=c(0:3))

data$CRS_DEP_TIME


install.packages("arules")
library(arules)

trans=as(flight,"transactions")
trans
summary(trans)
inspect(trans)


rule=apriori(trans,parameter = list(supp=0.5, conf=0.6, target="rules") )
summary(rule)
inspect(rule)

rule_apriori=inspect(rule)

Rule.classfilter1 <- as(subset(rule, subset = rhs %in%
                                 "Flight.Status=0"),"data.frame")
Rule.classfilter1
