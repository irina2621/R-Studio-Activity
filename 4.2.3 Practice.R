getwd()
install.packages('tidyverse')
library(tidyverse)

data <- read.csv(file.choose(), header=T)

data

View(data) 
str(data)
dim(data)
typeof(data)
class(data)

write.csv(data, file='bikes_data.csv')

