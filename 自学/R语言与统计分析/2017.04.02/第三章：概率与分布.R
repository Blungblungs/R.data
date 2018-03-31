#  第三章概率与分布
  #3.1  随机抽样
#sample(x, n, replace = FALSE, prob = NULL)

#等可能的不放回的随机抽样
sample(1:52,4)  #从52张扑克牌中抽取4张

#等可能的放回的随机抽样
#sample(x, n, replace = TRUE, prob = NULL)

sample(c("正","反"),10,replace=TRUE)  #抛一枚均匀的硬币10次
sample(1:6,10,replace=T)  #掷一枚均匀的骰子10次

#不等可能的随机抽样：
#sample(x,n,replace=TRUE,prob=y)
sample(c("成功","失败"),10,replace=TRUE,prob=c(0.9,0.1))
#手术成功率为0.9，失败的概率为0.1，做10次手术

  #3.2  排列组合与概率计算
#函数prod(..., na.rm = FALSE)：返回所给向量元素的累乘积  A
#函数choose(n,k):计算n(n-1)…(n-k+1) / k!    C

#从一副完全打乱的52 张扑克中取4 张, 求以下事件的概率:

#抽取的4张依次为红心A，方块A，黑桃A和梅花A的概率;
prod(52:49)
#抽取的4张为红心A，方块A，黑桃A和梅花A的概率.
choose(52,4)


 #3.3  概率分布
#均匀分布: unif(a，b)
#正态分布/高斯分布: norm(μ，σ2)
#卡方(χ2) 分布: chisq(n)
#t分布: t(n)
#F分布: f(n,，m)

#3.4R中内嵌的统计分布函数
#练习：用plot函数作正态分布的密度函数图形
x<-seq(-3,3,0.1);u=0;sigma=1
y<-exp(-(x-u)^2/(2*sigma^2))/(sqrt(2*pi)*sigma)
data.frame(x=x,y=y)
plot(x,y)  #正态分布的密度函数图形

#例1：计算标准正态分布的x=0处的密度函数和分布函数
dnorm(0)  #尝试:标准正态分布改为N(2,4)后的结果 dnorm(0,mean=2,sd=2)
pnorm(0)  #分布函数

#例2：计算标准正态a=0.5和0.05的分位数
qnorm(0.5)  
qnorm(0.05)   #结果说明什么？分位数计算的是下侧（左侧）分位数

#例3：产生100个标准正态分布的随机数，并计算其均值
mean(rnorm(100))  #尝试:标准正态分布改为N(2,4)后的结果 
mean(rnorm(100,mean=2,sd=2))
#3.5.1 中心极限定理

#3.5.2 渐近正态性的图形检验   存在问题

#3.5.3 举例
#二项分布：binorm(10,0.1)
op<-par(mfrow=c(2,2)) #建立2x2的图
limite.central(rbinom,distpar=c(10,0.1),m=1,s=0.9)
par(op)

help(limite.central)


#p87 作业题
#3.1
x<-sample(1:100,5)
sum(x)

#3.2


#3.3
x<-rnorm(1000,mean=100,sd=100)  #随机生成1000个随机数
hist(x)
y<-sample(x,500,TRUE)
hist(y)
mean(x);mean(y)
var(x);var(y)

#3.4
x<-rnorm(1000)
y<-cumsum(x)
plot(x);plot(y)

#3.5
x<-rnorm(100)
y=mean(x)
Za<-qnorm(1-alpha/2)*sigma/sqrt(n)
z1=Za+y;z2=-Za+y
list(z1，z2)

