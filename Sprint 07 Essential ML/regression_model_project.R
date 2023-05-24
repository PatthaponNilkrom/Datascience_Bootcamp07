# R Project: Regression model
library(caret)
library(tidyverse)
library(readxl)
library(ggplot2)

# load data
df <- read_excel("House Price India.xlsx")
df <- data.frame(df)
view(df)

df <- log(df)
set.seed(24)
tt <- sample_n(df, 1000)
pl <- ggplot(tt,aes(Price))
pl + geom_histogram(bins = 20)

# split func
train_test_split <- function(data, train_size=0.7) {
  set.seed(24)
  n <- nrow(data)
  id <- sample(1:n, size = train_size*n, replace=FALSE)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  ## return a list of two datasets
  return( list(train = train_data, test = test_data) )
}
# rmse func
rmse_metric <- function(actual, prediction) {
  # root mean squared error
  sq_error <- (actual - prediction)**2
  sqrt(mean(sq_error))
}
# mae func
mae_metric <- function(actual, prediction){
  # mean absolute error
  abs_error <- abs(actual - prediction)
  mean(abs_error)
}
# mse func
mse_metric <- function(actual, prediction){
  # mean squared error
  sq_error <- (actual - prediction)**2
  mean(sq_error)
}


# split data
split_data <- train_test_split(df,0.7)
train_data <- split_data[[1]]
test_data <- split_data[[2]]


# train model
# Price = f(number.of.bedrooms,
# condition.of.the.house,number.of.bathrooms,
# number.of.floors ,living.area , grade.of.the.house)
set.seed(24)

ctrl <- trainControl(
  method = "boot",
  number = 25,
  verboseIter = TRUE
)
lm_model <- train(Price ~ number.of.bedrooms 
                  + condition.of.the.house + number.of.bathrooms
                  + number.of.floors + living.area + grade.of.the.house , 
                  data = train_data, method = "lm",
                  trControl = ctrl)

glm_model <- train(Price ~ number.of.bedrooms 
                   + condition.of.the.house + number.of.bathrooms
                   + number.of.floors + living.area + grade.of.the.house , 
                   data = train_data, method = "glm",
                   trControl = ctrl)

# score model
p <- predict(lm_model, newdata = test_data)
pglm <- predict(glm_model, newdata = test_data)

# evaluate model
cat("rmse_train_lm:" , lm_model$results$RMSE,
    "\nrmse_test_lm:" ,rmse_metric(test_data$Price, p),
    "\nrmse_train_glm:" , glm_model$results$RMSE,
    "\nrmse_test_glm:" ,rmse_metric(test_data$Price, pglm))
