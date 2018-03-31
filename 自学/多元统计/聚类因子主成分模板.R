#读取数据
read.table("D:/R/我的资料集/自学/多元统计/数据/4、数据.txt",header=T)
read.csv("D:/R/我的资料集/自学/多元统计/数据/examp8.4.2.csv")
         




#聚类分析
#第一步：定义距离
#函数dist()用来定义样品之间的距离
#第二步：完成系统聚类分析：hclust()
x<-c(1,2,6,8,11)
d<-dist(x)
d
hc1<-hclust(d, "single")    #系统(层次)聚类分析：hclust() 采用了四种方法
hc2<-hclust(d, "complete")
hc3<-hclust(d, "median")
hc4<-hclust(d, "ward.D")
opar<-par(mfrow=c(2, 2))
plot(hc1, hang=-1);plot(hc2, hang=-1)
plot(hc3, hang=-1);plot(hc4, hang=-1)
par(opar)

#程序中我们调用R 内置数据iris, 用函数hclust()进行聚类分析,
#输出结果保存在iris.hc中, 用函数rect.hclust() 按给定的类的个数(或阈值)
#进行聚类, 并用函数plclust( )代替plot( ) 绘制聚类的谱系图(两者使用方法基本相同), 各类用边框
#界定, 选项labels=FALSE只是为了省去数据的标签. 函数cuttree()将数据iris分类
#结果iris.hc编为三组, 分别以1, 2, 3 表示, 保存在iris.id中.
data(iris)  #; attach(iris)
iris.hc<-hclust(dist(iris[,1:4]),method="ward.D")
plot(iris.hc,labels = FALSE, hang=-1)
re<-rect.hclust(iris.hc,k=3)
iris.id <- cutree(iris.hc,3)
table(iris.id,iris$Species)
#detach(iris)


##例子
dat=read.table("D:/R/我的资料集/自学/多元统计/数据/4、数据.txt",header=T)
row.names(dat)=dat[,1]
dreg=dist(dat[2:9])
dhc1=hclust(dreg,"single")
dhc2=hclust(dreg,"centroid")
dhc3=hclust(dreg,"ward")
plot(dhc1)
rect.hclust(dhc1,k=5)

windows()
plot(dhc2)
rect.hclust(dhc2,k=5)
windows()
plot(dhc3)
rect.hclust(dhc3,k=5)

##主成分分析
student<-data.frame(
  X1=c(148, 139, 160, 149, 159, 142, 153, 150, 151, 139,
       140, 161, 158, 140, 137, 152, 149, 145, 160, 156,
       151, 147, 157, 147, 157, 151, 144, 141, 139, 148),
  X2=c(41, 34, 49, 36, 45, 31, 43, 43, 42, 31,
       29, 47, 49, 33, 31, 35, 47, 35, 47, 44,
       42, 38, 39, 30, 48, 36, 36, 30, 32, 38),
  X3=c(72, 71, 77, 67, 80, 66, 76, 77, 77, 68,
       64, 78, 78, 67, 66, 73, 82, 70, 74, 78,
       73, 73, 68, 65, 80, 74, 68, 67, 68, 70),
  X4=c(78, 76, 86, 79, 86, 76, 83, 79, 80, 74,
       74, 84, 83, 77, 73, 79, 79, 77, 87, 85,
       82, 78, 80, 75, 88, 80, 76, 76, 73, 78))
student.pr<-princomp(student, cor=T)   #利用princomp()进行主成分分析
summary(student.pr,loadings=T)  #输出载荷loadings=T
#Standard deviation 标准差 Proportion of Variance 贡献率
##因子分析
v1 <- c(1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,4,5,6)
v2 <- c(1,2,1,1,1,1,2,1,2,1,3,4,3,3,3,4,6,5)
v3 <- c(3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,5,4,6)
v4 <- c(3,3,4,3,3,1,1,2,1,1,1,1,2,1,1,5,6,4)
v5 <- c(1,1,1,1,1,3,3,3,3,3,1,1,1,1,1,6,4,5)
v6 <- c(1,1,1,2,1,3,3,3,4,3,1,1,1,2,1,6,5,4)
m1 <- cbind(v1,v2,v3,v4,v5,v6)  #按列合并
cor(m1)   #计算相关系数矩阵
install.packages("psych")
library(psych)  #检验相关系数是不是对角阵。 如果不相关，则无法进行分析。
cortest.bartlett(cor(m1),n=18)
?factanal
factanal(m1,factors=3)   #利用factanal进行因子分析

fal=factanal(~v1+v2+v3+v4+v5+v6, factors = 3,scores = "Bartlett")  
fal$scores #输出因子得分

