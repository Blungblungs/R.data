#回归分析
#lm()
#火灾损失与距离的数据
dis=c(3.4,1.8,4.6,2.3,3.1,5.5,0.7,3.0,2.6,4.3,2.1,1.1,6.1,4.8,3.8)
los=c(26.2,17.8,31.3,23.1,27.5,36.0,14.1,22.3,19.6,31.3,24.0,17.3,43.2,36.4,26.1)
reg=lm(los~dis)
summary(reg)  #显示reg相关信息


resi=reg$residuals  #计算残差
plot(resi)  #画出残差图
plot(reg)  #画出四张相关线性有关的图片


###逐步回归

minh=read.table("D:/R/我的资料集/自学/多元统计/数据/dat1.txt",header=T)

reg=lm(y~.,data=minh)  #y~.  因变量为y，自变量为剩下所有
summary(reg)

regression3=lm(y~1,data=minh)
ste=step(regression3,scope=list(upper=~x1,lower = ~1))
summary(ste)


##logistic

logi2=read.table("D:/R/我的资料集/自学/多元统计/数据/li95.txt",header=T)
logi2
reg1=glm(y~x1+x2+x3,data=logi2,family="binomial")  #family="binomial" 表示做logistic回归模型分析
summary(reg1)
stepreg=step(reg1,scope=list(upper=~x1+x2+x3,lower=~1))
summary(stepreg)

###泊松
#poisson
n=30
x1=rnorm(n)
x2=rnorm(n)
lam=exp(x1+x2+rnorm(n))
y=c()
for(i in 1:n) y[i]=rpois(1,lam[i])
dat=data.frame(y,x1,x2)
reg2=glm(y~x1+x2,data=dat,family="poisson")  #利用family="poisson" 进行泊松模型
summary(reg2)
