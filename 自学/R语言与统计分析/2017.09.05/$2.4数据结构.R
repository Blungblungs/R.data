#向量的下标与自己的提取
x<-rep(1:4,10)
y<-sequence(1:6)
#正整数向量
x[1:10]
x[c(1,3)]
which.max(y)
y[which.max(y)];y
#负整数向量
y<-y[-c(1,5)];y
#字符串向量
fruit<-c(5,10,1,20)
names(fruit)<-c("o","e","a","q")
fruit
lunch<-fruit[c("a","q")]
lunch
#逻辑向量
x<-rep(1:4,10)
x
x<-x>2
x[x>2]
x[x[x>2]<=3]
y<-runif(100,min=0,max=5)
y
y[y<2.5]
sum(y[y<2.5])

y<-x[(!is.na(x))&(x>0)]
#2.4.4数组与矩阵的建立
?array
x<-array(1:8,c(2,4))
#矩阵的建立
x<-array(1:9,c(3,3))
x
y<-matrix(1:9,nr=3,nc=3,byrow=T)
y
z<-matrix(1:4,2,2,dimnames=list(c("a","s"),c("xz","gh")))
z
?matrix
dimnames(z)
#数组与矩阵的下标与子集的提取
x
x[2,2]
x[x>5&x<7]
y
y[-1,]
y[,2]<-NA
y
y[-2,]
y[is.na(y)]<-5；y


#对矩阵的运算
x
t(x)
diag(x)
y
rbind(x,y)
?rbind
cbind(x,y)
x*y
x%*%y
det(x)
x
apply(x,1,mean)
apply(x,2,mean)
apply(x,1,cumsum)
?t
scale(x)
sweep(x,2,)
?scale

#2.4.5 数据框的建立
#data.frame
x
y
z<-data.frame(sads=x,ada=y)
z

min(z)
cummax(z)
max(z)
apply(z,1,mean)
attach(Puromycin)
summary(Puromycin)
pairs(Puromycin)
?pairs









