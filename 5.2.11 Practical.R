# 1. Prepare your workstation

# Import the necessary libraries.
library(tidyverse)

# Set your working directory.
# Import the insurance data set (insurance.csv).
health <- read.csv('insurance.csv', header=T)
health <- read.csv(file.choose(), header=TRUE)

# View the data frame.
head(health)
str(health)
summary(health)
as_tibble(health)

# 1 Age
ggplot(health, aes(x=age))+
  geom_bar()

# 2 Children
ggplot(health, aes(x=children))+
  geom_bar()

ggplot(health,
       # Specify 'y' to create a percentage. 
       aes(x = children, y = ..count../sum(..count..))) +  
  # Specify attributes.
  geom_histogram(fill = 'red', color = 'black', stat = 'count') +
  # Specify titles.
  labs(x = "Number of Children",
       y = "Percent",
       title = "Individuals by number of children") +  
  # Pass labels to the scale.
  scale_y_continuous(label = scales::percent) +
  # Flip the x-axis and y-axis.
  coord_flip() 

# 3. Region & Sex
ggplot(health, aes(x = region, fill = sex)) +  
  # Specify the geom_bar function.
  geom_bar()

ggplot(health, aes(x = region, fill = sex)) +  
  # Specify the geom_bar function.
  # Add position.
  geom_bar(position = 'dodge') +  
  # Change fill colours.
  scale_fill_manual(values=c('blue', 'dark green'))

# 4. Smoker and sex.
ggplot(health, aes(x = sex, fill = smoker)) +  
  # Specify the geom_bar function.
  geom_bar()

# 5. BMI and sex.
ggplot(health, aes(x = sex, y = bmi)) +
  # Specify the geom_boxplot function.
  geom_boxplot(fill = 'blue', notch = TRUE, outlier.color = 'black') +
  # Specify the titles.
  labs(title = "BMI by sex") +  
  # Add a 'minimal' theme.
  theme_minimal()

# 6. BMI and region
ggplot(health, aes(x = region, y = bmi)) +
  # Specify the geom_boxplot function.
  geom_boxplot(fill = 'white', notch = TRUE, outlier.color = 'black') +
  # Specify the titles.
  labs(title = "BMI by Region") +  
  # Add a 'minimal' theme.
  theme_minimal()

# 7. BMI and smoker

ggplot(health, aes(x = smoker, y = bmi)) +
  # Specify the geom_boxplot function.
  geom_boxplot(fill = 'pink', notch = TRUE, outlier.color = 'black') +
  # Specify the titles.
  labs(title = "BMI by Smoking") +  
  # Add a 'minimal' theme.
  theme_minimal()

# 8. Smoker and charges.
ggplot(health, aes(x = smoker, y = charges)) +
  # Specify the geom_violin function.
  geom_boxplot()

######################################

# LSE Data Analytics Online Career Accelerator
# DA301: Advanced Analytics for Organisational Impact

# Practical activity: Choosing the right graphic

###############################################################################
# This is the solution to the practical activity

# As we've seen, ggplot2 provides us with a wide array of visualisation types 
# to explore, analyse, and share data. Additionally, following the grammar of 
# graphics code template means the code to make aesthetic and data changes to 
# plots is relatively quick and easy to add. However, plots need to be used 
# with the right type of data for us to gain maximum benefit.In this practical
# activity, you'll practise selecting the right chart for your data.

# I4U wants you to continue exploring and analysing the client data set it 
# shared with you earlier in the week. Previously, you statistically examined 
# the BMI column and looked at the relationship between BMI and the charges I4U
# health insurance holders pay. You then used plots to analyse the relationship
# between I4U clients' age and the charges they pay. 

# Now, to prepare for an upcoming quarterly meeting, I4U has asked you to 
# create graphs or plots in R to illustrate the relationship between a number
# of variables in its client data set.

# Create individual plots to visualise and explore each of the specified
# variables that best display the data. (Hint: Before choosing which plot is
# best for each variable, identify whether the variable is categorical or
# quantitative data.) The variables are:
# - age
# - children
# - region and sex
# - smoker and sex
# - BMI and sex
# - BMI and region
# - BMI and smoker
# - smoker and charges.

###############################################################################

# 1. Prepare your workstation

# Import the necessary libraries.
library(tidyverse)

# Set your working directory.
# Import the insurance data set (insurance.csv).
health <- read.csv('insurance.csv', header=T)
health <- read.csv(file.choose(), header=T)


# View the data frame.
head(health)
str(health)
summary(health)


###############################################################################

# 2. Create visualisations

# The plots below are suggestions and other plots may work better for you!
# Remember to motivate your choice of visualisation.
# Feel free to play with colours, labels and titles.


# 2a) Plot age on a histogram.
ggplot(health, aes(x=age)) +
  geom_histogram(stat='count',
                 fill='blue')


####

# 2b) Plot children on a histogram.
ggplot(health, aes(x=children)) +
  geom_histogram(stat='count',
                 fill='red')


####

# 2c) Plot region and sex on a stacked barplot.
ggplot(health, aes(x=region, fill=sex)) +
  geom_bar()


####

# 2d) Plot smoker and sex on a grouped barplot.
ggplot(health, aes(x=smoker, fill=sex)) +
  geom_bar(position='dodge')


####

# 2e) Plot BMI and sex on a side-by-side boxplot.
ggplot(health, aes(x=sex, y=bmi)) +
  geom_boxplot()


####

# 2f) Plot BMI and region on a side-by-side violinplot.
ggplot(health, aes(x=region, y=bmi)) +
  geom_violin(fill='orange')


####

# 2g) Plot BMI and smoker on a side-by-side boxplot.
ggplot(health, aes(x=smoker, y=bmi)) +
  geom_boxplot(fill='purple')


###############################################################################

# 3. Select two plots to add colour, titles, and labels.

# We have chosen the BMI vs smoker plot.
ggplot(health, aes(x=smoker, y=bmi)) +
  geom_boxplot(fill='green',
               notch=TRUE,
               outlier.color='blue')


# We have chosen smoker vs sex.
ggplot(health, aes(x=smoker, fill=sex)) +
  geom_bar(position='dodge') +
  scale_fill_manual(values=c('purple', 'orange')) +
  labs(title="Count of male and female smokers")


###############################################################################

# 4. Select two plots and and add a suitable theme

# For a website:
ggplot(health, aes(x=region, y=bmi)) +
  geom_violin() +
  theme_dark()



# For a publication:
ggplot(health, aes(x=region, fill=sex)) +
  geom_bar() +
  theme_classic()


