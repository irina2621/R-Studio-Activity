# Import the necessary packages.
library(tidyverse)
library(moments)

install.packages('BSDA')
library(BSDA)

# Select your working directory.
# Import the CSV file (watches.csv). The CSV file has headers.
watches <- read.csv('watches.csv', header=T)

# Explore the data.
head(watches)
dim(watches)
summary(watches)
# Visualise the data.
# Histogram:
hist(watches$Store_B)

# Boxplot:
boxplot(watches$Store_B)

# Both plots indicate slightly skewed data (left-skewed) with a slightly longer 
# tail for the lower values. However, the distribution of the data seems normal.
# Let’s confirm normality.

# Q-Q plot to determine normality.
qqnorm(watches$Store_B)
qqline(watches$Store_B)

# Shapiro-Wilk test to determine normality.
shapiro.test(watches$Store_B)

# Compute the skewness and kurtosis.
skewness(watches$Store_B) 
kurtosis(watches$Store_B)

# Average of 250 watches sold per year.
# Note that mu=250 for one-sample z-test.
z.test(watches$Store_B,
       mu=250,
       sigma.x=30.15)
# The output indicates , which is greater than 0.05. Therefore, we can reject the 
# and conclude that Store_B sold more than 250 watches per year (true mean is 250.92).

##############################

# Two-sample z-test

# Visualise the data.
# Histogram:
hist(watches$Store_A)

# Boxplot:
boxplot(watches$Store_A)

# Q-Q plot to determine normality.
qqnorm(watches$Store_A)
qqline(watches$Store_A)

# Shapiro-Wilk test to determine normality.
shapiro.test(watches$Store_A)

# Compute skewness and kurtosis.
skewness(watches$Store_A) 
kurtosis(watches$Store_A)

# Average of 250 watches sold per year at both stores.
# Note that mu=0 for two-sample z-test.
z.test(watches$Store_B,
       watches$Store_A,
       mu=0,
       sigma.x = 30.15,
       sigma.y =12.26)
# The output indicates , which is smaller than 0.05. We can reject the  and conclude that 
# Therefore, the mean of Store_A minus the mean of Store_B is not equal to 0. However, 
# both stores sold more than 250 watches per year, since the true mean is 250.92 
# for Store_B and 348.08 for Store_A
