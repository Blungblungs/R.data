#2.4外部数据的导入
#1、导入spss数据
install.packages("foreign")
library(foreign)
data1<-read.spss("C:/Users/Administrator/Desktop/未标题1.sav",use.value.labels=T,to.data.frame=T);data1
#use.value.labels=T 将变量转化为因子，to.data.frame=T 将数据读入数据框中
#2、导入excel数据
install.packages("xlsx")
library(xlsx)
data2<-read.xlsx("C:/Users/Administrator/Desktop/总数据（新的）.xlsx",1,header=T,Encoding="UTF-8")
head(data2)
