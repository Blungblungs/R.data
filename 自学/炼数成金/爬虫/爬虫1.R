install.packages("RCurl")
library(RCurl)

#利用url.exists()查看网址是否存在
url.exists("http://www.baidu.com")  #查看网址是否存在

#利用getURL()查看相关信息
d = debugGatherer()
temp <-getURL("http://www.dataguru.cn/",debugfunction=d$update,verbose = TRUE)
cat(d$value()[3])#提交给服务器的头信息
cat(d$value()[1])#服务器地址以及端口号
cat(d$value()[2])#服务器端返回的头信息

##查看服务器端返回的头信息
###列表形式
h= basicHeaderGatherer()
txtt=getURL("http://www.dataguru.cn/",headerfunction = h$update)
names(h$value())
h$value()

##查看curl请求的访问信息
curl = getCurlHandle()
d=getURL("http://www.dataguru.cn/", curl = curl)
getCurlInfo(curl)$response.code
getCurlInfo(curl)

#武装自己的header
myheader<-c(
  "User-Agent"="Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.6) ",
  "Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
  "Accept-Language"="en-us",
  "Connection"="keep-alive",
  "Accept-Charset"="GB2312,utf-8;q=0.7,*;q=0.7"
)
##其他详情还没有具体了解

#
