###多元分析回归###
##实战案例
data<-read.table("C:/Users/Administrator/Desktop/牙膏.txt")
data
attach(data)
data1<-cbind(V4,V5,V6)
data1<-data.frame(data1)
colnames(data1)<-c("x1","x2","y")
lm.sol<-lm(y~x1+x2,data1)
summary(lm.sol)

