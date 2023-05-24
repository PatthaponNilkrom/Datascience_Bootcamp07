# Python Project: Built simple ML model by sklearn
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error as mse, mean_absolute_error as mae
import pandas as pd
import numpy as np

# load data
mtcars = pd.read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")
mtcars.head()

# mpg = f(hp,wt,am)
X = mtcars[ ["hp","wt","am"] ]
y = mtcars[ "mpg" ]
# split data 80% train , 20% test
X_train , X_test, y_train, y_test = train_test_split(X,y,test_size = 0.2, random_state = 24)

# train model
# lm_model = LinearRegression().fit(X_train, y_train)
lm_model = LinearRegression()
dt_model = DecisionTreeRegressor()
rf_model = RandomForestRegressor()

lm_model.fit(X_train, y_train)
dt_model.fit(X_train, y_train)
rf_model.fit(X_train, y_train)

# test model / scoring
pred_lm = lm_model.predict(X_test)
pred_dt = dt_model.predict(X_test)
pred_rf = rf_model.predict(X_test)

# evaluate model
# model.score()
# MAE mean absolute error
# mae_lm = np.mean(np.absolute((y_test - pred_lm)))
# mae_dt = np.mean(np.absolute((y_test - pred_dt)))
mae_lm = mae(y_test, pred_lm)
mae_dt = mae(y_test, pred_dt)
mae_rf = mae(y_test, pred_rf)

# MSE
# mse_lm = np.mean((y_test - pred_lm)**2)
#mse_dt = np.mean((y_test - pred_dt)**2)
mse_lm = mse(y_test, pred_lm)
mse_dt = mse(y_test, pred_dt)
mse_rf = mse(y_test, pred_rf)

print(f"LinearRegression \nMAE: {mae_lm} \nMSE: {mse_lm} \nDecisionTreeRegressor \nMAE: {mae_dt} \nMSE: {mse_dt} \nRandomForestRegressor \nMAE: {mae_rf} \nMSE: {mse_rf}")
