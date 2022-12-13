# Import tidyverse library.
library(tidyverse) 

# Set your working directory.
# Import the data set (wages_plots.csv).
wages_plots <- read.csv(file.choose(), header=TRUE) 

# Print/return the data frame.
wages_plots 

# Plot a bar chart by passing the x-variable and data source, then set the geom type:
qplot(age, data=wages_plots, geom='bar')

# Stacked bar chart.
qplot(age, fill=education, data=wages_plots, geom='bar')

# Boxplot
qplot(wage, race, data=wages_plots, geom='boxplot')

# Changing aesthetics in qplot.
qplot(wage,race, data=wages_plots, colour=I('red'), geom='boxplot')

# Heatmap
qplot(race, education, fill=wage, data=wages_plots, geom='raster')

# Facets in qplot
qplot(age, wage, data=wages_plots, facets=education~race)

# Question: Looking back at the age and wage scatterplot, what does the smoothing curve
# look like?
qplot(age, wage, data=wages_plots, geom=c('point', 'smooth'))

# Question: How does the level of education map across age and wage?
qplot(age, wage, colour=education, data=wages_plots)
qplot(age, wage, colour=race, data=wages_plots)
qplot(age, wage, colour=jobclass, data=wages_plots)

# Question: How do individuals’ race and level of education relate to their wage?
qplot(race, education, colour=wage, data=wages_plots)
# jitter added to clarify
qplot(race, education, colour=wage, data=wages_plots,
      geom=c('point', 'jitter'))

# 4.2.7

# Plot 1 looks at age, job class, and education
qplot(age, jobclass, colour=education, data=wages_plots)

qplot(jobclass, age, colour=education, data=wages_plots, geom=c('jitter'))

qplot(age, data=wages_plots, facets=education~jobclass)

qplot(jobclass,
      age,
      colour=education, 
      data=wages_plots,
      geom=c('point', 'jitter'))

# Plot 2 looks at age, education, and race.
qplot(age, education, colour=race, data=wages_plots, geom='col')

qplot(age,
      education,
      colour=race, 
      data=wages_plots,
      geom=c('point', 'jitter'))

qplot(education,
      age,
      colour=jobclass,
      data=wages_plots,
      geom='boxplot')

# Plot 3 looks at education, wage, and race.
qplot(education, wage, shape=race, data=wages_plots, geom='boxplot')

qplot(wage,
      race,
      colour=education,
      data=wages_plots,
      geom='boxplot')
