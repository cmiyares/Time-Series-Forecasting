# HW 3
library(TSA)
# excercise 4.10
#a
#ARMA(1,1 with phi = 0.7 theta = 0.4)


model=ARMAacf(ma=-0.4,ar=0.7,lag.max = 8)
plot(model,ylab='ACF',xlab='Lag',type = 'h')


#b
# ARMA(1.1) with phi=0.7 and theta=-0.4
model2=ARMAacf(ma=0.4,ar=0.7,lag.max = 8)
plot(model2,ylab='ACF',xlab='Lag',type = 'h')
