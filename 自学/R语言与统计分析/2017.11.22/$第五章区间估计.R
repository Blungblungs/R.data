###第五章 参数估计###
#5.1.1 矩法估计
#5.1.2 极大似然估计

#$5.2 单正态总体参数的区间估计
#5.2.1 均值的区间估计
#1、方差已知的置信区间
conf.int_1(x,sigma,con.level) 
conf.int_1<-function(x,sigma,con.level=0.95) {
  options(digits=4)  #设置4位有效数字
  
  m<-mean(x);n<-length(x)
  alpha<-1-con.level
  zp<-qnorm(1-alpha/2)
  Low<-m-zp*sigma/sqrt(n)
  Up <-m+zp*sigma/sqrt(n)
  Result<-list(x.mean=m,conf.interval=c(Low,Up))
  Result
}

#2、方差为未知的置信区间
#方法一：可以自己编写函数conf.int_2(x,con.level) 
conf.int_2<-function(x,con.level=0.95){
  #options(digits=7)  #设置7位有效数字
  
  m<-mean(x);n<-length(x);sd=sd(x)
  alpha<-1-con.level
  tp<-qt(1-alpha/2,n-1)
  Low<-m-tp*sd/sqrt(n)
  Up <-m+tp*sd/sqrt(n)
  Result<-list(x.mean=m,conf.interval=c(Low,Up))
  Result
}

#方法二：R中也有现成的内置函数t.test( )是用来计算单个样本或双样本t检验的，也可返回计算方差未知时均值的置信区间，调用格式有
#t.test(x, ...)

##5.2.2方差的区间估计
#方法一：R中没有现成的内置函数，计算均值未知时方差的置信区间，
#所以需要自己编写函数conf.int_3(x,conf.level)
conf.int_3<-function(x,conf.level=0.95){
options(digits=3)
alpha<-1-level
m<-mean(x)
var=var(x)
n<-length(x)
chi1<-pchisq(1-alpha/2,n-1)
chi2<-pchisq(alpha/2,n-1)
Low<-(n-1)*var/(chi1)
Up<-(n-1)*var/(chi2)
result<-list(sigma2.conf.interval=c(Low,Up),2)
result
}
x<-rep(1:5,6)
conf.int_3(x,conf.level=0.95)



