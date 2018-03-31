#87页3.1
sum(sample(1:100,5))

#3.2
4^5/choose(52,5)
9*choose(4,1)/choose(52,5)


#3.3
x<-rnorm(1000,mean=100,sd=10)
hist(x)
y<-sample(x,500,replace=TRUE)
hist(y)
mean(x);mean(y)
var(x);var(y)

#3.5
n=100;mu=0;sigma=1;alpha=0.05
x<-rnorm(n,mu,sigma)
m<-mean(x)
Za<-qnorm(1-alpha/2)
s<-sigma/sqrt(n)
Low<-m-Za*s
Up<-m+Za*s
list(Low=Low,Up=Up)


#3.6#渐近正态性的图形检验
limite.central<-function(r=runif,distpar=c(0,1),m=0.5,
              s=1/sqrt(12),n=c(1,3,10,30),N=1000){
   for (i in n){
       if (length(distpar)==2) {
           x<-matrix(r(i*N,distpar[1],distpar[2]),nc=i)
       }
       else {
           x<-matrix(r(i*N,distpar),nc=i)
       }

       x<-apply(x,1,mean)

       hist(x,col='light blue',probability=T,main=paste("n=",i),ylim=c(0,max(0.4,density(x)$y)))
       lines(density(x),col='red',lwd=3)
       curve(dnorm(x,mean=m,sd=s/sqrt(i)),col='blue',lwd=3,lt=3,add=T)
       
       if (N>100) {
          rug(sample(x,100))
       }
       else {
          rug(x)
       }
   }
}

#beta(1/2,1/2)分布
op<-par(mfrow=c(2,2))
limite.central(rbeta,distpar=c(0.5,0.5),m=0.5,s=0.125)
par(op)
      