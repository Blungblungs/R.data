#4.3
n=100
R1<-rt(n,10)
R2<-rt(n,20)
R3<-rt(n,30)
R<-c(R1,R2,R3)
hist(R,xlim=c(min(R),max(R)),probability=T)
lines(density(R,bw=1),col="red")

#4.5
install.packages("DAAG")
library(DAAG)
data(tinting)
attach(tinting)
#(1)列联表
T<-table(sex,tint);T
#(2)并列柱状图
barplot(T,legend.text=attr(T,"dimnames")$sex
                ,beside=TRUE)
#（3）散点图  _不作要求
?tinting
plot(y=it,x=age)
lines(lowess(it~age),lwd=2)
rug(side=1,jitter(age,50))
rug(side=2,jitter(it,10))


layout(matrix(c(2,1,0,3),2,2,byrow=T),c(1,6),c(3,1))
layout.show(3)

par(mar=c(1,1,5,2))
plot(it~age,xlab="",ylab="")
lines(lowess(it~age),lwd=2)
rug(side=1,jitter(age,10))
rug(side=2,jitter(it,50))
title(main="tinting")

par(mar=c(1,2,5,1))
boxplot(it,axes=F)
title(ylab="it",line=0)

par(mar=c(3,1,1,2))
boxplot(age,horizontal=T,axes=F)
title(xlab="age",line=1)

#4)条件散点图
coplot(it~age|tint)

#5)条件散点图
coplot(it~age|tint*sex)

6)等高线图
 library(MASS)
z<-kde2d(it,csoa)
contour(z,col="red",drawlabels=FALSE,xlab="it",ylab="csoa")

#7)
d<-data.frame(age,it,csoa)
matplot(d,type="l",ylab="",main="matplot")



##########4.7
options(digits=4)
x<-rnorm(100,75,3);x
#1)
mean(x);var(x);sd(x);range(x);max(x)-min(x);IQR(x);cv=sd(x)/mean(x);cv

library("fBasics")   #注：B大写
skewness(x);kurtosis(x)

fivenum(x)

#2)
hist(x,breaks=8,prob=T,xlim=range(x),col="lightblue",main="normal distribution ,mean=75,sd=9")
lines(density(x),col="red",lwd=3)


  x<-sort(x)
  n<-length(x)
  y<-(1:n)/n
  m<-mean(x)
  s<-sd(x)
  plot(x,y,type="s",lwd=3,main="x的经验分布函数图")
  curve(pnorm(x,m,s),col="red",lwd=2,add=T)

qqnorm(x,main="QQ plot")
qqline(x,col="red")
  
#3)
stem(x)
boxplot(x)


#########4.8
id<-1:20
sex<-rep(c("F","M"),c(10,10))
age<-c(18,18,19,18,20,19,21,20,21,20,18,18,19,18,20,19,21,20,21,20)
height<-c(166,155,154,160,162,153,156,152,170,156,168,166,172,178,169,180,177,168,182,170)
weight<-c(54,58,50,47,46,48,50,49,57,52,61,55,63,68,59,65,59,56,69,61)
dat<-data.frame(id,sex,age,height,weight)

plot(weight~height,data=dat)           #1)
coplot(weight~height|sex,data=dat)     #2)
coplot(weight~height|age,data=dat)     #3)
coplot(weight~height|age*sex,data=dat)  #4)

##在王璐同学的作法上
#2)
par(mfrow=c(1,2))
plot(weight~height,data=subset(dat,sex=="F"),main="女生")
plot(weight~height,data=subset(dat,sex=="F"),main="男生")
#或者
par(mfrow=c(1,2),mar=c(4,4,0,0))
sex1<-sort(unique(sex))
for (i in 1:length(sex1)) plot(weight~height,data=subset(dat,sex==sex1[i]))

#3）
par(mfrow=c(2,2),mar=c(4,4,0,0))
age1<-sort(unique(age))
for (i in 1:length(age1)) plot(weight~height,data=subset(dat,age==age1[i]))

#4）
age1<-sort(unique(age))
sex1<-sort(unique(sex))
windows(800,400)
par(mfrow=c(2,4),mar=c(4,4,4,0))

for (i in 1:length(sex1)){
  for (j in 1:length(age1)){
   plot(weight~height,data=subset(dat,sex==sex1[i]&age==age1[j]),
        main=paste("sex=",sex1[i],"  ","age=",age1[j]))
   #dd<-subset(dat,sex==sex1[i]&age==age1[j]);print(dd)
  }
}


