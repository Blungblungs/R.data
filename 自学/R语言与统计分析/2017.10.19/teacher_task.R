#补充作业：R的绘图功能
#实验内容：
#数据文件Vegetation2.txt是有关美国草原植物的数据，它是在8个截面上通过几年时间的测量得到的。其中：变量Transect表示截面编号，变量Time表示观测年份，变量R表示物种丰富度，BARESOIL表示裸露土壤。
#在一个窗口中作以下六幅图，形成3×2的图形矩阵。
#（1）绘制物种丰富度对裸露土壤的散点图，要求设置坐标轴和标题：横坐标轴为“裸露土壤”，纵坐标轴为“物种丰富度”，坐标轴上下限取为各变量的取值范围，主标题为“散点图”；
#（2）对（1）中的散点图，绘图符号用实心三角形表示，颜色为红色，大小为2倍（坐标轴等采用默认设置，下同）；
#（3）对（1）中的散点图，要求每个截面的观测值用不同的符号和颜色区分
#（4）对（1）中的散点图，1975年以前的观测点用红色空心圆，1975年以后的用蓝色实心圆
#（5）对（1）中的散点图，绘制物种丰富度对裸露土壤的二次多项式拟合曲线，并标记出拟合值的点（符号用“*”表示，大小为2倍默认值，蓝色）
#（6）对变量R作直方图


setwd("D:/R/我的资料集/自学/R语言与统计分析/2017.10.19")


Veg <- read.table(file="Vegetation.txt",header =TRUE)
str(Veg)
dim(Veg)

windows(height=80,width=60)
par(mfcol=c(3,2))

xlimt<-c(min(Veg$BARESOIL),max(Veg$BARESOIL))
ylimt<-c(min(Veg$R),max(Veg$R))

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "裸露土壤",
     ylab = "物种丰富度", main = "（1）散点图",
     xlim =xlimt, ylim =ylimt)

plot(x = Veg$BARESOIL, y = Veg$R,
     pch = 17,col="red",cex=1.2,
     main = "（2）散点图")

plot(x = Veg$BARESOIL, y = Veg$R,
     pch = Veg$Transect,col = Veg$Transect,
     main = "（3）散点图")


Veg$Time2 <- Veg$Time
Veg$Time2[Veg$Time <= 1974] <- 1
Veg$Time2[Veg$Time > 1974] <- 16

Veg$Col2 <- Veg$Time
Veg$Col2[Veg$Time <= 1974] <- "red"
Veg$Col2[Veg$Time > 1974] <-"blue"

plot(x = Veg$BARESOIL, y = Veg$R,
     pch = Veg$Time2,col=Veg$Col2,
     main = "（4）散点图")

plot(R~BARESOIL, data = Veg,main = "（5）散点图")

M1 <-lm(R~BARESOIL+I(BARESOIL^2), data = Veg)
Fit<-fitted(M1)
Ord<-order(Veg$BARESOIL)  #返回按从小到大的排列顺序

lines(Fit[Ord]~BARESOIL[Ord],data = Veg,col="blue",type="o",pch="*",cex=2,lwd=2)
# 注意到：点的连结顺序(x1,y1),(x2,y2)。。。，x1不一定小于x2

hist(Veg$R,main="(6)变量R的直方图")