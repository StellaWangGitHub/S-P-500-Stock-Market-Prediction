# S&P500 STOCK MARKET ANALYSIS AND PREDICTION 
#We mainly use ARIMA models to predict volume  


#import and visulize the data 
library(readr)
s_p500 <- read_csv("Desktop/s&p500.csv")
raw_data <- s_p500 
raw_data

#extract the feature Volume to do analysis
dat1 <-raw_data$Volume
#transfer data to time series
dat1 <-as.ts(dat1)
plot(dat1)

#plot the ACF, PACFagainst the lag 
acf(dat1, lag.max = 50) 
acf(dat1, lag.max = 100)
pacf(dat1,lag.max = 50)
pacf(dat1,lag.max = 100) 


#Box-Pierce test to determine whether this series appears to be a stationary (white noise) process
Box.test(dat1, lag = 50, type = "Box-Pierce", fitdf = 0)

## First diff
diff <- diff(dat1, differences = 1)
plot(diff)
acf(diff)
pacf(diff)
Box.test(diff, lag = 50, type = "Box-Pierce")

#arima(diff,order = c(3,0,1), include.mean = FALSE)


##split data into 2 parts, training and test sets to train our model
length(diff)
#if we use the last 12 data as our test set 
diff.train <- as.ts(diff[1:240])
diff.test <- as.ts(diff[241:250])
length(diff.test)
plot(diff.train)
acf(diff.train) 
pacf(diff.train) 

trainSet <- diff.train
testSet <- diff.test

##use arima(3,1,1) to be our model
fit <- arima(trainSet, order = c(3,1,1))
fit
acf(fit$residuals)
tsdiag(fit)

predict(fit, n.ahead= 10)

##test error
foremodel<- predict(fit, n.ahead= 10)
foremodel
error <- sum((diff[241:250] - foremodel$pred)^2)
error


##use arma(4,1,1) to be our model
fit<-arima(trainSet, order = c(4,1,1))
fit
acf(fit$residuals)
tsdiag(fit)

predict(fit, n.ahead= 10)

##test error
foremodel<- predict(fit, n.ahead= 10)
foremodel
error <- sum((diff[241:250] - foremodel$pred)^2)
error

##use arima(0,1,1) to be our model
fit<-arima(trainSet, order = c(0,1,1))
fit
acf(fit$residuals)
tsdiag(fit)

predict(fit, n.ahead= 10)

##test error
foremodel<- predict(fit, n.ahead= 10)
foremodel
error <- sum((diff[241:250] - foremodel$pred)^2)
error

#prediction
length(dat1)
pred01<-dat1[251]+foremodel$pred[1]
pred01
pred02<-pred01+foremodel$pred[2]
pred02




