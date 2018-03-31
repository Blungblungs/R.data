
library(rvest) 
library(downloader) 
url<-"https://www.zhihu.com/question/35931586/answer/206258333"
link<- read_html(url)%>% html_nodes("div.RichContent-inner>span")%>%html_nodes("img")%>%html_attr("data-original")%>%na.omit
link<-link[seq(1,length(link),by=2)] #剔除无效网址
Name<-sub("https://pic\\d.zhimg.com/v2-","",link) #提取图片名称
dir.create("D:/R/我的资料集/资料册/图片/photos") #建立存储文件夹 
setwd("D:/R/我的资料集/资料册/图片/photos") #锁定临时目录 
for(i in 1:length(link)){ download(link[i],Name[i], mode = "wb") } #下载过程：
