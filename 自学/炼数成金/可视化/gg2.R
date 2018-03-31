library(ggplot2)
#利用 数据集 mpg
mpg

#散点图
#（Mapping）利用数据到装饰属性的映射
qplot(displ, hwy, data = mpg, colour = factor(cyl))#Disp映射到x坐标，hwy映射到y坐标，cyl映射到颜色
#（geom）几何对象决定统计图的类型
#Scaling
#更复杂的例子geom_smooth()  facets = . ~ year
qplot(displ, hwy, data=mpg, facets = . ~ year) + geom_smooth()
#图层（layer）
#layer(geom, geom_params, stat, stat_params, data, mapping,position)
p <- ggplot(diamonds, aes(x = carat))
p <- p + layer(
  geom = "bar",
  geom_params = list(fill = "steelblue"),
  stat = "bin",
  stat_params = list(binwidth = 2)
        )
summary(p)
p










