####P157页第5.3题
##（1）分析：此题为方差未知的均值的区间估计
##方法一：利用自定义函数conf.int_2(x,conf.level) 
conf.int_2<-function(x,conf.level=0.95){
	#options(digits=7)  #设置7位有效数字

	m<-mean(x);n<-length(x);sd=sd(x)
	alpha<-1-conf.level
	tp<-qt(1-alpha/2,n-1)
	Low<-m-tp*sd/sqrt(n)
	Up <-m+tp*sd/sqrt(n)
      Result<-list(x.mean=m,conf.interval=c(Low,Up))
      Result
}

x<-c(482,493,457,471,510,446,435,418,394,469)
conf.int_2(x,conf.level=0.95)

##方法二：调用内置函数t.test()
x<-c(482,493,457,471,510,446,435,418,394,469)
t.test(x,conf.level=0.95)  
t.test(x)$conf.int 


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

#####P175页第6.1题
#分析：此题为单正态总体均值的假设检验（方差未知情形）——T检验
###方法一：自定义函数my.t.test()
my.t.test<-function(x,alpha=0.05,mu0,alternative="two.sided")
{	x.mean<-mean(x);n=length(x);s<-sd(x)

	T<-(x.mean-mu0)/(s/sqrt(n))

	if (alternative=="two.sided")
 	{  	 T.critical.value=qt(1-alpha/2,n-1)       #双侧检验临界值
    		 p=2*(1-pt(abs(T),n-1))   #双侧检验
 	} 
	if (alternative=="greater") 
 	{     T.critical.value=qt(1-alpha,n-1)       #右侧检验临界值
       	p=1-pt(T,n-1)   #右侧检验 或 pt(T,n-1,lower.tail=T)
  	}
	if (alternative=="less")
 	 { 	 T.critical.value=-qt(1-alpha,n-1)       #左侧检验临界值
    		 p=pt(T,n-1)    #左侧检验 
   	 }0000000000000000000000000000000000000000000
     
      list(x.mean=x.mean,T=T,df=n-1,T.critical.value=T.critical.value,p.value=p)
}
x<-c(914,920,910,934,953,940,912,924,930)
my.t.test(x,alpha=0.01,mu0=950,alternative="less")


###方法二：调用内置函数t.test()
x<-c(914,920,910,934,953,940,912,924,930)
t.test(x,mu=950,alternative="less")




#####P176页第6.2题
#分析：此题为单正态总体方差σ^2的假设检验（均值未知情形）——χ^2检验
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


#########P198页第7.4题,列联表的独立性检验
x<-matrix(c(341,103,405,11,105,15),nrow=2)
dimnames(x)<-list(c("白人","黑人"),c("民主党","共和党","无党"))
x
chisq.test(x,correct=TRUE) 

