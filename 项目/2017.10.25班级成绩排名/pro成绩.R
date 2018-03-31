###数据说明###
#列名称分别表示 学号、姓名、德育分、智育分、体育分#
#行名称分别是各个学生信息#
setwd("D:/R/我的资料集/项目/2017.10.25班级成绩排名")
mydata<-read.csv("data成绩.csv",header = T)
head(mydata)
attach(mydata)

####对数据进行处理####

#1、求各个学生的平均成绩
mydata$mean<-apply(mydata[,4:6],1,mean);mydata #利用apply(),1代表按行计算
#2、按照平均成绩降序
mydata<-mydata[order(mydata$mean,decreasing = T),]   #利用order函数 进行排序
mydata$sort<-c(1:length(mydata$num)) ;mydata #生成排名的次序
class(mydata$allzhiyu)  #观察数据类型，为以后操作做铺垫
#3、得出获得奖学金的同学
mydata$award<-mydata$sort
mydata$award[mydata$sort<=5] <-"一等奖"   ;mydata$award
mydata$award[mydata$sort>5 & mydata$sort<=12] <-"二等奖"  ;mydata$award
mydata$award[mydata$sort>12& mydata$sort<=25] <-"三等奖"  ;mydata$award
mydata$award[mydata$sort>25] <-"再接再厉"   
mydata$award
#3、作德育分以及智育分的散点图
female<-subset(mydata,mydata$sex=="f")
plot(female$allzhiyu~female$alldeyu,data=female,col="red",pch=1,xlim=c(60,90),ylim=c(50,100))
male<-subset(mydata,mydata$sex=="m")
points(male$allzhiyu~male$alldeyu,data=male,col="blue",pch=16,xlim=c(60,90),ylim=c(50,100))
#4、作两者的线性回归直线
cor.test(allzhiyu,alldeyu)
lm1<-lm(allzhiyu~alldeyu,data=mydata)
summary(lm1)  #并进行回归系数检验、相关拟合分析、方程适合程度检验