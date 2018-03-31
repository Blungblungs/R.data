#读取数据

#聚类分析
#第一步：定义距离

#第二步：完成系统聚类分析：hclust()
dat=read.csv("C:/Users/Administrator/Desktop/建模/第四节课：多元统计/程序/examp8.4.2.csv")

row.names(dat)=dat[,1]
dat
dreg=dist(dat[2:9])  #函数dist()用来定义样品之间的距离
?hclust()
dhc1=hclust(dreg,"single")   #系统聚类分析：hclust()
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
row.names(dat)=dat[,1]
head(dat)
student=dat[3:12]
student.pr<-princomp(student, cor=T)   #利用princomp()进行主成分分析
student.pr
summary(student.pr,loadings=T)  #输出载荷loadings=T
#Standard deviation 标准差 Proportion of Variance 贡献率
##因子分析
row.names(dat)=dat[,1]
m2=dat[3:12]
m2
cor(m2)   #计算相关系数矩阵  
#install.packages("psych")
library(psych)  #检验相关系数是不是对角阵。 如果不相关，则无法进行分析。
?cortest.bartlett
cortest.bartlett(cor(m2))  
?factanal
factanal(m2,factors=3,scores = "Bartlett")   #利用factanal进行因子分析
fal$scores #输出因子得分

