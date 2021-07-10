# S&P-500-Stock-Market-Prediction

Personal Project ongoing

June 25 : 
• Uploaded the R file. I used ARIMA models to train the data, used validation and chose the model with least error to conduct the prediction.


Introduction:

The data collected is the S&P 500 data from Specifically, the variables include Date, Opening Price, High Price of the Day, Low Price of the Day, Closing Price, Adjusted Closing Price, and Volume. The data was taken from Yahoo Finance.
We are interested in exploring the properties of the volume of this dataset and determining if it has any time series properties. 



Time Series Analysis:

From the raw plot, we may say that there is some kind of cyclical effect and does not have a trend until near the end.

Plotting the ACF against the lag for the daily volume, we see that the ACF tails off at a moderate rate and is significant from lag 0 to lag 37.

After plotting the PACF against the lag for the daily volume, we see that the PACF is significant at lag 1, 2, and 3.

Use Box-Pierce test to decide whether series appears to be realization from a white noise process. Since p-value is less than 2.2e-16 which is super small, then we may conclude the series doesn't appear to be a realization from a white noise process.

Apply first difference operator to the time series that might reasonably be expected to remove the non-stationary component.
After applying the first difference, we can see that there is non-seasonal and no trend.

The acf is significant at till lag=0, 1 comparing to at other lags, and all the other values of acf are very small. 
At lag=1,2,3,4 the pacf has significant values.

Use Box-Pierce test again, now the p-value is 0.2973 >0.05, there is no evidence that null hypothesis is false, so we do not reject null hypothesis. Thus the new series is stationary and it is from a white noise process.

Split the first-diff dataset into train set and test set. 

Try different ARMA models to find the least test error using training and test sets. (according to ARMA_3 models.png)

We use ARIMA(3,1,1), ARIMA(4,1,1), ARIMA(0,1,1)

ARIMA(3,1,1): test error 4.623286e+18,  aic = 10423.67
ARIMA(4,1,1): test error 4.706072e+18,  aic = 10422.01
ARIMA(0,1,1): test error 4.731725e+18,  aic = 10461.58

Since all the test error are pretty small, choose the smallest aic.








Future Step:
• Start to learn PyTorch to train the dataset. It's probably going to be fun!




