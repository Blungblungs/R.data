#第5页T1.3：任取两个非零实数，作加、减、乘、除、乘方、开方、指数、对数运算
 2+3;2-3;2*3;2/3;2**3;2**(1/2);exp(2);log(2);

#第5页T1.4：安装并加载程序包R Commander
install.packages("Rcmdr")
library("Rcmdr")

#第5页T1.5：安装并加载程序包animation
install.packages("animation")
library("animation")
#蒲丰投针
buffon.needle(nmax=500,interval=0) 
##帮助文件里的例子
oopt = ani.options(nmax = ifelse(interactive(), 500, 2), interval = 0.05)
par(mar = c(3, 2.5, 0.5, 0.2), pch = 20, mgp = c(1.5, 0.5, 0))
buffon.needle()
#中心极限定理
f=function(n)rchisq(n,5)
clt.ani(FUN=f)