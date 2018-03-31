install.packages("ggplot2")
library(ggplot2)
head(diamonds)

options(max.print=999999)
getOption("max.print")
diamonds

#利用数据集diamonds
#第一个散点图
qplot(carat,price,data=diamonds)
#对数变换
qplot(log(carat), log(price), data = diamonds)
#衍生变量 体积vs重量
qplot(carat,x*y*z,data=diamonds)
#装饰属性
set.seed(1410) # 生成随机种子
dsmall <- diamonds[sample(nrow(diamonds), 100), ]
#颜色colour=color
qplot(carat, price, data = dsmall,colour=color)
#形状shape = cut
qplot(carat, price, data = dsmall, shape = cut)
#透明度alpha = I(1/10)
qplot(carat, price, data = diamonds, alpha = I(1/10))
qplot(carat, price, data = diamonds, alpha = I(1/100))
qplot(carat, price, data = diamonds, alpha = I(1/200))
#几何对象  利用geom
#平滑曲线
qplot(carat, price, data = dsmall, geom = c("point", "smooth"))
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))
#多项式拟合
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),span = 0.2)
#箱线图
qplot(color, price / carat, data = diamonds, geom = "boxplot")
#jitter
qplot(color, price / carat, data = diamonds, geom = "jitter",shape = cut)
#直方图
qplot(carat, data = diamonds, geom = "histogram")
#设置直方图的区间 binwidth = 0.1,xlim = c(0,3)
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.1,xlim = c(0,3))
#设置色彩  fill = color
qplot(carat, data = diamonds, geom = "histogram", fill = color)
#密度曲线图
qplot(carat, data = diamonds, geom = "density",colour=color)
#柱状图
qplot(color, data = diamonds, geom = "bar")

#利用数据集economics
economics
#用连线图表现时间序列
qplot(date, unemploy / pop, data = economics, geom = "line")
#路径表达方式
qplot(unemploy / pop, uempmed, data = economics,geom = c("point", "path"))
#facet 分组
qplot(carat, data = diamonds, facets = color ~ .,geom = "histogram", binwidth = 0.1, xlim = c(0, 3),colour=color)
#其它选项
#xlim, ylim, log, main, xlab, ylab
#xlab, ylab
qplot(carat, price, data = dsmall,xlab = "Price ($)", ylab = "Weight (carats)",main = "Price-weight relationship")
#xlim, ylim
qplot(carat, price/carat, data = dsmall,ylab = expression(frac(price,carat)),xlab = "Weight (carats)",main="Small diamonds",xlim = c(.2,1))
#log
#对两条坐标轴同时进行对数变换
qplot(carat, price, data = dsmall, log = "xy")




