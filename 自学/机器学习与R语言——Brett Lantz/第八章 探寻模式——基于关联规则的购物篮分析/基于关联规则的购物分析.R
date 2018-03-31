install.packages("arules")
library(arules)
gd=read.transactions("D:/R/我的资料集/自学/机器学习与R语言——Brett Lantz/第八章 探寻模式——基于关联规则的购物篮分析/数据/groceries.csv",sep=",")
summary(gd)
inspect(gd[1:5])
itemFrequency(gd[,1:3])

itemFrequencyPlot(gd,support=0.1)   #画出商品支持度的频率图。支持度至少大于10%
itemFrequencyPlot(gd,topN=20)   #商品数量在前20位前

image（gd[1:5])  #前5次交易的稀疏矩阵
image（sample(gd,100)) #

myrules=apriori(gd,parameter=list(support=0.006,confidence=0.25,minlen=2))#利用apriori制定规则
myrules

summary(myrules)
inspect(myrules[1:3])
inspect(sort(myrules,by="lift")[1:5])
getwd()
write(myrules,file="groceryrulesrules.csv",sep=",")