# Loading the dataset
library(MASS)
data("Boston")
head(Boston)

# Simple linear regression model with lstat
fit1 = lm(medv~lstat, data = Boston)
summary(fit1)

# Simple linear regression model with lstat and black
fit2 = lm(medv~lstat+black, data = Boston)
summary(fit2)

# multiple linear regression model with all variables
fit3 = lm(medv~., data = Boston)
summary(fit3)

# multiple linear regression model with all variables except indus
fit4 = lm(medv~.-indus, data = Boston)
summary(fit4)

# plots for the linear regression model with all variables
# by par function plots will displayed as a 2 x 2 matrix
par(mfrow=c(2,2))
plot(fit3)

# checking Variance Inflation Factor
install.packages("car")
library(car)
vif(fit3)

## split data into train and test
# taking 80% of rows to training set
trainID = sample(1:nrow(Boston),round(0.8*nrow(Boston)))

# training set made from above rows and all the columns
train=Boston[trainID,]
# testing set made from rest of rows and all the columns
test=Boston[-trainID,]

# fitting the training set
fit = lm(medv~.,data=train)
summary(fit)

# Predicting the test data
# y_pred has the values predicted by the model
y_pred = predict(fit,test)
# y_actual has the original values
y_actual = test$medv

# Mean Squared Error
MSE = mean((y_actual-y_pred)^2)
MSE

# Root Mean Squared Error (simply the square root of MSE)
RMSE =sqrt(MSE)
RMSE