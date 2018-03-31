###第三章 图形初阶
###3.2 一个简单的例子
dose<-c(20,30,40,45,60)
drugA<-c(16,20,34,45,60)
drugB<-c(20,30,10,50,60)
plot(dose,drugA,type = "b")   #画出折线图，type = "b"表示同时绘制点和线


###3.3 图形参数

##修改图形的两种方式
# 1、
  opar<-par(no.readonly=T)  #生成一个可以修改的当前图形参数列表
  par(lty=2,pch=17)   #绘制点使用符号为17，线条类型为2
  plot(dose,drugA,type = "b")  
  par(opar)  #还最初的默认图形
# 2、  
  plot(dose,drugA,type = "b",lty=2,pch=17) #直接在后面添加
  
###3.3.1 符号和线条
  #pch 符号类型, cex 符号大小, lty 线条类型, lwd 线条宽度
  plot(dose,drugA,type = "b",lty=2,pch=17,cex=2,lwd=3)
  #线条类型为2（虚线），点的符号为实三角形，大小默认原来的两倍。
###3.3.2 颜色
  #col 绘图颜色  col="red", col.axis 坐标轴刻度文字颜色
  #col.lab坐标轴标签的颜色, col.main 标题颜色
  #col.sub副标题颜色, fg 图形的前景色, bg 图形的背景色
#绘制彩色饼图
# 1、 
  n<-10
  mycolors<-rainbow(n)   #生成“彩虹型”颜色
  pie(rep(1,n),label=mycolors,col=mycolors)   #绘制彩色饼图
# 2、  
  library(RColorBrewer)
  n<7
  mycolor<-brewer.pal(n,"Set1")
  barplot(rep(1,n),col = mycolor)
#绘制灰色度饼图
  n<-10
  mygrays<-gray(0:n/n)  #生成“多阶灰度”颜色
  pie(rep(1,n),label=mygrays,col=mygrays)
###3.3.3 文本属性
  plot(dose,drugA,type = "b",lty=2,pch=17,cex=2,lwd=3,col.axis="red",col.lab="blue",fg="red")

###3.3.4 图形尺寸与边界尺寸
  par(pin=c(4,3),mai=c(1,.5,1,.2))
  #生成一幅4英寸宽，3英寸高，上下边界为1英寸、左边界为0.5英寸、右边界为0.2英寸的图形。
  
###3.4 添加文本、自定义坐标轴和图例
  #标题（main）,副标题（sub）,坐标轴标签（xlab、ylab）,坐标轴范围（xlim，ylim）
  #一个例子
  plot(dose,drugA,type = "b",col="red",lty=2,pch=2,lwd=2,
       main="Clinical Trials for Drug A",
       sub = "This is hypothetical data",
       xlab = "Dosage",
       ylab = "Drug Response",
       xlim =c(0,60),ylim = c(0,70) )
  
###3.4.1 标题
  #利用title()
###3.4.2 坐标轴
  #利用axis()
  #axis(side, at = NULL, labels = TRUE, tick = TRUE, line = NA,
       pos = NA, outer = FALSE, font = NA, lty = "solid",
       lwd = 1, lwd.ticks = lwd, col = NULL, col.ticks = NULL,
       hadj = NA, padj = NA, ...)
#一个例子☆
      dose<-c(20,30,40,45,60)
      drugA<-c(16,20,34,45,60)
      drugB<-c(20,26,38,50,65)
      opar<-par(no.readonly=T)  #生成一个可以修改的当前图形参数列表
      par(lty=2,pch=17)   #绘制点使用符号为17，线条类型为2
      
      plot(dose,drugA,type = "b",col="red",lty=2,pch=2,lwd=2,
           main="Clinical Trials for Drug A",
           sub = "This is hypothetical data",
           xlab = "Dosage",
           ylab = "Drug Response",
           xlim =c(0,60),ylim = c(0,70) )  #绘制图形
      
      lines(dose,drugB,type="b",
            pch=17,lty=2,col="blue")    #添加另一条图形
      
      abline(h=c(30),lwd=1.5,lty=2,col="gray")  #添加为30的参考线
      
      ###install.packages("Hmisc")  
      library(Hmisc)
      minor.tick(nx=3,ny=3,tick.ratio=0.5)    #添加次要刻度线
      
      legend("topleft",inset = .05,title = "Drug Type",legend=c("A","B"),
             lty = c(1,2),pch=c(15,17),col=c("red","green"))   #添加图例
      
      par(opar)  #还原初始图形参数设置
  
###3.4.5 文本标注
      text(dose,drugB,row,names(data),cex=0.5,pos=4)
      
###3.5 图形的组合
  #利用par()中的 mfrow=c(nrows,ncols)来按行填充，mfcol=c(nrows,ncols)按列填充
#生成两行两列的矩阵
  attach(mtcars)
  opar<-par(no.readonly = T)
  
  par(mfrow=c(2,2))     #按照行填充两行两列的矩阵
  plot(wt,mpg,main="Scatterplot of wt vs. mpg")
  plot(wt,disp,main="Scatterplot of wt vs. disp")
  hist(wt,main="Histogram of wt")
  boxplot(wt,main="Boxplot of wt")
  
  par(opar)
  detach(mtcars)
#生成3行1列的图形  （与上题相似）
  attach(mtcars)
  opar<-par(no.readonly = T)
  
  par(mfrow=c(3,1))     #按照行填充两行两列的矩阵
  plot(wt,mpg,main="Scatterplot of wt vs. mpg")
  hist(wt,main="Histogram of wt")
  boxplot(wt,main="Boxplot of wt")
  
  par(opar)
  detach(mtcars)
  
#利用layout()制定组合图形的位置
  attach(mtcars)
  layout(matrix(c(1,1,2,3),2,2,byrow = T))
  hist(wt)
  hist(mpg)
  hist(disp)
  detach(mtcars)
  
  layout(matrix(c(1,1,2,3),2,2,byrow = T),
         widths = c(3,1),heights = c(1,2))  #利用widths，heights 精确分布大小。

#图形布局的精细控制
  #利用fig=完成任务
  opar<-par(no.readonly = T)
  par(fig=c(0,0.8,0,0.8))  #占据横向范围0~0.8，纵向范围0~0.8
  plot(mtcars$wt,mtcars$mpg,xlab = "Miles Per Gallon",ylab="Car Weight")
  
  par(fig=c(0,0.8,0.55,1),new=T)  #占据横向0~0.8，纵向0.55~1
  boxplot(mtcars$wt,horizontal=T,axes=F)   
  par(fig=c(0.65,1,0,0.8),new=T)  #占据横向0.65~1,纵向0~0.8
  boxplot(mtcars$mpg,axes=F)
  
  mtext("Enhanced Scatterplot",side=3,outer=T,line=-3,cex=1.5)  #利用mtext设置标题
  par(opar)
  
