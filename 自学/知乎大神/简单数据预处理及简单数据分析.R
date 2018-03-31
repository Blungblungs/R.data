####一、数据预处理
#1、输入数据
mydata<-read.table("clipboard",header=T,sep='\t')   # 利用剪切板读取数据
View(mydata)  #显示数据

#2、重命名列名
names(mydata)<-c("time","cardno","drugID","drugName","saleNumber","virtualmoney","actualmoney")  

#3、处理数据类型
#install.packages("stringr")    #为了处理日期，安装stringr包
library(stringr)     
help("str_split_fixed") 
timesplit<-str_split_fixed(mydata$time," ",n=2)   #将日期分离成两列
head(timesplit)
mydata$time<-timesplit[,1]    #抽取分列的第一列作为time数据

mydata$time<-as.Date(mydata$time,"%Y-%m-%d")  #将字符类型转化为数值类型
class(mydata$time)
mydata$saleNumber<-as.numeric(mydata$saleNumber)    #转化为数值类型
mydata$virtualmoney<-as.numeric(mydata$virtualmoney)
mydata$actualmoney<-as.numeric(mydata$actualmoney)
class(mydata$saleNumber)  #检查是否成功更改

#4、进行排序
mydata<-mydata[order(mydata$time,decreasing = F),]  #按照销售时间对数据进行降序排序
help(order)

####二、数据分析
#（1）
月均消费次数=总消费次数/月份数
#利用duplicated函数去掉同一个人、同一天内的消费记录
kpi1<-



