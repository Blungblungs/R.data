###KNN分类
##参考《机器学习与R语言》第三章 ————用Knn算法诊断乳腺癌###


###1、录入数据###
wbcd=read.csv("D:/R/我的资料集/自学/机器学习与R语言——Brett Lantz/第三章 懒惰学习——使用近邻分类/数据/wisc_bc_data.csv",sep=",")


###2、探索与准备数据###
wbcd=wbcd[,-1] #减去id列
head(wbcd)
table(wbcd$diagnosis) #查看结果
wbcd$diagnosis=factor(wbcd$diagnosis,levels =c("B","M"),labels = c("Benign","Malignant") )  #转化为因子类型
prop.table(table(wbcd$diagnosis))*100 #观察良性和恶性肿块的比重 
summary(wbcd[1:3])   #显示前三列数据
  
##2.1 数据标准化##
  #利用自制函数min-max标准化#
normalize=function(x){
  return((x-min(x))/(max(x)-min(x)))}
wbcd_n=as.data.frame(lapply(wbcd[2:31], normalize))
summary(wbcd_n$smoothness_mean)  #随便找个观察下是不是标准化了
  
#2.2 创建训练、测试数据##
wbcd_train=wbcd_n[1:469,]
wbcd_test=wbcd_n[470:569,]
    #如果要随机抽取训练集和测试集#
    ###train_sub=sample(nrow(wbcd_n),3/4*nrow(wbcd_n))   #随机无放回抽取3/4样本
    ###train_data=wbcd_n[-train_sub,]                        #将相应3/4样本集作为训练集
    ###test_data=wbcd_n[train_sub,]                        #将另外的1/4样本集作为测试集
    ###dim(train_data);dim(test_data)                          #显示训练集与测试集的维度

    #将关键变量划分#
wbcd_train_lables=wbcd_n[1:469,1]
wbcd_test_lables=wbcd_n[470:569,1]


##3、基于数据训练模型##
#install.packages("class")
library(class)
wbcd_test_pred=knn(train=wbcd_train,test=wbcd_test,cl=wbcd_train_lables,k=21)


###4、评估模型的性能
#install.packages("gmodels") 利用交叉列联表观察预测与真实的差距
library(gmodels)
CrossTable(x=wbcd_test_lables,y=wbcd_test_pred,digits=3)  ##为啥出现错误##





