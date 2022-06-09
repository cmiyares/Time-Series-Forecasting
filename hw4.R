#5.7c
library(TSA)
library(tswge)
#converting to ma to compare psi weights

weights = ARMAtoMA(ar=c(0.9,0.09),ma=c(0),lag.max = 20)

# I found this function online
?psi.weights.wge
# it is in the package 'tswge'
#phi is the ar coefficients
#theta are the ma coefficients in this case -0.1 

psi.weights.wge(phi= weights,theta = -0.1,lag.max = 20)


#5.11

#importing data

data("winnebago")
winnebago
#a.
plot(winnebago,ylab='Monthly Sales',xlab='Year',type='l')

#b. taking the natural logs

#plot of log
log(winnebago)
plot(log(winnebago),ylab='Log(Winnebago)')

#c.
#calculating the fractional relative changes
#and comparison with the differences of ln

# y_t - y_{t-1} / y_{t-1}
#first difference / lag 1

fraction = (winnebago-zlag(winnebago))/zlag(winnebago)
difflog = diff(log(winnebago))


plot(x=as.vector(difflog),y=fraction[-1],ylab='Fractional Relative Changes'
     ,xlab='Difference of Logs')

cor(as.vector(difflog),fraction[-1])

