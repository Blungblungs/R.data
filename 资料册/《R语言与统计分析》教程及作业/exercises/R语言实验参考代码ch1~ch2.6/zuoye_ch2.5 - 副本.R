##############R编程#######################
#课后作业P68页2.5
#二分法求方程近似解：求方程f(x) = x^2 - 1 = 0在[0,3]上的近似解，精确度为1*10-5。

#算法分析：二分法求方程近似解的基本思想是将方程的有解区间平分为两个小区间，然后判断解在哪个小区间；继续把有解的区间一分为二进行判断，如此周而复始，直到求出满足精确要求的近似解。

#二分法求方程近似解的算法步骤：

#⑴确定区间[a,b]，验证f(a).f(b) < 0，给定精确度e

#⑵求区间(a, b)的中点mid

#⑶计算f(mid)

#若f(mid) = 0，则mid就是函数的零点

#若f(a).f(mid) < 0，则令b = mid(此时零点a < x0 < mid)

#若f(mid).f(b) < 0，则令a = mid(此时零点mid < x0 < b)

#⑷判断是否达到精确度e：即若|a-b| < e，则得到零点近似值a（或b）；否则重复⑵-⑷。
 


#定义自已的二分法求根函数
secpart<-function(F,a,b,err=1e-5)
{ 
      if ((a>b)|(F(a)*F(b)>0))
       { 	print("PLease check your input information")
       	stop()
       }

	while (abs(b-a) >= err)
 	{ 
 		mid <-(a + b) / 2 
 
 		if (F(mid) == 0)  return(mid) 
		if (F(mid)*F(a) < 0) 
			b <- mid
            else 
			a <-mid
 	}
	return(mid) 
}

#函数表达式
f<-function(x)    return(x^3-x-1)       

#调用二分法求根函数
secpart(f,1,2)


###############################################################
#P68页2.6题：编写一个函数，求数据y=(y1,y2,...,yn)的均值，标准差、偏度与峰度
myfun<-function(y)
{	 n=length(y)
       ybar=mean(y)
          
      #求标准差sd
      sd=sqrt(sum((y-ybar)^2)/(n-1))
      #sd=sd(y) 
      
      #求偏度skewness
      skewness=sum((y-ybar)^3)/(n*sd^3)
      #excel中的公式
      #skewness=n/((n-1)*(n-2))*sum(((y-ybar)/sd)^3)

      #求峰度kurtosis
      kurtosis=sum((y-ybar)^4)/(n*sd^4)-3
      #excel中的公式
      #kurtosis=n*(n+1)/((n-1)*(n-2)*(n-3))*sum(((y-ybar)/sd)^4)-3*(n-1)^2/((n-2)*(n-3))
            
      list(mean=ybar,sd=sd,skewness=skewness,kurtosis=kurtosis)
}

myfun(1:10)

sd(1:10)

PP106页;扩展程序包fBasics中的函数skewness()
install.packages("fBasics")
library("fBasics")
skewness(1:10)
kurtosis(1:10)








