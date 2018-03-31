###层次聚类析分层次聚类分析###
#读取数据
?read.table
data1<-read.table("D:/R/我的资料集/自学/多元统计/数据/4、数据.txt",header=T)
head(data1)
row.names(data1) = c("北京", "天津", "河北", "山西", "内蒙古", "辽宁", "吉林", 
              "黑龙江", "上海", "江苏", "浙江", "安徽", "福建", "江西", 
              "山东",  "河南", "湖北", "湖南", "广东", "广西", "海南", 
              "重庆", "四川", "贵州", "云南", "西藏", "陕西", "甘肃", 
              "青海", "宁夏", "新疆")
data1<-data1[,-1]
head(data1)
#1. 标准化数据
df <- scale(data1[-1]);df
#2. 选定点与点之间计算距离的方式并生成距离矩阵
d<- dist(df, method="euclidean")
#3. hclust() 采用了四种方法计算类与类之间的距离
fit1<-hclust(d, "single")    
fit2<-hclust(d, "complete")
fit3<-hclust(d, "median")
fit4<-hclust(d, "ward.D")
#4. 决定聚类的个数

#install.packages("NbClust")   # 用NbClust包中的24种指标来判断聚类个数
library(NbClust)
set.seed(1234)
devAskNewPage(ask= TRUE)
?NbClust
nc<-NbClust(df,method= "kmeans")
table(nc$Best.n[1,])
barplot(table(nc$Best.n[1,]))# 将指标分配画可视化为条形图
#得出几类为最优方案，并进行实施

#5. 画出树状图，并叠加5类方案
opar<-par(mfrow=c(2, 2))
plot(fit1, hang=-1)
rect.hclust(fit1, k=5)
plot(fit2, hang=-1)
rect.hclust(fit2, k=5)
plot(fit3, hang=-1)
rect.hclust(fit3, k=5)
plot(fit4, hang=-1)
rect.hclust(fit4, k=5)
par(opar)  #得出某几种效果不是很好，不往下做，其他效果好的往下做
#6. 观察类别的变量，并根据图表进行分析
clusters <- cutree(fit1, k=5) 
table(clusters)

