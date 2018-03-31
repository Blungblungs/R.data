#p68页2.1
rep(c(3,2,1),c(3,4,5))

#P68页2.2
A<-matrix(1:16,4,4);A
B<-matrix(1:16,4,4,byrow=TRUE);B
C<-A+B;C
D<-A%*%B;D
E<-A*B;E

A<-A[-3,];A
B<-B[,-3];B
E=A%*%B;E  

#P68页2.3
A<-matrix(c(1:8,10),3,3,byrow=TRUE);A
b<-matrix(1,3,1);b
solve(A,b)
solve(A)%*%b

#P68页2.4
x<-1:5;x
y<-seq(from=2,to=10,by=2);y
#内积
x%*%y 
crossprod(x,y)
t(x)%*%y
#外积
x%o%y
outer(x,y)
x%*%t(y)

#P68页2.7
#1)读入数据：data.frame()
D1<-data.frame(Sex=c("F","F","F","F","F","M","M","M","M","M"),
              Age=c(14,16,15,17,15,14,16,14,15,16),
              Height=c(156,158,161,156,153,162,157,159,163,165),
              Weight=c(42.3,45,48.5,51.5,44.6,48.8,46.7,49.9,50.2,53.7))
D1
#2）读入文本文件：read.table()
write.table(D1,"E:\\Rprogram\\data\\height_weight_1.txt")
D2<-read.table("E:\\Rprogram\\data\\height_weight_1.txt")
D2
#如果用scan()
D3<-scan("E:\\Rprogram\\data\\height_weight_2.txt",what=list(Sex="",Age=0,Height=0,Weight=0))
D3
D4<-as.data.frame(D3);D4

#3）写成文本文件.csv
write.csv(D1,"E:\\Rprogram\\data\\height_weight_3.csv",quote=F,row.names=F)

#补充题：流行病学数据Deer.xls
#任务1：将数据从Excel中提取到ascii（文本）文件中，并且将它读入到R中，
要求分别用两种方法read.table/read.csv()和scan()函数，使用两个不同的变量名存储数据，比较它们的不同点，并测试验证结果的不同。
#任务2：提取数据中的LCT变量，它表示动物的长度，对其计算平均值，并将其均方根加到数据框中。
#任务3：用dim(),nrow()和ncol()确定原数据的观测数和变量个数

Deer1=read.csv("E:\\Rprogram\\data\\Deer1.csv")
Deer1
class(Deer1);
#或者is.list(Deer1);is.data.frame(Deer1)

Deer2<-scan("E:\\Rprogram\\data\\Deer2.txt",what=list(Farm="",Month=0,Year=0,Sex=0,clas1_4=0,LCT=0,KFI=0,vas_2=0,Tb=0))
Deer2
class(Deer2);
#或者is.data.frame(Deer2);is.list(Deer2)

Length<-Deer1$LCT;Length
mean(Length,na.rm = TRUE)    #注意有缺失值要去掉

Deer1$sq_LCT<-sqrt(mean(Length^2,na.rm = TRUE))   #变量Length的均方根:先平方，再平均，最后开方
    #如果任务2是增加长度的平方根到数据框中的话：Deer1$sq_LCT=sqrt(Length)  
Deer1

			
dim(Deer1);nrow(Deer1);ncol(Deer1)


