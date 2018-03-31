第二章：数据结构

###2.2.1 向量
##定义：存储数值型、字符型、逻辑型数据的一维数组。
##创建向量[在R语言的统计分析中更加详细]
a<-c(1,2,3,4,5) #数值型向量
b<-c("one","two","three")  #字符型向量
c<-c(TRUE,TRUE,FALSE)  #逻辑型向量

##向量下标与子集的提取
a<-c(1,2,3,4,5)
a[3]
a[c(1,3,5)] #提取三个元素
a[2:6]   #提取2,3,4,5,6的元素





###2.2.2 矩阵
##定义：二维数组[相同模式才行]
##创建矩阵
#利用matrix() 
#matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,dimnames = NULL);默认按照列(byrow=FALSE)

y<-matrix(1:20,nrow = 4,ncol = 5);y #默认按照列填充
y<-matrix(1:20,nrow = 4,ncol = 5,byrow=TRUE);y #按照行填充

#创建完整的矩阵
cells<-c(1,2,3,5)
rnames<-c("R1","R2")  #行名称
cnames<-c("V1","V2")  #列名称
mymatrix<-matrix(cells,nrow = 2,ncol = 2,byrow = FALSE,dimnames = list(rnames,cnames))
mymatrix

#利用diag()  #生成单位矩阵
d<-diag(3) 
diag(2.5,nr=3,nc=5)

##矩阵下标的使用
x<-matrix(1:10,nrow = 2);x
x[2,]        #提取第二行所有数据
x[,2]        #提取第二列所有数据
x[2,2]       #提取第二行第二列的固定数据
x[2,c(1,3)]  #提取第二行，第一、三列的数据






###2.2.3 数组
##定义：与矩阵类似
##创建数组

#利用array()
#array(data = NA, dim = length(data), dimnames = NULL)
#创建三维数组
dims1<-c("A1","A2")  #各维的名称[“易忘记双引号”]
dims2<-c("B1","B2")
dims3<-c("C1","C2")
A<-array(1:8,c(2,2,2),dimnames = list(dims1,dims2,dims3));A  #默认按照列
dim(A)  #计算的维数





###2.2.4 数据框
##创建数据框 (数据类型可以混合使用)
#利用data.frame()
help(data.frame)
#data.frame(..., row.names = NULL, check.rows = FALSE,
# check.names = TRUE, fix.empty.names = TRUE,
# stringsAsFactors = default.stringsAsFactors())

#创建一个数据框
patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("Type1","Type2","Type1","Type1")
status<-c("Poor","Improved","Excellent","Poor")
myframes<-data.frame(patientID,age,diabetes,status);myframes

#选取数据框中的元素
myframes[1:2]
myframes[c("patientID","diabetes")]
myframes$diabetes   #  记号$的使用
#可以用attach() detach() with()来固定

###2.2.5 因子
#定义：类别（名义型）变量和有序型变量都为因子

#因子的使用
patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("Type1","Type2","Type1","Type1")
status<-c("Poor","Improved","Excellent","Poor")
diabetes<-factor(diabetes)
status<-factor(status,order=TRUE)  #转化为有序因子
myframes<-data.frame(patientID,age,diabetes,status)
str(myframes)  #显示对象的结构
summary(myframes)

###2.2.6 列表
#利用list()
##创建一个列表
g<-"MY FIRST LIST"
h<-c(1,2,3,4)
j<-matrix(1:10,nrow=5)
k<-c("one","two","three")
mylist<-list(title=g,ages=h,j,k);mylist
mylist[[2]]    #输出第二个成分
