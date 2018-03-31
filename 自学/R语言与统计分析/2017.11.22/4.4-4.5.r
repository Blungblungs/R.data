###4.4  多组数据的描述性统计分析
##4.4.1  两组数据的图形概括
#散点图
library(DAAG)
data(cars)
summary(cars)
head(cars)
attach(cars)
plot(speed,dist,xlab="xxx",ylab = "xxx")
lines(lowess(speed,dist),lwd=2)
#利用rug()标明数据具体位置
rug(side=2,jitter(dist,20))
rug(side=1,jitter(dist,5))
#?rug
#?jitter

#等高线图
##（一）、有时候数据太多太集中，散点图上的信息不容易看出来
x <- rnorm(10000, 0, 1)
y <- rnorm(10000, 1, 100)
plot (x, y)
##这个最好借助于二维的密度估计来认识图形。。
##首先使用MASS程序包中的二维核密度函数kde2d()来估计二维数据的密度函数，
##再利用函数contour（）画出密度的等高线曲线图。
library(MASS)
z<-kde2d(x,y)
plot(x,y)
contour(z,col="red",drewlables=F,main="Density estimation :cont Plot")
##（三）、三维透视图亦可以很清晰的表示。
persp(z,main = "Density estimation:perspective plot")


##数据的变换
data("Animals")
Animals
par(mfrow=c(1,2))
attach(Animals)
plot(brain~body)
plot(log(brain)~log(body))

##4.4.2 多组数据的图形描述
#pairs(),plot(),matplot(),boxplot()#
n<-10
d<-data.frame(y1=rnorm(100),y2=rt(100,10),y3=rchisq(100,10))
d
#散点图
plot(d)
#矩阵图
matplot(d,type = 'l')
?matplot
#框须图
boxplot(d)

###多组数据的描述性统计
summary(state.x77)
head(state.x77)
aggregate(state.x77,list(Regin=state.region),mean)
state.region
?aggregate
aggregate(state.x77,list(Region=state.region,Cold=state.x77[,"Frost"]>130),mean)

#标准差与协方差的计算
option(digits=3)
sd(state.x77)
var(state.x77)
aggregate(state.x77,list(Region=state.region),sd)

#相关系数的计算
coplot(y~x)

#后面的省略


###4.5 分类数据的描述性统计分析
#4.5.1 列联表的制作

install.packages("ISwR")
library(ISwR)
attach(juul)
head(juul)
table(sex)
sex.tanner<-table(sex,tanner)

#获取边际列表
margin.table(sex.tanner,1)
#频数列联表
round(prop.table(sex.tanner),2)

##4.5.2 列联表的图形描述
#使用条形图
sex.tanner
colnames(sex.tanner)=c("10-20","20-30","30-40","40-50","")
rownames(sex.tanner)=c("man","women")
barplot(sex.tanner,beside = T,ylim=c(0,300),legend.text = attr(sex.tanner,"dimnames")$sex,col=c("black","grey"))
barplot(sex.tanner,beside = F)






