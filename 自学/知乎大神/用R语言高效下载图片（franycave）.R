install.packages("downloader")
install.packages("rvest")
install.packages("dplyr")
library(rvest)
library(downloader)
library(dplyr)


url<-'http://fancycrave.com/'
picture<-read_html(url)%>%html_nodes("div.gallery-wrapper")%>%html_nodes("img")%>%html_attr("src")

head(picture,10)

for(i in 1:length(picture))
{download(picture[i],paste("D:/R/×ÊÁÏ²á/picture,",i,".jpg",sep=""),mode="wb")}