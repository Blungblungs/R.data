###第四章 基本数据管理


###4.1 一个例子
manager<-c(1,2,3,4,5)
date<-c("10/24/08","10//28/08","10/1/08","10/12/08","5/1/09")
country<-c("US","US","UK","UK","UK")
gender<-c("M","F","F","M","F")
age<-c(32,45,25,39,99)
q1<-c(5,3,3,3,2)
q2<-c(4,5,5,3,2)
q3<-c(5,2,5,4,1)
q4<-c(5,5,5,NA,2)
q5<-c(5,5,2,NA,1)
leadership<-data.frame(manager,date,country,gender,age,q1,q2,q3,q4,q5,stringsAsFactors = F) #创建数据框
leadership


###4.2 创建新变量
#1、
mydata<-data.frame(x1=c(2,2,6,4),x2=c(3,4,2,8))
mydata$sumx<-mydata$x1+mydata$x2
mydata$meanx<-(mydata$x1+mydata$x2)/2
#2、
attach(mydata)
mydata$sumx<-x1+x2
mydata$meanx<-(x1+x2)/2
detach(mydata)
#3、
mydata<-transform(mydata,sumx=x1+x2,meanx=(x1+x2)/2)
mydata


###4.3 变量的重编码
leadership$age[leadership$age == 99]  <-NA  #将99岁年龄值重编码为缺失值
leadership<-within(leadership,{
  agecat<-NA
  agecat[age>75]             <-"Elder"
  agecat[age>=55 & age<=75]  <-"Middle Aged"
  agecat[age<55]             <-"Young"                     
})                                    ##利用agecat 将年龄分为三个年龄段
leadership 


###4.4 变量的重命名
#将manager改为managerID ,test改为testDate
#1、利用fix()
fix(leadership)  #调用编辑器
#2、利用reshape包中的rename()函数
##install.packages("reshape")
library(reshape)
leadership<-rename(leadership,c(manager="managerID",date="testDate"))
#3、利用names()
names(leadership)
names(leadership)[2] <-"testDate"   #将第二个元素改变名称


###4.5 缺失值
#利用 is.na()  检验缺失值是否存在
is.na(leadership[,6:10])
##4.5.1 重编码某些值为缺失值
leadership$age[leadership$age == 99]  <-NA  #将99岁年龄值重编码为缺失值
##4.5.2 在分析中排除缺失值
#1、 
#利用na.rm=TRUE 移除缺失值
x<-c(1,2,NA,3)
y<-sum(x,na.rm = TRUE);y
#2、
#利用na.omit() 删除含缺失值数据的行
leadership
newdata<-na.omit(leadership)
newdata


###4.6 日期值
#利用as.Date() 将转化为数值形式存储日期变量。


###4.7 类型转换
#利用 is.datatype() 判断是什么类型的函数
a<-c(1,2,3)
is.numeric(a)
#利用 as.datatype() 转化为相应类型的函数
as.character(a)


###4.8 数据排序
#利用order()对一个数据框进行排序
newdata<-leadership[order(leadership$age),]  #按照年龄升序排序
newdata


###4.9 数据集的合并
#添加列 利用meage()、clind()
total<-merge(dataframeA,dataframeB,by="ID")  #将两按照ID进行合并
total<-clind(A,B)  #必须拥有相同的行数，同样顺序排列
#添加行 利用rbind() 
total<-rlind(A,B)


###4.10 数据集取子集
##4.10.1 选入数据
#从leadership数据框中选择了变量q1、q2、q3、q4和q5，并将它们保存到了数据框newdata中
newdata<-leadership[,c(6:10)]
newdata
##4.10.2 剔除数据
#1、
myvars<-names(leadership) %in% c("q3","q4")  #逻辑型向量
newdata <- leadership[!myvars]     　#利用！非将逻辑值反转，并剔除q3、q4
newdata
#2、
newdata <- leadership[c(-8,-9)]   #利用-（负号) 剔除数据
#3、
leadership$q3<-leadership$q4<- NULL   #将其设置为未定义。
##4.10.3 选入预测
#选择30岁以上的男性
newdata<-leadership[which(leadership$gender=="M" & leadership$age > 30),]
newdata
##4.10.4 subset()函数
newdata<-subset(leadership,age >= 35| age<24,select = c(q1,q2,q3,q4,q5))
#利用subset()函数 进行选择
##4.10.5 随机抽样
#利用sample()
mysample<-leadership[sample(1:nrow(leadership),3,replace=FALSE),]













