#判别分析
#马氏距离 mahalanobis
#线性判别（MASS:lda）,协差阵相等情况
#prior贝叶斯判别先验概率；CV是否使用刀切法计算误判概率

library(MASS)
data(iris)
lda1 <- lda(Species~.,data=iris)
lda1
iris.pred=predict(lda1)
table(iris$Species,iris.pred$class)
plot(iris.pred$x)
points(iris.pred$x[1:50,])
points(iris.pred$x[51:100,],col=2)
points(iris.pred$x[101:150,],col=3)

#二次判别（MASS:qda）,协差阵不相等情况
qda <- qda(Species~.,prior=c(1,1,1)/3,data=iris)
qda
iris.pred2=predict(qda,iris[,-5])$class
table(iris$Species,iris.pred2)

