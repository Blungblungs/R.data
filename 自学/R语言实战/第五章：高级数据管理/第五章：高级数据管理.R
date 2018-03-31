####第五章 高级数据管理

###5.2 数值和字符处理函数
##5.2.1 数学函数
  abs(-5)   #绝对值
  sqrt(25)  #平方根
  ceiling(3.475)  #不小于x的最小整数
  floor(3.475)    #不大于x的最大整数
  trunc(5.99)     #向0的方向截取的x中整数部分
  round(3.475,digits = 2)  #将x舍入为指定位的小数
  signif(3.475,digits = 2) #将x舍入为指定的有效数字位数
  cos(2)   #求余弦值
  acos(-0.416) #求反余弦值    
  log(5,base=2) #对x取以n为底的对数  
  log10(10)   #对x取以10为底的对数  
  exp(2.3026)   #指数函数
##5.2.2 统计函数 
  mean(c(1,2,3,4))   #求平均值
  madian(c(1,2,3,4))  #求中位数
  sd(c(1,2,3,4))     #标准差
  var(c(1,2,3,4))     #方差
  mad(c(1,2,3,4))     #绝对中位差
  quantile(x,c(0.3,0.84))  #求分位数，求x的30%和84%的分位点
  range(c(1,2,3,4))       #求值域
  sum(c(1,2,3,4))         #求和
  diff(c(1,5,23,29),lag=1)   #滞后差分 lag用以指定滞后几项
  min(c(1,2,3,4))           #最小值
  scale(c(1,2,3,4),center = T,scale = T)  #为数据对象x按列进行中心化（center=T），标准化（center=T，scale=T）
##5.2.3 概率函数   
  #假定为标态分布 密度函数(dnorm) 分布函数 (pnorm) 随机数生成 (rnorm)
  #设定随机种子
  #利用set.seed()
  set.seed(1234)   #指定了随机数
  runif(5)
 #生成多元正态数据
  #利用MASS包中的mvrnorm(n,mean,sigma)
  library(MASS)
  options(digits = 3)   
  set.seed(1234)   #设定了一个随机数种子，这样可以在之后重现
  mean<-c(230.7,146.7,3.6)  #构造的均值
  sigma<-matrix(c(15360.8,6721.2,-47.1,6721.2,4700.9,-16.5,-47.1,-16.5,0.3),
                nrow=3,ncol=3)   #构造的方差-协方差阵
  mydata<-mvrnorm(500,mean,sigma)  #生成500个伪随机观测
  mydata<-as.data.frame(mydata)  #从矩阵转换为数据框
  names(mydata)<-c("y","x1","x2")  #为变量指定名称
  dim(mydata)   #观看维数
  head(mydata,n=10)  #显示前10个观测
##5.2.4 字符处理函数
##5.2.5 其他实用函数
  length(c(1,2,3,4))  #对象x的长度
  seq(1,10,2)   #生成一个序列，从1开始到10，隔两位
  rep(1:3,2)    #将x重复n次
  cut(x,n)      #将连续变量x分割为n个水平因子
  pretty(x,n)   #创建美观分割点
##5.2.6 将函数应用在矩阵和数据框中
#1、将函数运用于数据对象
  a<-5
  sqrt(a)
  b<-matrix(runif(12),3,4)
  log(b)
#2、将一个函数运用到矩阵的所有行
  #利用apply(x,margin,fun)  margin=1代表行
  mydata<-matrix(rnorm(30),nrow = 6)
  mydata
  apply(mydata,1,mean)  #计算每行的均值
  apply(mydata,2,mean)  #计算每列的均值
  apply(mydata,2,mean,trim=0.2)  #计算每列的截尾均值
  

##5.3 数据处理难题的一套解决方案
  options(digits = 2)   #限定输出小数点
   
  Student<-c("John Davis","Angela Williams","Bullwinkle Moose",
             "Kobe Bryant","Janice Markhammer","Cheryl Cushing",
             "Reuven Ytzrhak","Greg Knox","Joel England","Mary Rayburn")
  Math<-c(502,600,412,358,495,512,410,625,573,522)
  Science<-c(95,99,80,82,75,85,80,95,89,86)
  English<-c(25,22,18,15,20,28,15,30,27,18)
  roster<-data.frame(Student,Math,Science,English,stringsAsFactors = F)  #stringsAsFactors = F 不会把字符转化成因子
  
  z<-scale(roster[,2:4])  #进行标准化
  score<-apply(z, 1, mean);score   #计算综合得分利用apply()
  roster<-cbind(roster,score);roster   #进行合并矩阵
  y<-quantile(score,c(0.8,0.6,0.4,0.2))   #对学生评分
  roster$grade[score>=y[1]]   <-"A"            #建立新的一列grade
  roster$grade[score<y[1] & score>y[2]]  <-"B"
  roster$grade[score<y[2] & score>y[3]]  <-"C"
  roster$grade[score<y[3] & score>y[4]]  <-"D"
  roster$grade[score<y[4]]   <-"F"
  
  name<-strsplit((roster$Student)," ")    #抽取姓氏和名字
  lastname<-sapply(name,"[",2)           #利用sapply()
  firstname<-sapply(name,"[",1)
  roster<-cbind(firstname,lastname,roster[,-1])  #合并矩阵
  roster<-roster[order(roster$grade),]          #按照成绩排序
  roster
##5.4.1 重复和循环
#1、for结构
  for(i in 1:10)
    print("HELLO")
#2、while结构
  i<-10
  while(i>0)
  {print("HELLO");i<-i-1}
#5.4.2 条件执行
#1、if-else结构
  if(is.character(grade)) 
    grade<-as.factor(grade)
  if(!is.factor(grade)) 
    grade<-as.factor(grade)  
  else print("Grade alradey is a factor")
#2、ifelse结构
  ifelse(score>0.5,print("Passed"),print("Failed"))
#3、switch结构
  feelings<-c("sad","happy")
  for(i in feelings)
  print(
    switch(i,
          happy= "I am glad you are happy",
          sad= "Cheer up"
         )
       )
  
##5.6 整合与重构
##5.6.1 转置
  cars<-mtcars[1:5,1:4]
  cars
  t(cars)
##5.6.2 整合数据 
  #利用aggregate()
##5.6.3 reshape包
  
  
  
  
  
  
  
  
  
  
  
   