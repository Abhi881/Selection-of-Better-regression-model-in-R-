
## Importing dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the Random Forest to the dataset
library(randomForest)
# Create your Random Forest regressor here
set.seed(1234)
regressor= randomForest(x= dataset[1], y= dataset$Salary, ntree = 500)
summary(regressor)
# Predicting a new result
y_pred7 = predict(regressor, data.frame(Level = 6.5))
?randomForest


# Visualising the Random Forest results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary),size=3,colour = 'red') +
    geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),size=3,colour = 'blue', alpha=0.4) +
    ggtitle('Truth or Bluff (Random Forest)') + xlab('Level') + ylab('Salary')+
    theme(axis.title.x=element_text(color="Red", size=30),
          axis.title.y=element_text(color="DarkGreen",size=30),
          plot.title=element_text(color="DarkBlue", size=30))