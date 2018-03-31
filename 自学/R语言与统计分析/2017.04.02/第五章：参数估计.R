#第五章 参数估计
#5.1矩法估计和极大似然估计
#5.1.1矩法估计
#例1：
x<-(1,1,0,1,0,0,1,0,1,1,1,0,1,1,0,1,0,0,1,0,1,0,1,0,0,1,1,0,1,0)
theta<-mean(x)
t<-theta/(1-theta);t
#5.1.2 极大似然估计

#5.2单正态总体参数的区间估计
#5.2.1方差已知的均值μ的区间估计
#R中没有现成的内置函数，计算方差已知时均值的置信区间（u）
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
#例1：教材P139页的例5.2.1
#一个人10次称自己的体重（单位：500g）：175,176,173,175,174,173,173,176,173,179
希望估计一下他的体重。假设此人的体重服从正态分布，标准差为1.5，现在要求体重的95%置信区间。
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

x<-c(175,176,173,175,174,173,173,176,173,179)

conf.int_1(x,sigma=1.5)

#此人体重的95%的置信区间为(173.8 ,175.6)

#2.方差未知时μ的区间估计
#利用t.test()求置信区间
#例2：教材P141页
#一个人10次称自己的体重（单位：500g）：175,176,173,175,174,173,173,176,173,179
希望估计一下他的体重。假设此人的体重服从正态分布，方差不知道，现在要求体重的95%置信区间。
x<-(175,176,173,175,174,173,173,176,173,179)
t.test(x)

# One Sample t-test

data:  x
t = 280, df = 9, p-value <2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 173.3 176.1
sample estimates:
mean of x 
    174.7 

此人体重的95%的置信区间为(173.3 ，176.1)，估计值为174.7。

#5.1.2方差σ2的区间估计 （卡方检验）
#均值μ未知时，方差σ2的区间估计
#R中没有现成的内置函数，计算均值未知时方差的置信区间
#conf.int_3(x,conf.level)
conf.int_3<-function(x,conf.level=0.95){
	sd<-sd(x);n<-length(x)
	alpha<-1-conf.level
	xp.left<-qchisq(alpha/2,n-1)  #左边分位数
	xp.right<-qchisq(1-alpha/2,n-1)  #右边分位数
	Low<-(n-1)*sd^2/xp.left
	Up<-(n-1)*sd^2/xp.right
	Result<-list(sigma2.conf.interval=c(Low,Up))
	Result
}

#例3：教材P143
一个人10次称自己的体重（单位：500g）：175,176,173,175,174,173,173,176,173,179
希望估计一下他的体重。假设此人的体重服从正态分布，现在要求σ2的95%置信区间。

conf.int_3<-function(x,conf.level=0.95){
	sd<-sd(x);n<-length(x)
	alpha<-1-conf.level
	xp.left<-qchisq(alpha/2,n-1)  #左边分位数
	xp.right<-qchisq(1-alpha/2,n-1)  #右边分位数
	Low<-(n-1)*sd^2/xp.left
	Up<-(n-1)*sd^2/xp.right
	Result<-list(sigma2.conf.interval=c(Low,Up))
	Result
}

x<-c(175,176,173,175,174,173,173,176,173,179)
conf.int_3(x)

#结果：$sigma2.conf.interval
[1] 12.628  1.793

结论：σ2的95%的置信区间为(1.792589 ，12.627808)





#作业题：
####T5.3：
##（1）分析：此题为方差未知的均值的区间估计
##调用内置函数t.test()
x<-c(482,493,457,471,510,446,435,418,394,469)
t.test(x,conf.level=0.95)  

###(2)分析：此题为均值μ未知时σ^2的区间估计
##采用：自定义函数conf.int_3(x,conf.level)
conf.int_3<-function(x,conf.level=0.95){
	sd<-sd(x);n<-length(x)
	alpha<-1-conf.level
	xp.left<-qchisq(alpha/2,n-1)  #左边
	xp.right<-qchisq(1-alpha/2,n-1)  #右边
	Low<-(n-1)*sd^2/xp.right
	Up<-(n-1)*sd^2/xp.left
      #注意求的是标准差sigma的区间估计，若先返回列表对象再开根号，会出错
	Result<-list(sigma.conf.interval=sqrt(c(Low,Up)))
      Result
}

x<-c(482,493,457,471,510,446,435,418,394,469)
conf.int_3(x,conf.level=0.90)




















