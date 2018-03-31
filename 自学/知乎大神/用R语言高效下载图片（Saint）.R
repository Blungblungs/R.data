install.packages("downloader")
install.packages("rvest")
install.packages("dplyr")
library(rvest)
library(downloader)
library(dplyr)

####Nqw-T_22ZDndvlCB\_3ndFS\_1f9xN\y5w1y###
url<-'http://www.designerspics.com/'
picture<-read_html(url)%>%html_nodes("div.photograph")%>%html_nodes("img")%>%html_attr("src")

head(picture,10)


for(i in 1:length(picture))
{download(picture[i],paste("D:/R/×ÊÁÏ²á/designer/picture,",i,".jpg",sep=""),mode="wb")}