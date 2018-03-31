##第二周

#getBinaryURL()下载文件
url="XXXX"
temp<-getBinaryURL(url)
note <-file("hellodata.xls", open = "wb")
writeBin(temp,note)
close(note)

#利用strsplit  字符串切割
?strsplit
Sys.time()
class(Sys.time)
class(Sys.time())
as.character(Sys.time())
strsplit(as.character(Sys.time()),'')
strsplit(as.character(Sys.time()),' ')
strsplit(as.character(Sys.time()),' ')[2]
unlist(strsplit(as.character(Sys.time()),' '))
unlist(strsplit(as.character(Sys.time()),' '))[2]

#批量下载文件的一个例子
html=getURL(http://rfunction.com/code/1202/")  #查看网址
html
temp=strsplit(html,"<li><a href=\"")[[1]]
temp
files=strsplit(temp,"\"");files
files=lapply(files,function(x){x[1]});files
files=unlist(files)
files=files[-(1:2)];files

i=1
base="http://rfunction.com/code/1202/"
for(i in i:length(files))
{
  url=paste(base,files[i],sep='')
  temp<-getBinaryURL(url)
  note<-file(paste("1202",files[i],sep='.'), open = "wb")
  dir.create("D:/R/我的资料集/资料册/图片/photoes") #建立存储文件夹 
  setwd("D:/R/我的资料集/资料册/图片/photoes") #锁定临时目录 
  
  Sys.sleep(2)  #读两个休息一下
}



