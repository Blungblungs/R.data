#2.5 数据的存储与读取
#2.5.1数据的存储
x<-rep(1:9)
y<-seq(2:10)
z<-data.frame(x,y)
setwd("C:/Users/Administrator/Desktop/数据分析师资料/数据")
#简单文件
write.table(z,"data1.txt",row.names=F,sep=" @@ ")
#csv文件
write.csv(z,"data1.csv",row.names=F)

#2.5.2 数据的读取
#raed.table()
X<-read.table("C:/Users/Administrator/Desktop/数据分析师资料/数据/牙膏.txt")
X  #默认 header=F
#读取Excel文件
#1、剪贴板
mydata<-read.delim("clipboard",sep="#")
fix(mydata)
?read.delim
#利用RODBC包
install.packages("RODBC")
library(RODBC)
datas<-odbcConnectExcel("美食商家列表信息采集.xlsx")


