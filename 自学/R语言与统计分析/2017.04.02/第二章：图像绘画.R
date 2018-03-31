#2.6  R的图形功能
demo(graphics)  #二维图形实例
    #三维图形实例


#三维图示意图
{sinc <- function(x) 
{ y <- sin(x)/x ; y[is.na(y)] <- 1; y }10 * sinc( sqrt(x^2+y^2) ) }
sinc.exp <- expression(z == Sinc(sqrt(x^2 + y^2)))
z <- outer(x, y, rotsinc)
oldpar <- par(bg = "white")
persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue")
title("吴统的金针菇")



#2.6.3绘图参数
help(bar)
dim(Puromycin)  #建立内嵌数据Puromycin
head(Puromycin)  #显示数据的前几项
PuroA=subset(Puromycin,state=="treated")    #定义状态为treated的数据





help(subset)

#绘制并列图
windows(width=8,height=8)  
par(mfrow=c(2,2))         #做了一个2x2表格
PuroA=subset(Puromycin,state=="treated")  #挑选出state=="treated"
PuroB=subset(Puromycin,state=="untreated")

plot(rate~conc,data=PuroA,pch=1,col=4,cex=2.5,bg="red")
title("我猜")
plot(rate~conc,data=PuroB,pch=2,col=1,cex=2.5,bg="red")
title("你是")
plot(rate~conc,data=PuroA,pch=1,col=4,cex=2.5,bg="red")
title("一只")
plot(rate~conc,data=PuroB,pch=2,col=1,cex=2.5,bg="red")
title("骚猪")


#2.7 R编程
#2.7.1  循环和向量化
# for while repeat

for(i in 1:7) print (1:i)
i=1
while (i<=7)
  {
    print(1:i) 
    i=i+1
  }


i=1
repeat
  {
    print (1:i)
    i=i+1
    if(i>5)  break
  }

#作业题  P69
#（1）利用rep（）建立矩阵
help(rep)  #查找rep（）
rep(c(3,2,1),c(3:5))
A


#（2）
A=array(1:16,c(4,4))
B=matrix(1:16,4,4,byrow=TRUE)  #建立以行 的矩阵
C=A+B
D=A%*%B
E=A*B
F=cov(A,B)

#（3）
#方法一
A<-matrix(c(1:8,10),3,3,byrow=TRUE);A 
b=array(1,c(3,1));b
G=solve(A,b);G
#方法二
H=solve(A)  #算逆矩阵
X=H%*%b  ;X  

#（4）
x<-c(1:5)  ;x
y<-seq(2,10,by=2) ;y

#内积
x%*%y
crossprod(x,y)
t(x)%*%y
#外积
x%o%y
outer(x,y)
x%*%t(y)

#(7)
#   1)读入数据：data.frame()
D1<-data.frame(Sex=c("F","F","F","F","F","M","M","M","M","M"),
              Age=c(14,16,15,17,15,14,16,14,15,16),
              Height=c(156,158,161,156,153,162,157,159,163,165),
              Weight=c(42.3,45,48.5,51.5,44.6,48.8,46.7,49.9,50.2,53.7))
D1
#   2）读入文本文件：read.table()
write.table(D1,"D:\\R\\height_weight_1.txt")
D2<-read.table("D:\\R\\height_weight_1.txt")
D2

#   3）写成文本文件.csv
write.csv(D1,"D:\\R\\height_weight_3.csv",quote=F,row.names=F)









