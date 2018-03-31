setwd("D:/R/自学/R语言实战")
help("options")
options()
options(digits = 3)
x<-runif(20)
summary(x)
hist(x)
libPaths(DAAS)
install.packages("gclus")
library("gclus")


##示例实践
help.start()
install.packages("vcd")
help (package="vcd")
library(vcd)
help(Arthritis)
Arthritis
example(Arthritis)


