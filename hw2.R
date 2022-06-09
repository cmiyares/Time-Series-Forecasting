# HW 2 3.5

# part a
#loading in library
library(TSA)

#reads in a displays data set "wages"
data(wages)
wages

time(wages)

#creates a time series plot of wages of the years
plot(wages, type='l', ylab='y',xlab='Year')
# labels each point by a letter coinciding with its respective
#month
Month=c('J','A','S','O','N','D','J','F','M','A','M','J')
points(wages,pch=Month)

#partb
#creates model between "y" wages and "x" time or year
model1 = lm(wages ~ time(wages))
summary(model1)
# fits the least squares line
abline(model1)

#part c
#makes a plot of the residuals
plot(y=rstudent(model1),x=as.vector(time(wages)),xlab='Time',
     ylab='Standardized Residuals',type='l')

#partd
#quadratic time trend
model2 = lm(wages~time(wages)+I(time(wages)^2))
summary(model2)
model2a = rstudent(model2)
#parte
#makes a residual plot of the quadratic time trend model
plot(y=model2a,x=as.vector(time(wages)),xlab='Time',
     ylab='Standardized Residuals',type='l')
