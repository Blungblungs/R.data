#2.6 图形功能

demo(graphics)
demo(persp)
data1<-read.delim("clipboard")
data2<-na.omit(data1)
head(data2)
data3<-cbind(1:10,rep(1:5,2))

attach(data2)

plot(LCT~KFI,data2)

sunflowerplot(LCT~KFI,data2)
?sunflowerplot
sunflowerplot(x = sort(2*rnorm(100)), y = round(rnorm(100), 0))

pie(abs(LCT[1:6]))

boxplot(LCT)

stripchart(LCT)

coplot(LCT~KFI|vas_2)

matplot(LCT,KFI)

mosaicplot(LCT[1:6])

pairs(data2)

qqplot(LCT,KFI)

image(data3,xlim = c(0,1),ylim = c(-1,2),main="image形成的图片",sub="图一",xlab="x",ylab="y")
      
contour(data3)
filled.contour(data3)

persp(data3)
stars(data3)

###2.6.2低级绘图命令
points(data3)
?points
#例子points()
plot(-4:4, -4:4, type = "n")  # setting up coord. system
points(rnorm(200), rnorm(200), col = "red")
points(rnorm(100)/2, rnorm(100)/2, col = "blue", cex = 1.5)
lines(1)
abline(2,3)
abline(h=2)

#例子rect()
?rect
plot(c(100, 200), c(300, 450), type= "n", xlab = "", ylab = "")
rect(100, 300, 125, 350) # transparent
?legend()
?seq
x <- seq(-pi, pi, len = 65)
plot(x, sin(x), type = "l", ylim = c(-1.2, 1.8), col = 3, lty = 2)
points(x, cos(x), pch = 3, col = 4)
lines(x, tan(x), type = "b", lty = 1, pch = 4, col = 6)
title("legend(..., lty = c(2, -1, 1), pch = c(NA, 3, 4), merge = TRUE)",
      cex.main = 1.1)
legend(-1, 1.9, c("sin", "cos", "tan"), col = c(3, 4, 6),
       text.col = "green4", lty = c(2, -1, 1), pch = c(NA, 3, 4),
       merge = TRUE, bg = "gray90")
text(0,0,expression(p==over(1,1+e^-(beta*x+alpha))))

###2.6.3绘图参数
?par

###2.6.4一个实例
##利用Puromycin
dim(Puromycin)
head(Puromycin)
attach(x)
x<-subset(Puromycin,state=="treated")
?subset
plot(rate~conc)

#美化图形












