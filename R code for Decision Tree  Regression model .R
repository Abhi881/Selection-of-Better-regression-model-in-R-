
## Importing dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the Decision Tree Regression Model to the dataset
library(rpart)
# Create your Decision Tree Regression  regressor here
regressor= rpart(formula= Salary ~ . , data = dataset, , control= rpart.control(minsplit = 1) )
summary(regressor)
# Predicting a new result
y_pred6= predict(regressor, data.frame(Level = 6.5))

# Visualising the Decision Tree Regression  Model results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary),size=3,colour = 'red') +
    geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),size=3,colour = 'blue') +
    ggtitle('Truth or Bluff (Decision Tree Regression )') + xlab('Level') + ylab('Salary')+
    theme(axis.title.x=element_text(color="Red", size=30),
          axis.title.y=element_text(color="DarkGreen",size=30),
          plot.title=element_text(color="DarkBlue", size=30))

