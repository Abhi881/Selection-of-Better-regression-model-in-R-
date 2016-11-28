## set the directory of R studio As Same in which data is avalilable
setwd("D:\\desktop files\\R Directory\\Machine Learning Data")

## Importing dataset
dataset<- read.csv("Position_Salaries.csv")

## filtering Required data for analysis
dataset= dataset[2:3]
write.csv(dataset, "dataset 1.csv")

## we are not splitting data because of less observations

# fitting linera regression to the dataset
lin_reg<- lm(formula = Salary ~ ., data = dataset)
summary(lin_reg)

# Preparing dataset 2
dataset$level2= dataset$Level^2
# fitting polynomial regression to the dataset 2
poly_reg1<- lm(formula = Salary ~ ., data = dataset)
summary(poly_reg1)

# Preparing dataset 3
dataset$level3= dataset$Level^3
# fitting polynomial regression to the dataset 3
poly_reg2<- lm(formula = Salary ~ ., data = dataset)
summary(poly_reg2)

# Preparing dataset 4
dataset$level4= dataset$Level^4
# fitting polynomial regression to the dataset 4
poly_reg3<- lm(formula = Salary ~ ., data = dataset)
summary(poly_reg3)

## predicting the test set result for linear regression model

y_pred<- predict(lin_reg, newdata= dataset)

## visulising the linear dataset result
library(ggplot2)
ggplot()+ geom_point(aes(x= dataset$Level, y= dataset$Salary),size=3, colour= "red")+
    geom_line(aes(x= dataset$Level, y= predict(lin_reg, newdata = dataset)),size=3, colour= "blue")+
    ggtitle("Linear Regression Model")+ xlab("Level")+ylab("Salary")+
    theme(axis.title.x=element_text(color="Red", size=30),
          axis.title.y=element_text(color="DarkGreen",size=30),
          plot.title=element_text(color="DarkBlue", size=30))

## visulising the Polynomial dataset result

library(ggplot2)
ggplot()+ geom_point(aes(x= dataset$Level, y= dataset$Salary),size=3,  colour= "red")+
    geom_line(aes(x= dataset$Level, y= predict(poly_reg1, newdata = dataset)),size=3, colour= "blue")+
    ggtitle("Polynomial Regression Model 1")+ xlab("Level")+   ylab("Salary")+
    theme(axis.title.x=element_text(color="Red", size=30),
          axis.title.y=element_text(color="DarkGreen",size=30),
          plot.title=element_text(color="DarkBlue", size=30))

## visulising the Polynomial dataset 2 result

ggplot()+ geom_point(aes(x= dataset$Level, y= dataset$Salary),size= 3, colour= "red")+
    geom_line(aes(x= dataset$Level, y= predict(poly_reg2, newdata = dataset)),size=3, colour= "blue")+
    ggtitle("Polynomial Regression Model 2")+ xlab("Level")+ ylab("Salary")+
    theme(axis.title.x=element_text(color="Red", size=30),
          axis.title.y=element_text(color="DarkGreen",size=30),
          plot.title=element_text(color="DarkBlue", size=30))

## visulising the Polynomial dataset 3 result

ggplot()+ geom_point(aes(x= dataset$Level, y= dataset$Salary),size=3, colour= "red")+
    geom_line(aes(x= dataset$Level, y= predict(poly_reg3, newdata = dataset)), size=3,colour= "blue")+
    ggtitle("Polynomial Regression Model 3")+ xlab("Level")+ ylab("Salary")+
    theme(axis.title.x=element_text(color="Red", size=30),
          axis.title.y=element_text(color="DarkGreen",size=30),
          plot.title=element_text(color="DarkBlue", size=30))

# predicting through linear model for 6.5 level
Y_pred1= predict(lin_reg, data.frame(Level=6.5))

# predicting through ploynomial model for 6.5 level
Y_pred2 <- predict(poly_reg1, data.frame(Level=6.5, level2= 6.5^2))
Y_pred3 <-  predict(poly_reg2, data.frame(Level=6.5, level2= 6.5^2, level3= 6.5^3))
Y_pred4 <- predict(poly_reg3, data.frame(Level=6.5, level2= 6.5^2, level3= 6.5^3, level4= 6.5^4))
## Prediction Output Table for Level 6.5 for all level
Salary_Prediction <-  c(Y_pred1, Y_pred2,Y_pred3,Y_pred4)
Modelling_Type <- c("Linear Regression", "Polynomial Reg. model1", "Polynomial Reg. model2", "Polynomial Reg. model3")
Level <- c(6.5,6.5,6.5,6.5)
output<- data.frame(Modelling_Type,Level ,Salary_Prediction)
write.csv(output, "Prediction Output for Level 6.csv")


