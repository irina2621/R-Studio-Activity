# Import the ggplot2 library.
library(ggplot2)

insurance <- read.csv(file.choose(), header=T)

head(insurance)
str(insurance)
summary(insurance)

# 2. Create visualisations:
ggplot(insurance, aes(x=jitter(age), y=charges))+
  geom_point()+
  geom_smooth(se=FALSE)
# 3. Create new df
# remove outliers with charges>50000
new_health <- subset(insurance, charges<50000)
head(new_health)

# Create new scatterplot with df new_health.
ggplot(new_health, aes(x=jitter(age), y=charges))+
  geom_point()+
  geom_smooth(se=FALSE)

# Create three scatterplots to compare age and charges based on sex.
ggplot(new_health, aes(x=age, y=charges, color=sex))+
  geom_point()+
  geom_smooth(se=FALSE)

ggplot(new_health, aes(x=age, y=charges, color=sex))+
  geom_smooth(se=FALSE)

# Create three scatterplots to compare age and charges based on region.
ggplot(new_health, aes(x=age, y=charges, color=region))+
  geom_point()+
  geom_smooth(se=FALSE)

ggplot(new_health, aes(x=age, y=charges, color=region))+
  geom_smooth(se=FALSE)

as_tibble(new_health)
new_health <- mutate(new_health, children = as.character(children))
as_tibble(new_health)
# Create three scatterplots to compare age and charges based on children.
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='red',
             alpha=0.75,
             size=1) +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") + 
  facet_wrap(~children)

# 2d) Add a third variable (smoker)
ggplot(new_health, 
       mapping=aes(x=age, y=charges, col=smoker)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of member") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges")

ggplot(new_health, aes(x=age, y=charges, color=smoker))+
  geom_point()+
  geom_smooth(se=FALSE)

ggplot(new_health, aes(x=age, y=charges, color=smoker))+
  geom_smooth(se=FALSE)


