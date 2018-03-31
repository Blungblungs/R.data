###一元线性回归### 薛毅

x<-c(0.10, 0.11, 0.12, 0.13, 0.14, 0.15,
     0.16, 0.17, 0.18, 0.20, 0.21, 0.23)
y<-c(42.0, 43.5, 45.0, 45.5, 45.0, 47.5,
       49.0, 53.0, 50.0, 55.0, 55.0, 60.0)

##参数估计、显著性检验##
lm.sol<-lm(y~x)
summary(lm.sol) #得到参数的估计值，相应的标准差

##参数β0、β1的区间估计##
source("beta.int.R")     #利用自编函数"beta.int.R" 计算区间估计
beta.int(lm.sol)

##预测##
#利用predict()计算预测值与预测区间
new<-data.frame(x=0.16)
lm.pred<-predict(lm.sol,new,interval="prediction",level=0.95)
lm.pred  ##x0=0.16时所得到的Y值为49.43, [46.37,52.49]

##控制##
###常用函数###
anova(lm.sol)  #方差
coefficients(lm.sol)  #系数
deviance(lm.sol) #残差平方和
formula(lm.sol)  #公式
plot(lm.sol) #绘制模型诊断图
predit(lm.sol) #预测函数
residuals(lm.sol)  #计算残差
step(lm.sol)  #做逐步回归分析 AIC的最小模型对得出
summary(lm.sol)   #详细拟合结果

 






