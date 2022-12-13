# Install tidyverse.
install.packages('tidyverse')

# Import tidyverse library.
library(tidyverse) 

# Import the data set (wages_plots.csv).
wages_plots <- read.csv(file.choose(), header=TRUE) 

# View the data frame.
View(wages_plots) 
as_tibble(wages_plots)

# View a summary of the data frame.
summary(wages_plots)

# Specify X as age, y as wage, and wages_plots as the data source 
# (the x-axis variable is passed first, followed by the y-axis,
#  and then the source of the data is specified).
qplot(age, wage, data=wages_plots)

# Assign wage to the y variable, followed by the data source.
qplot(y=wage, data=wages_plots)

# First pass the x-variable, then specify the data source. 
qplot(age, data=wages_plots)
# Pass the x-variable, set the number of bins, and pass the data source. 
qplot(age, bins=5, data=wages_plots)
