# Simple Linear Regression

# Importing the dataset
dataset = read.csv('salary.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Fitting Simple Linear Regression to the Training set
## First dependent variable, then independent one
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the Test set results using previously created regressor
y_pred = predict(regressor, newdata = test_set)

## Compare y_pred with test set

# Visualising the Training set results (using ggplot2)
library(ggplot2)  
ggplot() +       ## To initiate separate componens with '+' 
## aes for aesthetics; plotting observation points          
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
## plotting regression line using created regressor 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
## Titles
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')

# Visualising the Test set results (using ggplot2)
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')
