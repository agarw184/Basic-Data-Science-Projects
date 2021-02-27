#Project - 2
#Abhimanyu Agarwal, agarw184

### Question 1
#Loads into dataframe called "meta" using read.csv()
myDF <- read.csv("/class/datamine/data/disney/metadata.csv")

#Prints the first n lines using head()
head(myDF)

### Question 2
#Given code in project 
our_vec <- myDF$WDWMAXTEMP

#Prints the first value
firstval <- our_vec[1]
head(firstval)
#Printed value is: 73.02

#Prints the 50th value
fiftyval <- our_vec[50]
head(fiftyval)
#Printed value is: 51.24

#Type of a vector
typeof(our_vec)
#Type is "double"

###Question 3
#First 50 values 
first50 <- head(our_vec, n = 50)
#Prints values of the first 50 elements.

#Last 50 values
last50 <- tail(our_vec, n = 50)
#Prints the values of the last 50 elements.

#Adding the elements 
mix <- first50 + last50
head(mix)
#Prints the values 

###Question 4
#Stores the temperature values greater or equal to 80. Since our_vec is already defined 
hot <- our_vec[our_vec >= 80]
head(hot)
#Prints some values 

#Tells us how many elements are in hot (vector)
length(hot)

#Sum of hot and first50
result <- hot + first50
#prints result 
head(result)

###Question 5
#Plotting the values captured by the vector
plot(our_vec, main='Max temperature Range (Degrees (F))', col='orange')

#Question 6
#Favorite graph would be the second one. The code is below :
library(ggplot2)
library(tidyverse)
summary_temperatures <- myDF %>%
  select(MONTHOFYEAR,WDWMAXTEMP:WDWMEANTEMP) %>%
  group_by(MONTHOFYEAR) %>%
  summarise_all(mean, na.rm=T)
ggplot(summary_temperatures, aes(x=MONTHOFYEAR)) +
  geom_ribbon(aes(ymin = WDWMINTEMP, ymax = WDWMAXTEMP), fill = "#ceb888", alpha=.5) +
  geom_line(aes(y = WDWMEANTEMP), col="#5D8AA8") +
  geom_point(aes(y = WDWMEANTEMP), pch=21,fill = "#5D8AA8", size=2) +
  theme_classic() +
  labs(x = 'Month', y = 'Temperature', title = 'Average temperature range' ) +
  scale_x_continuous(breaks=1:12, labels=month.abb)

#It is my favorite graphic because it is extremely detailed making it reader friendly, open to interpretation and doesn't show absurd variations.
#It discusses the topic - "Average Temperature Range". Moreover, this plot doesn't convey all information properly.
#It could be improvised by adding a legend, smoothing the variation could give a better sense of the Temperature Vs Month variation. 
#A fascinating aspect that attracted my attention was the convex shape of the plot with the peak being at approximately 80 Degrees(F). 
