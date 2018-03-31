####参数的假设检验####
###6.1 假设检验的步骤及p值










###6.2 单正态总体参数的检验

###6.2.1 均值u的假设检验


##1.方差已知——Z检验
R软件实现：没有现成内置函数，需 编制自定义函数z.test()
z.test<-function(x,n,sigma,alpha,u0=0,alternative="two.sided") {
	options(digits=4)
	result<-list()
	mean<-mean(x)
	z<-(mean-u0)/(sigma/sqrt(n))
	p<-pnorm(z,lower.tail=FALSE) #有误，改为p<-pnorm(z）或 p<-pnorm(z,lower.tail=T)  ，计算左侧

	result$mean<-mean
	result$z<-z
	result$p.value<-p

	if (alternative=="two.sided") 
  		 result$p.value<-2*pnorm(abs(z),lower.tail=FALSE)
	else if (alternative=="greater")
 		  result$p.value<-pnorm(z)   #有误，改为p<-1-pnorm(z）或 p<-pnorm(z,lower.tail=F) 

	result$conf.int<-c(
   	mean-sigma*qnorm(1-alpha/2,mean=0,sd=1,lower.tail=TRUE)/sqrt(n),
   	mean+sigma*qnorm(1-alpha/2,mean=0,sd=1,lower.tail=TRUE)/sqrt(n))

	result
}
#例：教材P163页的例6.2.1   微波炉在炉门关闭状态下的辐射指标要求服从正态分布N(μ，0.12)，均值要求不超过0.12，为检查近期产品的质量，
从某厂生产的微波炉中抽查25台，得其炉门关闭时的辐射量的均值。问该厂生产的微波炉炉门关闭时的辐射量是否偏高？
z.test(0.13,25,0.1,0.05,u0=0.12,alternative="greater")
得p值=0.6915>0.05，故接受原假设。


##2.方差未知时u的检验：t检验
R软件实现：
方法一：自定义函数my.t.test()；方法二：调用内置函数t.test().

例：教材164 例6.2.2
某车间用一动员包装机包装盐，额定标准每袋净质量500g。设包装机包装出的盐每袋净质量X~N(μ,σ2)，某天随机抽取9袋，称得净质量（g）为：
    490,506,508,502,498,511,510,515,512
问包装机工作是否正常？
x<-c(490,506,508,502,498,511,510,515,512)
t.test(x,mu=500)
得p值=0.06>0.05，故接受原假设。







###6.2.2方差σ2的检验：χ2检验

R软件实现：没有内置函数可以调用，必须自定义函数my.chisq.test()
 
例：检查一批保险丝，抽出10根测量其通过电流熔化所需的时间（单位：秒）：
42,65,75,78,59,71,57,68,54,55
假设熔化所需时间服从正态分布，问能否认为熔化时间的方差并不超过80（取ɑ=0.05）？

#自定义函数my.chisq.test()
my.chisq.test<-function(x,sigma.sq,alpha=0.05,alternative="less")
{
	n<-length(x);s2<-var(x)
	chi2<-(n-1)*s2/sigma.sq
	if (alternative=="two.sided") #双侧检验
 	{  	 chisq.critical.value.Right=qchisq(1-alpha/2,n-1)       #右边临界值
    		 chisq.critical.value.left=qchisq(alpha/2,n-1)       #左边临界值
             chisq.critical.value=c(chisq.critical.value.left,chisq.interval.Right)
             p=2*min(pchisq(chi2,n-1),pchisq(chi2,n-1,lower.tail=F))   
 	} 
	if (alternative=="greater")  #右侧检验
 	{     chisq.critical.value=qchisq(1-alpha,n-1)       #右侧检验临界值
       	p=pchisq(chi2,n-1,lower.tail=F)   
  	}
	if (alternative=="less")   #左侧检验 
 	 { 	 chisq.critical.value=qchisq(alpha,n-1)       #左侧检验临界值
    		 p=pchisq(chi2,n-1,lower.tail=T)    
   	 }
     
     list(var=s2,chisq=chi2,df=n-1,chisq.critical.value=chisq.critical.value,p.value=p)
}

x<-c(42,65,75,78,59,71,57,68,54,55)
my.chisq.test(x,sigma.sq=80)









###列联表的独立性检验（P185  7.3.1）

R软件实现：内置函数chisq.test()可实现独立性检验。

对63个肺癌患者和43个非肺癌患者调查他们吸烟的情况，问总体中吸烟和患肺癌是否有关？）
	吸烟	不吸烟
肺癌患者	60	3
非肺癌患	32	11

x<-matrix(c(60,32,3,11),nr=2)
dimnames(x)<-list(c("cancer","normal"),c("smoke","not smoke"))
x
chisq.test(x,correct=TRUE)










#####作业题

##P175 T1
#分析：此题为单正态总体均值的假设检验（方差未知情形）——T检验



x<-(914,920,910,934,953,940,912,924,930)
t.test(x,mu=950,alternative="less")

得p值=3e-06<0.05 拒绝原假设




##p176 T2
#分析：此题为单正态总体方差的检验（均值未知）——χ^2检验

###方法二：自定义函数my.chisq.test()
my.chisq.test<-function(x,sigma.sq,alpha=0.05,alternative="less")
{
	n<-length(x);s2<-var(x)
	chi2<-(n-1)*s2/sigma.sq
	if (alternative=="two.sided") #双侧检验
 	{  	 chisq.critical.value.Right=qchisq(1-alpha/2,n-1)       #右边临界值
    		 chisq.critical.value.left=qchisq(alpha/2,n-1)       #左边临界值
             chisq.critical.value=c(chisq.critical.value.left,chisq.critical.value.Right)
             p=2*min(pchisq(chi2,n-1),pchisq(chi2,n-1,lower.tail=F))   
 	} 
	if (alternative=="greater")  #右侧检验
 	{     chisq.critical.value=qchisq(1-alpha,n-1)       #右侧检验临界值
       	p=pchisq(chi2,n-1,lower.tail=F)   
  	}
	if (alternative=="less")   #左侧检验 
 	 { 	 chisq.critical.value=qchisq(alpha,n-1)       #左侧检验临界值
    		 p=pchisq(chi2,n-1,lower.tail=T)    
   	 }
     
     list(var=s2,chisq=chi2,df=n-1,chisq.critical.value=chisq.critical.value,p.value=p)
}

x<-c(1.32,1.55,1.36,1.40,1.1)
my.chisq.test(x,sigma.sq=0.048^2,alternative="two.sided")

















































