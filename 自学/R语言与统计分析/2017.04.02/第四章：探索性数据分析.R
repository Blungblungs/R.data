#4.1常用概率函数图（密度曲线图）
#二项分布
n<-20
p<-0.2
k<-seq(0,n)
plot(k,dbinom(k,n,p),type='h',main='Binomial distribution,n=20,p=0.2',xlab='k')

#泊松分布
lambda<-4.0
k<-seq(0,20)
plot(k,dpois(k,lambda),type='h',main='Poissom distribution',lambda=4.0,xlab='k')

#正态分布
x<-seq(-5,5,0.1)
y<-dnorm(x,0,1)
plot(x,y,type="h") #正态的生成

curve(dnorm(x,0,1),xlim=c(-5,5),ylim=c(0,0.8),col='red',lwd=5,lty=3)
curve(dnorm(x,0,2),add=T,col='blue',lwd=2,lty=2)
curve(dnorm(x,0,1/2),add=T,lwd=2,lty=2,col='green')
title(main="Gaussion distribution")
legend(par('usr')[2],par('usr')[4],xjust=1,
       c("sigma=1","sigma=2","sigma=1/2"),
       lwd=c(2,2,2),lty=c(3,2,1),col=c("red","blue",par("fg")))      #图例的设置

#t分布
curve(dt(x,1),xlim=c(-3,3),ylim=c(0,0.4),col="red",lwd=2,lty=1)
curve(dt(x,2),col="green",lwd=2,lty=2,add=T)
curve(dt(x,10),col="orange",lwd=2,lty=3,add=T)
curve(dnorm(x),add=T,lwd=3,lty=4)
title(main="student T distributions" )
legend(par("usr")[2],par("usr")[4],xjust=1,
      c("df=1","df=2","df=10","gaussian distribution"),
      lwd=c(2,2,2,2),
      lty=c(1,2,3,4),
      col=c("red","green","orange",par("fg")))

#x2卡方分布
curve(dchisq(x,1),xlim=c(0,10),ylim=c(0,0.6),col="red",lwd=2,lty=1)
curve(dchisq(x,2),col="green",lwd=2,lty=2,add=T)
curve(dchisq(x,3),col="blue",lwd=2,lty=3,add=T)
curve(dchisq(x,5),col="orange",lwd=2,lty=4,add=T)

abline(h=0,lty=3)
abline(v=0,lty=3)

title(main="chi square distributions" )
legend(par("usr")[2],par("usr")[4],xjust=1,
      c("df=1","df=2","df=3","df=5"),
      lwd=c(2,2,2,2),
      lty=c(1,2,3,4),
      col=c("red","green","blue","orange"))

#4.2直方图与核密度估计
#l	函数hist()：作直方图
#hist(x, breaks = "Sturges", freq = NULL, probability = !freq,
col = NULL,main = paste("Histogram of" , xname),
xlim = range(breaks), ylim = NULL,
xlab = xname, ylab,
axes = TRUE, nclass = NULL)
 
#l	函数density():作样本的核密度估计  
#density(x, bw = "nrd0"，
kernel = c("gaussian", "epanechnikov", "rectangular",
"triangular", "biweight", "cosine", "optcosine"),
n = 512, from, to)

#例1：二项分布binom(100,0.9)中抽取容量为N=100000的样本，试作出它的直方图及核密度估计曲线
N<-100000;n<-100;p<-0.9
x<-rbinom(N,n,p)
hist(x,xlim=c(min(x),max(x)),prob=T,col="lightblue",
nclass=max(x)-min(x)+1,main="Binomial distrution,n=100,p=0.9")
lines(density(x,bw=1),col="red",lwd=3)

##例2：负二项分布nbinom(10,0.25)中抽取容量为N=100000的样本，试作出它的直方图及核密度估计曲线
N<-100000;n<-10;p<-0.25
x<-rnbinom(N,n,p)
hist(x,xlim=c(min(x),max(x)),prob=T,col="lightblue",
nclass=max(x)-min(x)+1,main="Binomial distrution,n=10,p=0.25")
lines(density(x,bw=1),col="red",lwd=3)


#4.3单组数据的描述性统计分析
#4.3．1单组数据的图形描述
#直方图
install.packages("DAAG")
library(DAAG)
data(possum)
fpossum<-possum[possum$sex=="f",]
attach(fpossum)

par(mfrow=c(1,2))

hist(totlngth,breaks=72.5+(0:5)*5,ylim=c(0,22),
     xlab="total length",main="A:Breaks at 72.5,77.5,...")   #break很重要

hist(totlngth,breaks=75+(0:5)*5,ylim=c(0,22),
     xlab="total length",main="B:Breaks at 75,80,...")  #直方图的形状与区间端点有关


#茎叶图
stem(totlngth) 
sort(totlngth)    #可查看茎叶图的区间是左闭右开

#盒子图（框须图）
boxplot(totlngth)

#正态性检验
#1)QQ图
qqnorm(fpossum$totlngth,main="Normality Check via QQ Plot")
qqline(fpossum$totlngth,col='red')
#2）与正态密度函数比较
dens<-density(totlngth)  #核密度估计
xlim<-range(dens$x);ylim<-range(dens$y)
par(mfrow=c(1,2))

hist(totlngth,breaks=72.5+(0:5)*5,xlim=xlim,ylim=ylim,
     prob=TRUE,xlab="total length",main="A:Breaks at 72.5,77.5,...")
lines(dens,col=par('fg'),lty=2)
m<-mean(totlngth)
s<-sd(totlngth)
curve(dnorm(x,m,s),col="red",add=T)

hist(totlngth,breaks=75+(0:5)*5,xlim=xlim,ylim=ylim,
     prob=TRUE,xlab="total length",main="B:Breaks at 75,80,...")
lines(dens,col=par('fg'),lty=2)
curve(dnorm(x,m,s),col="red",add=T)

#3）使用经验分布函数
x<-sort(totlngth)
n<-length(x)
y<-(1:n)/n
m<-mean(totlngth)
s<-sd(totlngth)
plot(x,y,type="s",main="empirical cdf of ")
curve(pnorm(x,m,s),col="red",lwd=2,add=T)

#4.3.2单组数据的描述性统计量
#1.总体描述
均值、标准差、五数
#总体描述
#summary()
install.packages("DAAG")
library(DAAG)
data(possum)
fpossum<-possum[possum$sex=="f",]
summary(fpossum$totlngth)

#2.五数及样本分位数概括 
fivenum(fpossum$totlngth)  #五数
quantile(totlngth)   #常见几个分位数，即五数
quantile(totlngth,probs=c(0.25,0.5,0.75)) 
median(totlngth)  #中位数
max(totlngth)   
min(totlngth)
range(totlngth)

#3.离差的概括
max(totlngth)-min(totlngth)  #最大值-最小值，即全距
IQR(totlngth)   #四分位极差=第三4分位数-第一4分位数
sd(totlngth)  #标准差
sd(totlngth)^2 #方差
var(totlngth)  #方差
mad(totlngth)  #绝对离差  ，R中的定义为1.4826*median(abs(x-median(x)))

#4.偏度与峰度
install.packages("fBasics")
skewness(fpossum$totlngth)
skewness(totlngth)










#4.3
n=100
R1<-rt(n,10)
R2<-rt(n,20)
R3<-rt(n,30)
R<-c(R1,R2,R3)
hist(R,xlim=c(min(R),max(R)),probability=T)
lines(density(R,bw=1),col="red",lwd=3)

#4.5
install.packages("DAAG")
library(DAAG)
data(tinting)
attach(tinting)
#1)列联表
T<-table(sex,tint);T
#2)并列条图

barplot(T,legend.text=attr(T,"dimnames")$sex
                ,beside=TRUE)
#（3）散点图 
?tinting
plot(y=it,x=age)
lines(lowess(it~age),lwd=2)
rug(side=1,jitter(age,50))
rug(side=2,jitter(it,10))












































































