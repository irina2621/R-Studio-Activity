# Group by in R
# %>% The forward pipe operator (%>%) allows you to take the output of one function
# and passes it into another function as an argument. This allows us to link a 
# sequence of analysis steps.In short, it indicates to R that you want to apply
# the group_by() function to the specified column(s) and the action(s) specified
# after the %>% to said columns. For example:
# group_by(region, sales) %>% summarise(total_sales=sum(sales), region=count(region))

# CO2 case study
# We need to import tidyverse of dplyr for the group_by function.
library(dplyr)

# Import built-in data set based on the CO2 uptake in grasses.
data('CO2')

# Dimensions of the data set.
dim(CO2)

# Calculate summary statistics
# Summarise the data frame.
# Group by the whole data frame.
group_by(CO2) %>% summarise(mean_concentration=mean(conc),
                            mean_uptake=mean(uptake))

# The output indicates the mean CO2 concentration of all the plants as 435 and 
# the mean CO2 uptake as 27.2.

# Group by more than one column.
# Include the different plant types and treatments.
# Specify the column names for grouping the data.
# The order of the column names is extremely important.
df_CO2 <- CO2 %>% group_by(Plant, Type, Treatment) %>%
  summarise(mean_concentration=mean(conc),
            mean_uptake=mean(uptake),
            .groups='drop')

# View the results.
df_CO2

# Calculate descriptive statistics
# What about standard deviation, variance, mean, max, and min?
# Let's exclude the Type column.
# Include the different plant types and treatments.
df_CO2 <- CO2 %>% group_by(Plant, Treatment) %>%
  summarise(sd_concentration=sd(conc),
            sd_uptake=sd(uptake),
            var_concentration=var(conc),
            var_uptake=var(uptake),
            mean_concentration=mean(conc),
            mean_uptake=mean(uptake),
            min_concentration=min(conc),
            min_uptake=min(uptake),
            max_concentration=max(conc),
            max_uptake=max(uptake),
            .groups='drop')

# View the results.
df_CO2

# 5.1.7 Practical activity: Data manipulation in R

# The whole tidyverse package.
library(tidyverse)
# Import and read CSV file.
library(readr)
# Data wrangling.
library(dplyr)
# Data wrangling.
library(tidyr)
# Create statistical summaries.
library(skimr)
# Create a report as an HTML file.
library(DataExplorer)

# Import the dile.
seatbelt <- read.csv(file.choose(), header = TRUE)

#View the data.
view(seatbelt)

# Check the dimension.
dim(seatbelt)

# View the structure. colum names, data types, values
as_tibble(seatbelt)

# Check NA values.
sum(is.na(seatbelt))
sum(is.na(seatbelt$seatbelt))

# Replace NA with 0.
seatbelt[is.na(seatbelt)] <- 0

# Check NA again after replacing.
sum(is.na(seatbelt))

# Check normality of distribution for the daytaset.
summary(seatbelt)

# Descriptive report.
DataExplorer::create_report(seatbelt)

names(seatbelt)

# Delete unnecessary columns.Keep only numeric columns. Remove X, as it is the same as id.
seatbelt1 <- subset(seatbelt, select = -c(X))
# Keep the numeric columns with subset() function.
seatbelt1 <- seatbelt1%>%keep(is.numeric)

# View.
head(seatbelt1)

# Round all the columns to two decimal places.
seatbelt1 <- round(seatbelt1, 2)
head(seatbelt1)

# Determine whether the columns are normally distributed with a boxplot.
boxplot(seatbelt1$miles)
boxplot(seatbelt1$fatalities)
boxplot(seatbelt1$income)
boxplot(seatbelt1$age)

# Calculate the sum, max, and min of all the columns with the apply() function.
# Round the answers to two decimal places. 
sapply(seatbelt1[,-1], sum)
sapply(seatbelt1, max)
sapply(seatbelt1, min)

# Advanced exercise:

# Focus on specific variables with select() function.
seatbelt_agg <- select(seatbelt, c('state',
                                   'year',
                                   'miles'))
# View the result.
as_tibble(seatbelt_agg)

# Focus on specific variables with the select() function.
seatbelt_agg2 <- select(seatbelt, c('drinkage',
                                    'year',
                                    'miles'))

# View the result.
as_tibble(seatbelt_agg2)
