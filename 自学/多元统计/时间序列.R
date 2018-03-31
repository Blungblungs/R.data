install.packages("TSA")
library(TSA)  
##ex.1  模型识别
data(ma1.1.s)
ma1.1.s
plot(ma1.1.s,type="o")
op<-par(mfrow=c(2,1))
acf(ma1.1.s,xaxp=c(0,20,10))   #画acf图
pacf(ma1.1.s,xaxp=c(0,20,10))  #画pacf图
par(op)
eacf(ma1.1.s)  #利用eacf看到底是什么模型合适
data(oil.price)
plot(oil.price)
op=par(mfrow=c(2,1))
acf(oil.price)
pacf(oil.price)
par(op)
eacf(oil.price)

adf.test(oil.price)

adf.test(diff(oil.price))  #利用diff()做一阶差分 得出这个数据为平稳的


#模拟数据
samples=arima.sim(n=500,list(ar=0.9),sd=0.5)
adf.test(samples)

ima11=arima.sim(n=60,list(order=c(0,1,1),ma=0.8))
adf.test(ima11,k=0)
adf.test(ima11)
dima=diff(ima11)
adf.test(dima)
op=par(mfrow=c(2,1))
acf(dima)
pacf(dima)
par(op)
eacf(dima)

##进行参数估计
#arima()
?acf
data(hare)
op<-par(mfrow=c(2,1))
acf(hare)
pacf(hare)
par(op)
eacf(hare,ma.max=7)  
arima(hare,order=c(2,0,0),method="CSS-ML")  # arima()  拟合arima模型 



