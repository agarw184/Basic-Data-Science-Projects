#Project - 5
#Abhimanyu Agarwal, agarw184

### Question 1
#Loads into dataframe called "accidents" using read.csv() and rbind()
accidents <- rbind(read.csv("/class/datamine/data/fars/1975/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1976/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1977/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1978/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1979/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1980/ACCIDENT.CSV"),
                   read.csv("/class/datamine/data/fars/1981/ACCIDENT.CSV"))
#Reports the dataframes dimensions 
dim(accidents)

#Prints the current dataframe 
head(accidents)
tail(accidents)

#Adds a new year column that contains the full year
accidents$YEAR <- factor(paste0("19", accidents$YEAR))

#Prints the updated datframe 
head(accidents)
tail(accidents)

#Reports the stats for the dataframe "accident" 
table(accidents$YEAR)

#Displays the output for the unique()
#Basically displays the unique levels/states 
unique(accidents$YEAR)

### Question 2
head(accidents)
table(accidents$DRUNK_DR)
table(accidents$SCH_BUS, useNA = "always")

#Gives you a table to see when is that true, false or N/A  
table((accidents$DRUNK_DR != 0)&(accidents$SCH_BUS == 1), useNA = "always")

#Number of accidents in totality with atleast 1 drunk driver and 1 bus.
length(which((accidents$DRUNK_DR != 0)&(accidents$SCH_BUS == 1)))
#There are 101 accidents with at least 1 drunk driver with a school bus. 

### Question 3
#Tells how many accidents took place in the given span of time (for each year).
table(accidents$YEAR[(accidents$DRUNK_DR != 0)&(accidents$SCH_BUS == 1)])

#Tells what is maximum amount of accidents. 
max(table(accidents$YEAR[(accidents$DRUNK_DR != 0)&(accidents$SCH_BUS == 1)]))

#Tells which year witnessed maximum amount of accidents.
which.max(table(accidents$YEAR[(accidents$DRUNK_DR != 0)&(accidents$SCH_BUS == 1)]))
#1978 has the maximum number of accidents  

###Question 4
#Groups the variable/ first argument into categories based on the second argument
#Applies specific mathematical function like variance, sum etc to the grouped data.
tapply(accidents$PERSONS, accidents$DRUNK_DR, mean)

###Question 5 
#Captures the relevant states data into the dataframe "state"
state <- accidents[(accidents$STATE %in% c(17,18,26,39)), ]

#Checking the dimensions of the dataframe 
dim(state)

#Table t is formulated 
t <- table(state$STATE, state$MONTH)

#Barplot with legend is generated
barplot(t, legend = rownames(t))

#From the bar graph, it can be concluded that the summer months (6 to 9) witness 
#the greatest rise in the number of accidents. As the summer passes a decrease 
#in the incidents can be observed. The increment in the accident numbers can be 
#because of people could be on vacations during the summer or partying with friends.
#With all the hustle, maybe people just arent as attentive as they should be. 


## Pledge
#By submitting this work I hereby pledge that this is my own, personal work. I've acknowledged in the designated place at the top of this file all sources that I used to complete said work, including but not limited to: online resources, books, and electronic communications. I've noted all collaboration with fellow students and/or TA's. I did not copy or plagiarize another's work.

