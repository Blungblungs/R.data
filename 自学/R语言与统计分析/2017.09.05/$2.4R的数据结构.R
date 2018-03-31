#因子型向量的建立
#字符型转换为因子
x<-c("green","blue","yellow")
a<-factor(x)
a
#数值型转换成因子
b<-c(1,2,3,1)
factor(b)
b
#字符型转换成数值型因子
a<-c("green","blue","yellow")
a<-factor(a)
a
levels(a)<-c(1,2,3)
a
#数值型因子转换为字符型因子
b<-c(1,2,3,1)
levels(b)<-
ff<-factor(b,labels=c("A","B","C"))
ff

#利用gl()产生规则的因子序列
gl(3,5)
?gl
x<-gl(3,5,length=50,labels=c("a","b","c"))
x


###数值型向量的运算
x<-c(10.4,1,5,1,1)
y<-c(x,1,1)
v<-2*x+y+1
v

#常用统计函数

data<-read.csv("C:/Documents and Settings/Administrator/桌面/0.csv",header=T)
data
summary(data)
max(data$x1)
which.max(data$x1)
length(data$x4)
cummin(data$x5)
cov(data$x1,data$x3)
outer(data$x1,data$x3)
names(data)
fix(data)
head(data)
var(data$x3)
sd(data$x3)^2
rank(data$x4)
attach(data)
data
names(data)<-c(1,2,3,4,5,6,7)
data2<-data[1,2]
data1<-data[-(10:31),-(2:5)]
data1
data1<10
#上课老师说的##
x<-c(1,2,3,4)
x
var(x)
sd(x)
range(x)
?IQR(x)
quantile(x)
prod(x)
rev(x)
sort(x)
order(x,decreasing = T)
rank(x,decreasing = T)
ls()
ls.str()
install.packages("MASS")
library(help=MASS)
cor(x,x)
cumsum(x)
cumprod(x)
require("MASS")
scan()
121
seq(1:5,by=2)
?prod
y<-data[!is.na(data)]

y<-x[!is.na(x)]

