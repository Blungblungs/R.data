###$第六章 参数的假设检验
#假设检验的步骤及p值
#步骤：
#1）提出原假设H0与备择假设H1
#2）选择检验统计量W并确定其分布
#3）在给定的显著性水平下，确定统计量W的拒绝域
#4）算出样本眯对应的检验统计量的值
#5)判断：若统计量的值落在拒绝域内，则拒绝Ho,否则接受Ho

##5.3单个正态总体参数的假设检验(教材P162  6.2节)
##5.3.1均值μ假设检验
#方法一：自定义函数my.z.test()
my.z.test<-function(x,n,u0,sigma,alpha=0.05,alternative="two.sides"){	
x.mean<-mean(x)
z=(x.mean-u0)/(sigma/sqrt(n))    #检验观测值

if (alternative=="two.sided")
{   z.critical.value=qnorm(1-alpha/2)       #双侧检验临界值
p=2*(1-pnorm(abs(z)))   #双侧检验p值
} 
if (alternative=="greater") 
{     z.critical.value=qnorm(1-alpha)       #右侧检验临界值
p=1-pnorm(z)   #右侧检验p值 或 pnorm(z,lower.tail=F)
}
if (alternative=="less")
{  z.critical.value=-qnorm(1-alpha)       #左侧检验临界值
p=pnorm(z)    #左侧检验p值

}
list(x.mean=x.mean,z=z,z.critical.value=z.critical.value,p.value=p)
}
my.z.test(0.13,n=25,u0=0.12,sigma=0.1,alternative="greater")








