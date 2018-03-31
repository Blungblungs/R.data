#R的数据结构
#2.4.3 向量的建立


1:10
1:(10-1)

#seq()较为简单的规律
seq(1,5,by=0.5)  #等价于seq(from=1,to=5,by=0.5)
seq(1,10,length=11)  #长度为11个

#rep()较为复杂的规律
z<-rep(2:5,2)  #循环次数为2 
z<-rep(2:5,rep(2,4))   #每个循环两次，一共进行四次
z<-rep(c(3,5),c(2,4))  #循环2和4

#向量的下标与子集的提取

#正整数向量
x<-c(1:10)
x[c(1,2)]

#负整数向量
y<-x[-c(1,2)]  #去除第一二位置的数

#字符串向量
fruit<-c(5,10,1,20)
names(fruit)<-c("orange","banana","apple","peach")
fruit
lunch<-fruit[c("apple","banana")]
lunch

#逻辑向量

x<-c(1:10)
x>5
x[x>5]      #大于5的元素
x[x>2&x<=5]    #大于二且小于等于5的元素
x[x>15]

x[x>5]<-8
x            #大于5的元素赋值为8
y=runif(100,min=0,max=1)   #(0,1)上100个均匀分布随机数
sum(y<0.6)   #值小于0.6的个数

sum(y[y<0.6])   #值小于0.6的元素的值的和

y<-x[!is.na(x)]  #x中的非缺失值

#2.4.4  数组与矩阵的建立

#数组建立
#利用array(data,dim,dimnames)  #dim 维数  dimnames各维数名称
A<-array(1:8,c(2,2))
colnames="姓名"，rownames="班级"
help(array)
array(1:3,c(2,4)) 
dim(A)  #维数
dimnames(A)<-list(c("a","b","c"),c("e","f","g") #给横纵坐标命名
help(dimnames)

#矩阵的建立
#利用array()
A<-array(1:8,c(2,2))  #默认按照列

#利用matrix() 
#matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,dimnames = NULL)
help(matrix)
X<-matrix(1:9,3,3) #默认按照列填充
X
X<-matrix(1:9,nr=3,nc=3,T)  #按照行填充
X

#利用diag()  #生成单位矩阵
d<-diag(3) 
diag(2.5,nr=3,nc=5)

#数组与矩阵的下标与子集的提取

x<-matrix(1:9,3,3) 
x[2,2]  #提取一个元素
x[2,]   #提取第二行元素
x[is.na(x)]<-1   #将缺失值用1替代

#对矩阵的运算
#转置函数t()
x<-matrix(1:9,3,3) 
x
t(x)  
#提取对角元 diag()
diag(x)
#几个矩阵按行合并rbind()  按列合并cbind()

m1<-matrix(1:4,2,2)
m2<-matrix(2:5,2,2)
rbind(m1,m2)
cbind(m1,m2)

#矩阵的逐元乘积"*"
m1*m2

#矩阵的代数乘积"%*%"
m1%*%m2

#方阵的行列式det()
det(m1%*%m2)

#2.4.5数据框的建立 data.frame（）
gender=c("man","woman")
weight=c(50,60,45,52)
z=data.frame(weight,gender)  #因变量，自变量
z

#适用于数据框的函数
attach(Puromycin)    #挂接数据集使之激活
help(Puromycin)      #显示前几行
summary(Puromycin)    #显示主要的描述性统计量
pairs(Puromycin,panel=panel.smooth)  #生成散点图


#数据框的下标与子集的提取
Puromycin[c(1,2),c(2,3)]
Puromycin[c(1,3,5),]   #提取1,3,5行，所有列

Puromycin$conc  #等价于Puromycin[,1]
Puromycin$state 
subset(Puromycin,state=="untreated"&rate>60)    #提取满足条件的子集

#2.4.6列表的建立
L1=list(x=1:6,y=matrix(1:4,nrow=2)) #建立一个x，y的列表
L1


#2.4.7 时间序列的建立
ts(1:100,frequency=12,start=c(1978,2))    #2代表从第二个位置开始


#2.5.1数据的储存与读取
setwd("D:/R/XXX.txt")   
data(treering)
help(dataname)     
                   #未详细学习




































