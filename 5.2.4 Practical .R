# Import the necessary packages.
library(tidyverse)
library(moments)
library(BSDA)

health <- read.csv(file.choose(), header=T)

View(health)
dim(health)
head(health)
str(health)

# 2. Compute descriptive statistics.

# Call the function to calculate the mean.
mean(health$bmi) 
# Call the function to calculate the median.
median(health$bmi) 

# Determine the minimum and maximum value.
min(health$bmi)   
max(health$bmi) 

# Range = Max - Min.
max(health$bmi) - min(health$bmi)  

# Calculate Q1 and Q3.
quantile(health$bmi, 0.25)  
quantile(health$bmi, 0.75)

# Use the summary() function.
summary(health$bmi)

# Calculate IQR.
IQR(health$bmi)  

# Dataset descriptive statistics.
summary(health)

# 3. Determine whether the data (bmi column) is normally distributed:
# Specify boxplot function.
boxplot(health$bmi)

# Specify histogram function.
hist(health$bmi)

# 4. Determine normality of data.

# Specify qqnorm function (draw a qqplot).
qqnorm(health$bmi)

# Specify qqline function.
qqline(health$bmi) 

## Shapiro-Wilk test:
# Specify shapiro.test function (Shapiro-Wilk test).
shapiro.test(health$bmi)
# Our p-value is <0.05, and we can conclude that the sample data is not 
# normally distribution.

# Specify the skewness and kurtosis functions.
skewness(health$bmi)
# Our output suggests a positive skewness.

kurtosis(health$bmi)
# Our kurtosis value is less than 3, suggesting our data is platykurtic.

# 5. Run a test to check the correlation between BMI and client age (remember to 
# check for normality in client age). What type of correlation exists between the two variables?
# Specify qqnorm function (draw a qqplot).
qqnorm(health$age)

# Specify qqline function.
qqline(health$age) 

## Shapiro-Wilk test:
# Specify shapiro.test function (Shapiro-Wilk test).
shapiro.test(health$age)
# Our output is less than 0.5, and we can assume non normality.

# Specify the skewness and kurtosis functions.
skewness(health$age) 
kurtosis(health$age)

dim(health)

cor(health$age, health$bmi)
