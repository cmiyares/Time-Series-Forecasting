library(TSA)
#seed
addTaskCallback(function(...) {set.seed(123);TRUE})

#### 7.16 ####
#(a)
#creating the series
series1 = arima.sim(list(ar=c(0.6,0.3)),n=60)

# finding the method-of-moments (mom) estimate of Φ1 and Φ2
acf(series1)$acf[1] # r1 = mom estimate of phi
ar(series1,order.max = 2,AIC=F,method = 'yw') 
# coeff1 = 0.5944  coeff2 = 0.3002

#(b)
# finding the conditional least squares estimates of Φ1 and Φ2
arima(series1,order=c(2,0,0),method='CSS')$coef[1]
arima(series1,order=c(2,0,0),method='CSS')$coef[2]
# the coefficients are 0.595 and 0.3 which are similar to mom


#(c)
#maximum likelihood (MLE)
arima(series1,order=c(2,0,0),method='ML')$coef[1]
arima(series1,order=c(2,0,0),method='ML')$coef[2]
# once again the estimates are almost the same as a and b


#### 7.17 ####

#(a) find mom estimate of Φ and θ
series2 = arima.sim(list(ar=0.7,ma=-0.4),n=60)

#mom
r1 = acf(series2)$acf[1] #0.3025547
r2 = acf(series2)$acf[2] #0.1648558

phi_hat = r2/r1 #0.5448792


#(b)
# conditinal least squares estimates
arima(series2,order=c(1,0,1),method='CSS')$coef[1]
arima(series2,order=c(1,0,1),method='CSS')$coef[2]

# ar1 
# 0.6891562 
# 
# ma1 
# -0.4459463 

#(c)
# MLE
arima(series1,order=c(1,0,1),method='ML')$coef[1]
arima(series1,order=c(1,0,1),method='ML')$coef[2]

# ar1 
# 0.9173214 
# 
# ma1 
# -0.2920428  



#### 8.6 ####
series3 = arima.sim(list(ar=c(1.5,-0.75)),n=48)
#(a)
mod = arima(series3,order = c(2,0,0))

plot(rstandard(mod),ylab='Standardized Residuals', type='o')
abline(h=0)

# The standardized residuals look random, no patterns.

#(b)
qqnorm(rstandard(mod))
qqline(rstandard(mod))

# the Q-Q plot looks normal but it could be outliers on the bottom

#(c)

acf(rstandard(mod))

# The plot seems good, and meets the AR(2) specification

#(d)
LB.test(mod,lag=12)


# given that the p-value = 0.94 we do
# not have statistically significant evidence
# that the error terms are uncorrelated

#### 8.8 ####

#(a)
data("oilfilters")

m1.oil = arima(oilfilters,order = c(1,0,0))
m1.oil

# ar1 is not significantly different from zero. It also has a large AIC.

#(b)

acf(rstandard(m1.oil))

# at lag 1 there is a clear outlier. Other than that
# the autocorrelations seem good at other lags.