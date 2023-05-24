# R Project: Titanic survivor
library(titanic)
head(titanic_train)

# DROP NA (missing values)
titanic_train <- na.omit(titanic_train)
nrow(titanic_train)

# SPLIT DATA
set.seed(24)
n <- nrow(titanic_train)
id <- sample(1:n, size = n*0.7) ## 70% train 30% test
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]

# Trian Model logistic Regression
model_glm <- glm(Survived ~ Pclass + Age, data = train_data, family = 
      "binomial")
pglm_train <- predict(model_glm, type = "response")
train_data$pred <- ifelse(pglm_train >= 0.5, 1,0)

# Trian Model linear Regression
model_lm <- lm(Survived ~ Pclass + Age, data = train_data)
plm_train <- predict(model_lm)
train_data$pred_lm <- ifelse(plm_train >= 0.5, 1,0)

# Test model logistic Regression
p_test <- predict(model_glm, newdata = test_data, type = "response")
test_data$pred <- ifelse(p_test >= 0.5, 1, 0)

# Test model linear Regression
plm_test <- predict(model_lm, newdata = test_data)
test_data$pred_lm <- ifelse(plm_test >= 0.5, 1, 0)

# confusion matrix
con_mat_train <- table(train_data$pred, train_data$Survived,dnn= c("Predicted", "Actual"))
con_mat_test <- table(test_data$pred, test_data$Survived,dnn= c("Predicted", "Actual"))

# Accuracy
cat("Accuracy_train:" , (con_mat_train[1,1]+con_mat_train[2,2]) / sum(con_mat_train), 
    "\nAccuracy_test:" , (con_mat_test[1,1]+con_mat_test[2,2]) / sum(con_mat_test))

acc_train <- mean(train_data$Survived == train_data$pred)
acc_test <- mean(test_data$Survived == test_data$pred)
cat("Accuracy_train_m:" , acc_train, 
    "\nAccuracy_test_m:", acc_test)

acc_trainlm <- mean(train_data$Survived == train_data$pred_lm)
acc_testlm <- mean(test_data$Survived == test_data$pred_lm)
cat("Accuracy_train_lm:" , acc_train, 
    "\nAccuracy_test_lm:", acc_test)
