# Import built-in data set based on the CO2 uptake in grasses.
# Because it is a built-in data set, you don't have to import tidyverse.
data('CO2') 

# View the data set. Note the capital V.
View(CO2)

# Dimensions of the data set. 
dim(CO2) 

# Mean CO2 uptake per treatment.
# Specify the function as aggregate(), the numeric variable (uptake),
# the grouping variable (conc), the additional grouping variable (treatment),
# the data source, and the mean.

aggregate(uptake~conc+Treatment, CO2, mean)

# Mean CO2 uptake per type.
aggregate(uptake~conc+Type+Treatment, CO2, mean)

# Compute the sum.
aggregate(uptake~conc, CO2, sum)

# Compute the standard deviation.
aggregate(uptake~conc, CO2, sd)

# Jo expected the  uptake to increase with the increase in  concentration. 
# She then added a second layer (variable) to determine the effect of Treatment
# (nonchilled and chilled) on the  uptake per  concentration. The chilled treatment
# for concentrations 95 and 175 had a lower  uptake than the nonchilled treatment.
# However,  concentrations of 250, 300, 500, 675, and 1,000 resulted in a lower 
# uptake for nonchilled than chilled.

# Jo then broke the experiment and data into smaller segments to compare the 
# uptake per concentration for both Treatment and Type. The results indicated 
# that Quebec had a higher  uptake for both Type and Treatment across the 
# different  concentrations. This might indicate that the  uptake is correlated
# with climate and/or soil conditions.

######################################################################

# apply()
# apply(X, MARGIN, FUN): . The input data type is a data frame or matrix, 
# while the output data type is a vector, matrix, or list.
# X: The name of the data frame or matrix as input data type.
# MARGIN: Apply a function to a row(s), column(s), and/or both, where 1 = row,
# 2 = colum, and c(1, 2) = both.
# FUN: The function you want to apply (e.g. sum).

# lapply()
# lapply(X, FUN): Apply a function to all the elements of the input, 
# while the output is a list.
# X: The name of the list, vector, or data frame as input data type.
# FUN: The function you want to apply (e.g. sum).

# tapply()
# tapply(X, INDEX, FUN): Apply a function to subsets of a vector, 
# while the output is a list.
# X: The name of the list, vector, or data frame as input data type.
# INDEX: A list containing factor.
# FUN: The function you want to apply (e.g. sum).

# mapply()
# The mapply() function can provide a multivariate version of lapply. 
# mapply(FUN, ...): The input data type is a vector, list, matrix, or 
# variables in a data frame, while the output data type is a matrix, vector, or list.
# FUN: The function to apply to the provided vector arguments.
# ...: A list of arguments to which the FUN is applied.
# For example: 
# Create a function called A.
# A <- function(x, y, z) {x+y-z}
# Create a list of vector arguments:
# x <- c(1, 0, 2)
# y <- c(0, 1, 2)
# z <- c(2, 1, 0)

# Employ the mapply() function.
# mapply(A, x, y, z)

# sapply()
# The sapply() function operates the same as lapply, but simplifies the result.
# sapply(X, FUN): Apply a function to all the elements of the input, while 
# the output is a vector or matrix.
# X: The name of the list, vector, or data frame as input data type.
# FUN: The function you want to apply (e.g. sum).

# 5.1.4 

# Name and build the matrix:
sales <- matrix(c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 
                  10, 30, 40, 50, 70, 85, 95, 110, 120, 125,
                  15, 20, 25, 35, 45, 55, 65, 70, 85, 95,
                  12, 20, 28, 35, 49, 60, 71, 80, 95, 105,
                  9, 15, 26, 38, 45, 59, 75, 85, 99, 110),
                nrow=10, byrow=FALSE)

# Specify row names:
rownames(sales) <- c('w1', 'w2', 'w3', 'w4', 'w5',
                     'w6', 'w7', 'w8', 'w9', 'w10')

# Specify the column names.
colnames(sales) <- c('t1', 't2', 't3', 't4', 't5') 

# Print the matrix.
sales 

# Verify the data structure.
class(sales)

# Maximum sales per week across 10 weeks:
# Specify data source, set the margin for rows,
# and add max function.

apply(sales, 1, max)

# Calculate mean per store:
# Specify data source, set the margin for columns,
# and add mean function.

apply(sales, 2, mean)
# Apply() for dataframe.
# Create/build a new data frame and assign it to sales.
sales.df <- data.frame (t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                        t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                        t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                        t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                        t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# Print the data frame.
sales.df  

# Confirm creation of data frame.
class(sales.df)

# Find the mean sales per week:
# Specify the data source, set the margin for rows,
# and add mean function.

apply(sales.df, 1, mean)

# Find the min/max/mean sales per store:
# Specify the data source, set the margin for column,
# and add min/max/mean function.

apply(sales.df, 2, min)
apply(sales.df, 2, max)
apply(sales.df, 2, mean)

# apply() function: Other options
# Consider that store t2 has been moved to another cluster and hence its mean 
# sales cannot be considered. Therefore, we want to determine the mean sales of
# all stores except t2. Use the apply() function and specify the data source as 
# sales.df, and specify the column to be excluded as [, -2]. (Note the square 
# brackets.) Next, specify the margin as 2 for columns, and set the function
# as mean. For example:

# Calculate mean sales for all stores except t2:
# Specify data source, specify excluded column,
# set the margin for columns, and  add mean function.

apply(sales.df[,-2], 2, mean)

# What if we want to exclude w10 as well? The code snippet will be the same as 
# the previous one, except that we will include the row number (-10) as well.

# Calculate mean sales for all stores except t2 and w10.

apply(sales.df[-10,-2], 2, mean)

# What if we have missing values in a data frame? Can we still use the apply()
# function? Let’s change the value of Row 1 and Column 5 to NA. To do this:
# Assign NA to Row 1 and Column 5 in sales.df. Remember the square brackets to 
# specify rows and columns. Print the data frame.

# Assign NA to row and column in sales.df.
sales.df [1, 5] <- NA   

# Print the data frame.
sales.df

# Calculate the mean without the NA:
# Specify the data source, the margin for columns,
# the function (min), and indicate to ignore NA values.

apply(sales.df, 2, min, na.rm=TRUE)

####################

# Lapply ():loops over a list and evaluates a function on each element. 
# The input data type is a vector, list, matrix, or variable(s) in a data frame,
# while the output data type is a list.

# Assign a new list and insert values.
sales.number <- list(t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                     t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                     t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                     t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                     t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# View the new list.
sales.number 

# Confirm list creation.
class(sales.number) 

# The output shows a list containing the sales data of the five stores across 10 weeks.

# Find mean sales in the sales.number list

# Specify the data list, the function (mean), 
# and determine the object class.

lapply(sales.number, mean)

# lapply() function: Data frame

# Assign a new data frame to the object and create a data frame:
computers.df <- data.frame(t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                           t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                           t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                           t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                           t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# Print the new data frame. 
computers.df 

# Check data frame.
class(computers.df) 

# Calculate the sd for each store (object as data frame, function as sd).

lapply(computers.df, sd)

################################################

# sapply() function The sapply() function is similar to the lapply() function in 
# that the input object can be a list, data frame, or vector. However, the sapply() 
# function simplifies the output to the most basic data structure (vector), 
# while the lapply() function always returns a list.

# Calculate the sd for each store (object as list, function as mean).

sapply(sales.number, mean)

# Calculate the sd for each store (object as data frame, function as sd).

sapply(computers.df, sd)

