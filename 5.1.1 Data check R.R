# Install the necessary packages.
# Installing the tidyverse package is optional, as you've done this before.
# install.packages('tidyverse')
install.packages('skimr')
install.packages('DataExplorer') 

# Note that you only have to import the tidyverse package, as it consists of
# ggplot2, tibble, tidyr, readr, purrr, dplyr, stringr, and forcats. 
# However, for demonstration purposes, readr, dplyr and tidyr will be imported
# separately.

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
travelmode <- read.csv(file.choose(), header = TRUE)

#View the data.
head(travelmode)
tail(travelmode)
view(travelmode)

# Check the dimension.
dim(travelmode)

#Name of the columns as well as use for renaming
colnames(travelmode)
names(travelmode)

# View the structure. colum names, data types, values
str(travelmode)
glimpse(travelmode)
as_tibble(travelmode)

# Missing values to check.
travelmode[is.na(travelmode)]

# Test a random column for missing values. (if FALSE - has value)
is.na(travelmode$size)
# Test for missing values using SUM. Can be applied for a whole dataframe or for
# a single column. Can start checking the dataset by running on a whole df. If 
# zero is returned = no missing values.
sum(is.na(travelmode))
sum(is.na(travelmode$size))

# Discriptive statistics of the dataset.
summary(travelmode)
skim(travelmode)
DataExplorer::create_report(travelmode)
