# Chapter 1

# Install Time Series Analysis (TSA) package
install.packages("TSA")

##### Annual rainfall in LA
library(TSA) #Read package
data(larain) #Read LA rainfall data
larain #Check data
is(larain) #Time series object (ts)
time(larain)

# Time series plot (Ex.1.1)
plot(larain, ylab='Inches', xlab='Year', type='o')
#ylab / xlab: labels for y- / x-axis
#type: how the data are displayed in the plot
plot(larain, ylab='Inches', xlab='Year', type='b')
plot(larain, ylab='Inches', xlab='Year', type='l')
plot(larain, ylab='Inches', xlab='Year', type='p')

# Scatter plot (Ex.1.2)
plot(x=zlag(larain), y=larain, ylab='Inches',
     xlab='Previous Year Inches')
#zlag: the lag 1 of larain - function in TSA package
zlag(larain) #check the result

##### An industrial chemical process
data(color)
color

# Time series plot (Ex.1.3)
plot(color, ylab='Color Property', xlab='Batch', type='o')

# Scatter plot (Ex.1.4)
plot(y=color,x=zlag(color),ylab='Color Property',
     xlab='Previous Batch Color Property')

##### Annual abundance of Canadian hare
data(hare)
plot(hare, ylab='Abundance', xlab='Year', type='o') # Ex.1.5
plot(y=hare,x=zlag(hare),ylab='Abundance',
     xlab='Previous Year Abundance') # Ex.1.6

##### Monthly average temperatures in Dubuque, Iowa (Ex.1.7)
data(tempdub)
plot(tempdub,ylab='Temperature',type='o')

##### Monthly oil filter sales (Ex.1.8)
data(oilfilters)
plot(oilfilters,type='o',ylab='Sales') #default x-axis label is 'Time'

# Plotting symbols (Ex.1.9)
plot(oilfilters,type='l',ylab='Sales') #draw line plot
# First method
Month=c('J','A','S','O','N','D','J','F','M','A','M','J')
#points: draws on top of an existing graph
points(oilfilters,pch=Month) #use Month as plotting symbols

# Second method
plot(oilfilters,type='l',ylab='Sales') #draw line plot
points(y=oilfilters,x=time(oilfilters),
         pch=as.vector(season(oilfilters)))
time(oilfilters) #outpus the epochs when the time series values were collected
?season #extract the season info
as.vector(season(oilfilters)) #outputs months vector


## (Exercises) ##
# (1.3) Simulate a completely random process of length 48 with independent,
#       (standard) normal values. Repeat this exercise several times with
#       a new simulation each time

# This might help:
?rnorm
?ts
#sets seed
set.seed(32816)

# ts is time series and rnorm generates numbers on normal scale
#given "n" number.
ts(rnorm(n=48))

plot(ts(rnorm(n=48)),type='o',xlab='Time',ylab='Outcome')


# (1.4) Simulate, with independent chi-square, with 2 d.f.
?rchisq

ts(rchisq(n=48,df=2))
#rchisq does the same sims rand with n and df

# (1.5) Simulate, with independent t, with 5 d.f.
?rt
ts(rt(n=48,df=5))

#rt sims with n and df

#plots 
plot(ts(rt(n=48,df=5)),type='o')