library(RCurl)
library(XML)

myheader<-c(
  "User-Agent"="Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.6) ",
  "Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
  "Accept-Language"="en-us",
  "Connection"="keep-alive",
  "Accept-Charset"="GB2312,utf-8;q=0.7,*;q=0.7")


temp<-getURL("http://t.dianping.com/guangzhou?q=%E7%94%B5%E5%BD%B1",httpheader=myheader)

doc<-htmlParse(wp1, asText= TRUE)
tables<-readHTMLTable(doc)
tables

