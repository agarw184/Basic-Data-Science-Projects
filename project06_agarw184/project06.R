#Project - 6
#Abhimanyu Agarwal, agarw184

### Question 1
#Loads into dataframe called "accidents" using read.csv()
dat <- read.csv("/class/datamine/data/fars/7581.csv")

#tapply 
tapply(dat$PERSONS, dat$DRUNK_DR, mean, na.rm = T)

#Method Preferred 
#From question 4 of Project 5, where we worked on solving the problem iteratively. Here the tapply() function does that for us. 
#It can observed that using tapply() function did a quicker job than using loops to estimate the mean. 
#Moreover, it significantly reduces the code complexity. Therefore, using tapply() instead of using loops turns out to be better method. 

# Read in data that maps state codes to state names
state_names <- read.csv("/class/datamine/data/fars/states.csv")

# Create a vector of state names called v
v <- state_names$state

# Set the names of the new vector to the codes
names(v) <- state_names$code

# Create a new column in the dat dataframe with the actual names of the states
dat$mystates <- v[as.character(dat$STATE)]

### Question 2
sort(tapply(dat$DRUNK_DR, dat$mystates, mean, na.rm = T), decreasing  = TRUE)
#New Hampshire has the highest average number of drunk drivers per accident

### Question 3
sort(tapply(dat$FATALS, dat$DAY_WEEK, sum, na.rm = T), decreasing = TRUE)
#It is observed that Sundays (Number - 7) have the highest number of fatalities

tapply(dat$FATALS, dat$DAY_WEEK, sum, na.rm = T) / tapply(dat$PERSONS, dat$DAY_WEEK, sum, na.rm = T)
#In my opinion, values obtained are pretty high as the ratio is almost close ~0.5 for some days of the week. 
#It is observed that the 'Unknown' category demonstrates the highest average. 
#However, it is the unknown category and therefore it is inconclusive. 
#From the days in the week, it is observed that most of the days have a relatively close ratio.
#The highest value is on Thursday that is, 0.45

###Question 4
tapply(dat$DRUNK_DR, dat$ALIGNMNT, mean, na.rm = T)

#Don't need this, but this is another way of doing it. I jsut wanted to try it
#Straight roads 
sum(dat$DRUNK_DR[dat$ALIGNMNT == 1]) / sum(dat$ALIGNMNT == 1)

#Curved roads 
sum(dat$DRUNK_DR[dat$ALIGNMNT == 2]) / sum(dat$ALIGNMNT == 2)

#Unknown scenarios 
sum(dat$DRUNK_DR[dat$ALIGNMNT == 9]) / sum(dat$ALIGNMNT == 9)

###Question 5 
#Total number of fatalities in the respective breaks
tapply(dat$FATALS, cut(dat$HOUR, breaks = c(0,6,12,18,24,99), include.lowest = TRUE), sum, na.rm = T)

#Average number of fatalities in the respective breaks
tapply(dat$FATALS, cut(dat$HOUR, breaks = c(0,6,12,18,24,99), include.lowest = TRUE), mean, na.rm = T)

## Pledge
#By submitting this work I hereby pledge that this is my own, personal work. I've acknowledged in the designated place at the top of this file all sources that I used to complete said work, including but not limited to: online resources, books, and electronic communications. I've noted all collaboration with fellow students and/or TA's. I did not copy or plagiarize another's work.

