
# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the SVR Model to the dataset
library(e1071)
# Create your regressor here
regressor= svm(formula= Salary ~ . , data = dataset, type= 'eps-regression' )
summary(regressor)
# Predicting a new result
y_pred5 = predict(regressor, data.frame(Level = 6.5))
?svm
# Visualising the SVR Model results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary),size=3,colour = 'red') +
    geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
              colour = 'blue', size=3) +
    ggtitle('Truth or Bluff (Regression Model)') + xlab('Level') + ylab('Salary')+
    theme(axis.title.x=element_text(color="Red", size=30),
          axis.title.y=element_text(color="DarkGreen",size=30),
          plot.title=element_text(color="DarkBlue", size=30))

