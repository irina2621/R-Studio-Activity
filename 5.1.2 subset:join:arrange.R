# Import package needed for data manipulations.
library(tidyverse)

# Load .csv file
travelmode <- read.csv(file.choose(), header = TRUE)
as_tibble(travelmode)

# Drop 2 columns: X and gender as we dont need them.
travelmode <- subset(travelmode, select = -c(X, gender))

# Check the names of the columns left.
names(travelmode)

# Rename columns.
travelmode <- travelmode%>%
  rename(waiting_time = wait,
         vehicle_cost= vcost,
         travel_time = travel,
         general_cost = gcost,
         family_size = size)

# View the result.
head(travelmode)

# 1. Calculate total cost for clients who prefer cars.
# Use subset to separate clients with car
car_costs <- subset(travelmode, mode == 'car')
#Use mutate function to calculate total costs and add aditional column with data.
car_costs <- car_costs%>%
  mutate(total_costs=vehicle_cost + general_cost)
head(car_costs)

# We can add this dataset to our main dataframe travelmode using left join. Only 
# the observations with car mode will be updated, the rest will have NA.
joined_travelmode <- left_join(travelmode, car_costs)
head(joined_travelmode)

# To check the dimension of the new dataframe and that no extra rows were added
# we can use dim function.
dim(joined_travelmode)

# 2. Create dataframes for each mode using filter//select()
# Create dataframe Families >2 prefer air mode and select columns to have:
air_family <- select(filter(travelmode, mode == 'air',
                            family_size>='2'),
                     c(individual, choice:family_size))
head(air_family)

# Create dataframe Families>2 prefer train.
train_family <- select(filter(travelmode, mode == 'train',
                            family_size>='2'),
                     c(individual, choice:family_size))
head(train_family)

# Create dataframe Families>2 prefer bus.
bus_family <- select(filter(travelmode, mode == 'bus',
                              family_size>='2'),
                       c(individual, choice:family_size))
head(bus_family)

# Create dataframe Families>2 prefer car.
car_family <- select(filter(travelmode, mode == 'car',
                              family_size>='2'),
                       c(individual, choice:family_size))
head(car_family)

# How many families prefer air travel?
air_family%>%
  count(choice)
# How many families prefer train travel?
train_family%>%
  count(choice)
# How many families prefer bus travel?
bus_family%>%
  count(choice)
# How many families prefer car travel?
car_family%>%
  count(choice)

# Find average costs and general costs for families using air/train/bus/car? Use 
# summarise() which create new dataframe and hold values.
mean_car_costs <- summarise(car_family, mean_vc = mean(vehicle_cost),
                            mean_GC = mean(general_cost))
mean_car_costs

mean_air_costs <- summarise(air_family, mean_vc = mean(vehicle_cost),
                            mean_GC = mean(general_cost))
mean_air_costs

mean_bus_costs <- summarise(bus_family, mean_vc = mean(vehicle_cost),
                            mean_GC = mean(general_cost))
mean_bus_costs

mean_train_costs <- summarise(train_family, mean_vc = mean(vehicle_cost),
                            mean_GC = mean(general_cost))
mean_train_costs

# Create a dataframe with average costs for land travel.
mean_land_costs <- rbind(mean_bus_costs, mean_car_costs, mean_train_costs)
mean_land_costs

# Add new column to that showing the transport mode.
vehicle <- c('car', 'bus', 'train')
mean_costs <- cbind(vehicle, mean_land_costs)
mean_costs

# Lets arrange the data in desc order.
arrange(mean_costs, desc(mean_GC))
