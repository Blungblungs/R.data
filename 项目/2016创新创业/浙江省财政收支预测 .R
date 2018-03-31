setwd("D:/R")
mydata=read.csv("zjrevenue3.csv")
mydata=mydata[,-1]
summary(mydata)
dim(mydata)
Min<-sapply(mydata,min)
Max<-sapply(mydata,max)
Mean<-sapply(mydata,mean)
SD<-sapply(mydata,sd)
cbind(Min,Max,Mean,SD)

round(cor(mydata,method=c("pearson")),2)

library(car)
fit=lm(y~.,data=mydata)
round(vif(fit))

#lasso
install.packages("ISLR")
library(ISLR)
str(mydata)
mydata<-na.omit(mydata)
x<-model.matrix(y~.,mydata)[,-1]
x
y<-mydata$y
y
set.seed(1)
install.packages("glmnet")
library(glmnet)
set.seed(1)
train=sample(1:nrow(x),nrow(x)*3/4)
test=(-train)
y.test=y[test]
grid<-10^seq(10,-2,length = 100)
lasso.mod=glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod)　#绘制系数图像
plot(lasso.mod, main = "The lasso")

#使用交叉验证并计算相应的测试误差
set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=1,nfolds=5)
plot(cv.out,main="图1：交叉验证")
bestlam=cv.out$lambda.min
bestlam

lambda.1se=cv.out$lambda.1se #输出单标准差范围内最优lambda

lambda.1se

lasso.pred=predict(lasso.mod,s=bestlam,newx=x[test,])

mean((lasso.pred-y.test)^2)  #计算均方误差

out=glmnet(x[train,],y[train],alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)
round(lasso.coef,5)
lasso.coef[lasso.coef!=0]
y.pred=predict(out,s=bestlam,newx=x[test,])



round(lasso.coef,5)
round(lasso.coef[lasso.coef!=0],5)

mean((y.pred-y.test)^2)   #计算均方误差

sqrt(mean((y.pred-y.test)^2))

out1=glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out1,type="coefficients",s=lambda.1se)
round(lasso.coef,5)
lasso.coef[lasso.coef!=0]
y.pred=predict(out,s=lambda.1se,newx=x[test,])

mean((y.pred-y.test)^2) #计算均方误差

sqrt(mean((lasso.pred-y.test)^2))

#普通最小二乘法
lm.sol<-lm(y~., data=mydata[train,])
summary(lm.sol)
round(lm.sol$coefficients,3)
lm.predict=predict(lm.sol,mydata[test,])
lm.predict
mean((lm.predict - y[test])^2)
sqrt(mean((lm.predict - y[test])^2))


###对整个数据集使用最优子集选择，以获得该11变量模型的参数估计结果
install.packages("leaps")
library(leaps)

par(mfrow=c(1,1))
#2.向前逐步选择和向后逐步选择#
#向前逐步选择#
regfit.fwd=regsubsets(y~.,mydata[train,],method="forward",nvmax=11)
reg.fwd.summary=summary(regfit.fwd)
reg.fwd.summary
reg.fwd.summary$bic   #输出各个模型的bic

plot(reg.fwd.summary$bic,xlab="Number of Variables",ylab="bic",type="l",main="向前逐步选择BIC图")
plot(reg.fwd.summary$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l",main="向前逐步选择调整R2")
points(11,reg.fwd.summary$adjr2[11],col="red",cex=2,pch=20)
which.min(reg.fwd.summary$bic)
BIC(regfit.fwd)
points(11,reg.fwd.summary$bic[11],col="red",cex=2,pch=20)
round(coef(regfit.fwd,11),3)

predict.regsubsets=function(object,newdata,id,...)
{
  form=as.formula((object$call[[2]]))
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  xvars=names(coefi)
  mat[,xvars]%*%coefi
}

newdata=mydata[test,]
pred=predict.regsubsets(regfit.fwd,newdata,id=11)

MSE=mean((pred-mydata[test,]$y)^2) #计算MSE
MSE
RMSE=sqrt(MSE)
RMSE
round(data.frame(MSE,RMSE),3)

#向后逐步选择
regfit.bwd=regsubsets(y~.,mydata[train,],method="backward",nvmax=12)
reg.bwd.summary=summary(regfit.bwd)
reg.bwd.summary$rsq   #输出各个模型的R^2
plot(reg.bwd.summary$bic,xlab="Number of Variables",ylab="bic",type="l",main="向后逐步选择BIC图")
which.min(reg.bwd.summary$bic)
points(12,reg.bwd.summary$bic[12],col="red",cex=2,pch=20)
plot(reg.bwd.summary$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l",main="向后逐步选择调整R2")
points(11,reg.bwd.summary$adjr2[11],col="red",cex=2,pch=20)
reg.bwd.summary$bic 
round(coef(regfit.bwd,12),3)


newdata=mydata[test,]
pred=predict.regsubsets(regfit.bwd,newdata,id=12)

MSE=mean((pred-mydata[test,]$y)^2) #计算MSE
MSE
RMSE=sqrt(MSE)
RMSE
round(data.frame(MSE,RMSE),3)




#2.2.1 首先定义一个向量将数据集中的每个观测归为k=10折中的某一折，并定义一个存储计算结果的矩阵
k=10
set.seed(1)
folds=sample(1:k,nrow(mydata[train,]),replace=TRUE)
cv.errors=matrix(NA,k,10,dimnames=list(NULL,paste(1:10)))

#2.2.2 编写循环语句实现交叉验证
for(j in 1:k)
{
  best.fit=regsubsets(y~.,mydata[folds!=j,],nvmax=16)
  for(i in 1:10)
  {
    pred=predict(best.fit,mydata[folds==j,],id=i)
    cv.errors[j,i]=mean((mydata$y[folds==j]-pred)^2)
  }
}
mean.cv.errors=apply(cv.errors,2,mean)  #求矩阵cv.errors的列平均值向量
mean.cv.errors     #该向量的第j个元素表示j个变量模型的交叉验证误差
par(mfrow=c(1,1))
plot(mean.cv.errors,type="b",main="交叉验证各个测试集均方误差") #绘制交叉验证各个测试集均方误差
which.min(mean.cv.errors)   #输出交叉验证所选择的模变量数
points(5,mean.cv.errors[5],col="red",cex=2,pch=20)


#2.2.3 对数据集使用最优子集选择，以获得该5变量模型的参数估计结果
reg.best=regsubsets(y~.,mydata[train,],nvmax=16)
round(coef(reg.best,5),3)
newdata=mydata[test,]
newdata
pred=predict.regsubsets(reg.best,newdata,id=5)
data.frame(pred,mydata[test,]$y)
mean((pred-mydata[test,]$y)^2) #计算MSE
sqrt(mean((pred-mydata[test,]$y)^2))

#岭回归
#基于训练样本集建立岭回归模型

#使用交叉验证选择合适的lambda值
set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=0)
plot(cv.out)
bestlam=cv.out$lambda.min  #寻找最优的lambda
bestlam 
lambda.1se=cv.out$lambda.1se #输出单标准差范围内最优lambda

lambda.1se

out=glmnet(x[train,],y[train],alpha=0)
predict(out,type="coefficients",s=bestlam )[1:16,]
round(predict(out,type="coefficients",s=bestlam)[1:16,],3)
ridge.pred=predict(out,s=bestlam,newx=x[test,])


mean((ridge.pred-y.test)^2) #计算测试均方误差ＭＳＥ
sqrt(mean((ridge.pred-y.test)^2))


