####第七章 基本统计分析
###7.1 描述性统计分析
##7.1.1  方法云集
#利用内部数据
vars<-c("mpg","hp","wt")
head(mtcars[vars])
#1、通过summary()计算描述性统计量
  #summary() 函数提供了最小值、最大值、四分位数和数值型变量的均值，
  #以及因子向量和逻辑型向量的频数统计。
  summary(mtcars[vars])
#2、通过sapply()
  sapply(mtcars[vars],mean)
#3、通过Hmise包中的describe()
  #Hmisc 包中的 describe() 函数可返回变量和观测的数量、缺失值和唯一值的数目、
  #平均值、分位数，以及五个最大的值和五个最小的值。
  install.packages("Hmisc")
  library(Hmisc)
  describe(mtcars[vars])
#4、各种都行 见R语言实战P132
  
##7.1.2 分组计算描述性统计
#1、利用aggregate()分组获取描述性统计量
  aggregate(mtcars[vars],by=list(am=mtcars$am),mean)
#2、利用by()分组获取描述性统计量  
  dstats<-function(x)(c(mean=mean(x),sd=sd(x)))
  by(mtcars[vars],mtcars$am,dstats)
#3、利用reshape()包分组计算概述统计量
  library(reshape)
  #太难

###7.2 频数表和列联表
  #数据来源：vad包Arthritis数据集
  library(vcd)
  head(Arthritis)
##7.2.1 生成频数表
#1、 一维列联表
  #利用table()简单生成频数统计表
  mytable<-with(Arthritis,table(Improved));mytable
  #利用prop.table()将频数转化为比例值
  prop.table(mytable)
  #利用prop.table()*100将频数转化为比例值
  prop.table(mytable)*100
#2、 二维列联表
  #利用table()、xtabs()
  mytable<-xtabs(~Treatment+Improved,data=Arthritis);mytable
  #利用margin.table()和 prop.table() 分别生成边际频数和比例
  margin.table(mytable,1)
  prop.table(mytable,1)   #1代表第一个变量
  #利用addmargins() 添加边际和
  addmargins(mytable)
  #利用gmodels包中的CrossTable()
  install.packages("gmodels")
  library(gmodels)
  CrossTable(Arthritis$Treatment,Arthritis$Improved)
#3、 三维列联表  
  mytable<-xtabs(~Treatment+Sex+Improved,data=Arthritis);mytable
  ftable(mytable)  #利用ftable()画出紧凑的表格
  margin.table(mytable,1)
  margin.table(mytable,2)
  margin.table(mytable,3)
  margin.table(mytable,c(1,3))
  #详细见p142页
##7.2.2 独立性检验
#1、卡方独立性检验
  #利用chisq.test()对二维表的行列变量进行
  library(vcd)
  mytable<-xtabs(~Treatment+Improved,data=Arthritis)
  chisq.test(mytable)
#2、Fisher精确检验
  #利用fisher。test()
  mytable<-xtabs(~Treatment+Improved,data=Arthritis)
  fisher.test(mytable)
#3、Cpchran-Mantel-Haenszel检验
  mytable<-xtabs(~Treatment+Improved+Sex,data=Arthritis)
  mantelhaen.test(mytable)
##7.2.3 相关性的度量
  #利用assocststats()计算二维列联表phi系数、列联系数、Cramer‘s V系数
  library(vcd)
  mytable<-xtabs(~Treatment+Improved,data=Arthritis)
  assocstats(mytable)
  
###7.3 相关
  #数据来源：state.x77
##7.3.1 相关的类型
  #1、Pearson、Spearman、Kendall相关
  #利用cor()、cov()
  states<-state.x77[,1:6]
  cov(states)
  cor(states)
  cor(states,method = "spearman")
  #2、偏相关
  #利用ggm包中的pcor()
  install.packages("ggm")
  library(ggm)
  pcor(c(1,5,2,3,6),cov(states))
  #3、其他类型的相关
  
##7.3.2 相关性的显著性检验
  #利用cor.test()对单个的Pearson、Spearman、Kendall相关系数进行检验
  cor.test(states[,3],states[,5])
  #利用corr.test()
  install.packages("psych")
  library(psych)
  corr.test(states,use="complete")
  
##7.3.3 相关关系的可视化
  
###7.4 t检验
  #数据来源：MASS包中的UScrime
  ##7.4.1 独立样本的检验
  #利用t.test()
  library(MASS)
  t.test(Prob~So,UScrime)
  ##7.4.2 非独立样本的检验
  sapply(UScrime[c("U1","U2")],function(x)(c(mean=mean(x),sd=sd(x))))
  with(UScrime,t.test(U1,U2,paired=T))
  
###7.5 组间差异的非参数检验
  ##7.5.1 两组的比较
  
  
  
  
  
  
  
  
  
  