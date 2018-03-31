#使用R语言httr包实现异步加载和
#POST表单提交以及cookies登入。
#直接使用json或者其他格式的表单返回值，
#避免苦逼的的书写大量正则表达式以及让人眼花缭乱的 CSS表达式、Xath路径表达式。
install.packages("rlist")
install.packages("pipeR")

library("httr") 
library("dplyr") 
library("jsonlite")
library("curl")
library("magrittr")
library("rlist")
library("pipeR")
library("plyr")


url<-"http://study.163.com/p/search/studycourse.json"

Cookie='_ntes_nnid=c66416fa1d63fad39a3897ae8f07b31a,1494123356006; _ntes_nuid=c66416fa1d63fad39a3897ae8f07b31a; EDUWEBDEVICE=0080cad25b35486e95538d6aa85091e3; NTESSTUDYSI=f745d5b72464457ca934b64f79d8b60f; utm="eyJjIjoiIiwiY3QiOiIiLCJpIjoiIiwibSI6IiIsInMiOiIiLCJ0IjoiIn0=|"; __utma=129633230.633425057.1506842309.1506842309.1507785144.2; __utmb=129633230.15.9.1507785261037; __utmc=129633230; __utmz=129633230.1506842309.1.1.utmcsr=so.com|utmccn=(referral)|utmcmd=referral|utmcct=/link'

#构造浏览器报头信息：
headers <- c('Accept'='application/json',
             'Content-Type'='application/json',          
             'User-Agent'='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36',          
             'edu-script-token'= '3e44b18e2cea46b6890d1cf92c1ad606',
             'Referer'='http://study.163.com/category/dataanalysis', 
             'Connection'='keep-alive',
             'Cookie'=Cookie
)

#构造请求头参数信息：（这里只接受list）
payload<-list(
  'pageIndex'=1,
  'pageSize'=50, 
  'relativeOffset'=0,
  'frontCategoryId'='400000000709002'
)

#第五步：单步执行：

r <- POST(url,add_headers(.headers =headers),body =payload, encode="json",verbose())

myresult1 <-r %>% content() %>%`[[`(3) %>% `[[`(2) %>% toJSON() %>% fromJSON(simplifyDataFrame=TRUE)

summary(myresult1)


