install.packages("DMwR")
library(DMwR)
head(algae)
summary(algae)

###数据分析和可视化###
hist(algae$mxPH, prob=T)  #百分比形式输出
library(car)
#画直方图，观看数据分布
par(mfrow=c(1,2))
hist(algae$mxPH, prob=T,main='Histogram of maximum pH value',ylim=0:1)
lines(density(algae$mxPH,na.rm = T))
rug(jitter(algae$mxPH))
qq.plot(algae$mxPH,main='Normal QQ plot of maximum pH')
par(mfrow=c(1,1))
#画箱线图观看数据分布以及离群值的多少
boxplot(algae$oPO4,boxwex=0.15,ylab='Orthophosphate (oPO4)')
rug(jitter(algae$oPO4),side=2)
abline(h=mean(algae$oPO4,na.rm=T),lty=2)

#观看离群值
plot(algae$NH4,xlab='')
abline(h=mean(algae$NH4,na.rm=T),lty=1)
abline(h=mean(algae$NH4,na.rm=T)+sd(algae$NH4,na.rm=T),lty=2)
abline(h=median(algae$NH4,na.rm=T),lty=3)
#identify(algae$NH4)  #交互式，点单击点的行号。会有交互

#观察a1变量如何依赖与其他变量
#install.packages("lattice")
library(lattice)
bwplot(size ~ a1, data=algae,ylab='River Size',xlab='Alga A1')

###数据缺失###
#方法 
#•  Remove the cases with unknowns
#•  Fill in the unknown values by exploring the correlations between variables
#•  Fill in the unknown values by exploring the similarity between cases
#•  Use tools that are able to handle these values.

algae[!complete.cases(algae),]   #显示各行缺失值
nrow(algae[!complete.cases(algae),])
algae <- na.omit(algae)

algae <- algae[-c(62,199),]  #删除缺失值的行

#Filling in the unknowns with the most frequent values
algae[48,'mxPH'] <- mean(algae$mxPH,na.rm=T)  #用列平均值代替缺失值


###获取预测模型

algae <- algae[-c(62,199),]  #数据清理
clean.algae <- algae
lm.a1<-lm(a1~ ., data=clean.algae[,1:12])  #线性回归模型
summary(lm.a1)
plot(lm.a1)
help(step)
