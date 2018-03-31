a<-c("F","F","F","F","F","M","M","M","M","M")
b<-c(14,16,15,17,15,14,16,14,15,16)
c<-c(156,158,161,156,153,162,157,159,163,165)
d<-c(42.3,45,48.5,51.5,44.6,48.8,46.7,49.9,50.2,53.7)
x<-data.frame(a,b,c,d)
write.table(x,"D:/R/我的资料集/自学/R语言与统计分析/2017.10.19/mydata.txt")
read.table("D:/R/我的资料集/自学/R语言与统计分析/2017.10.19/mydata.txt")
write.csv(x,"D:/R/我的资料集/自学/R语言与统计分析/2017.10.19/mydata.csv")
read.csv("D:/R/我的资料集/自学/R语言与统计分析/2017.10.19/mydata.txt")


#2.补充题1：流行病学数据Deer.xls
#任务1：将数据从Excel中提取到ascii（文本）文件中，
#并且将它读入到R中，要求分别用两种方法read.table/read.csv()
#和scan()函数，使用两个不同的变量名存储数据，比较它们的不同点，并测试验证结果的不同。
setwd("D:/R/我的资料集/自学/R语言与统计分析/2017.10.19")
data1<-read.table("deer.txt",header=T)
head(data1)

data2<-scan("deer.txt",what=list(Farm="",Month="",Year="",Sex="",clas1_4="",LCT="",KFI="",vas_2="",Tb=""))
data2

#任务2：提取数据中的LCT变量表示动物的长度，对其计算平均值，并将其平方根加到数据框中。
dataLCT<-data1$LCT
dataLCT<-dataLCT[!is.na(dataLCT)]
dataLCT
meanLCT<-mean(dataLCT)
meanLCT

#任务3：用dim(),nrow()和ncol()确定原数据的观测数和变量个数
dim(data1)
nrow(data1)
ncol(data1)


##3. 补充题2：
#数据文件Vegetation2.txt是有关美国草原植物的数据，它是在8个截面上通过几年时间的测量得到的。其中：变量Transect表示截面编号，变量Time表示观测年份，变量R表示物种丰富度，BARESOIL表示裸露土壤。在一个窗口中作以下六幅图，形成3×2的矩阵图形。
#（1）绘制物种丰富度对裸露土壤的散点图，要求设置坐标轴和标题：横坐标轴为“裸露土壤”，纵坐标轴为“物种丰富度”，坐标轴上下限取为各变量的取值范围，主标题为“散点图”；

data3<-read.table("Vegetation.txt",header=T)
plot(R~BARESOIL,data=data3)

#（2）对（1）中的散点图，绘图符号用实心三角形表示，颜色为红色，大小为2倍（坐标轴等采用默认设置，下同）；
plot(R~BARESOIL,data=data3,col="red",pch=17,ps=2)

#（3） 对（1）中的散点图，要求每个截面的观测值用不同的符号和颜色区分
plot(R~BARESOIL,data=data3,col=c("red","green"),pch=c(17,1),ps=c(2,10))

#（4） 对（1）中的散点图，1975年以前的观测点用红色空心圆，1975年以后的用蓝色实心圆
my<-c(1,2)[data3$Time]
plot(R~BARESOIL,data3,col=my,pch=my)
x1<-subset(data3,Time<1975)
x2<-subset(data3,Time>1975)
plot(R~BARESOIL,data=x1,col="red",pch=17,ps=2)
plot(R~BARESOIL,data=x2,col="red",pch=17,ps=2)

plot(R~BARESOIL,data=data3,col=c("red","green"),pch=c(17,1),ps=c(2,10))

#（5）对（1）中的散点图，绘制物种丰富度对裸露土壤的二次多项式拟合曲线，并标记出拟合值的点（符号用“*”表示，大小为2倍默认值，蓝色）
m1<-
  
  
  
  
  
  
  