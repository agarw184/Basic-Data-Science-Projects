#Project - 3
#Abhimanyu Agarwal, agarw184

### Question 1
#Loads into dataframe called "splash_mountain" using read.csv()
splash_mountain <- read.csv("/class/datamine/data/disney/splash_mountain.csv")

#Columns/features in the dataset 
str(splash_mountain)
#Either works, just out of curiosity. 
#Returns the two values, the first value = rows and second value = columns:
dim(splash_mountain)

### Question 2
#Code to find SPOTSMIN 
head(splash_mountain$SPOSTMIN)

#Code to find SACTMIN
head(splash_mountain$SACTMIN)

#Code to estimate the mean by removing NA values 
mean(splash_mountain$SPOSTMIN, na.rm=TRUE)
#Obtained mean is: -71.70373

#Code to estimate the standard deviation by removing NA values 
sqrt(var(splash_mountain$SPOSTMIN, na.rm=TRUE))
#Obtained Standard deviation is: 328.0586 

#Result explanation here
# The data set column given to us talks about wait time.
# Waiting time expected cannot be negative quantity.
# Mean obtained is negative, which is impossible in reality. 
# Hence we can say that the data set comprises of large negative values 
# or significantly small positive values 

### Question 3
#Here we are using TRUE's and FALSE's as indexes 
#Code to estimate the mean by removing NA values 
mean(splash_mountain$SPOSTMIN[splash_mountain$SPOSTMIN != -999], na.rm = TRUE)
#Newly obtained mean is: 43.3892

#Code to estimate the standard deviation by removing NA values 
sqrt(var(splash_mountain$SPOSTMIN[splash_mountain$SPOSTMIN != -999], na.rm = TRUE))
#Newly obtained standard deviation is: 31.74894

#Yes, this solves the problem. Now that, negative value -999 has been eliminated
#the computed mean is a positive and believable value. Earlier, when the mean 
#was negative, it didn't make sense to have a negative mean for the wait time.   

###Question 4
#Change SPOSTMIN to posted_min_wait time
head(splash_mountain)
colnames(splash_mountain)[which(colnames(splash_mountain)=="SPOSTMIN")] <- "posted_min_wait_time"
#View the name change 
head(splash_mountain)

#Change SACTMIN to actual_wait_time
head(splash_mountain)
colnames(splash_mountain)[which(colnames(splash_mountain)=="SACTMIN")] <- "actual_wait_time" 
#View the name change 
head(splash_mountain)

###Question 5
#Loading the samedata in a dataframe "df"
myDF <- read.csv("/class/datamine/data/disney/splash_mountain.csv")
head(myDF)

#Now using the cut() functions 
quarter <- cut(as.Date(myDF$date, "%m/%d/%Y"), "quarter")

#Estimating the possible combinations 
nlevels(quarter)
#There are 20 quarters as we can see. 

#Using factor() function we put labels like "q1", "q2"...etc 
levels(quarter) <- (paste0("q", 1:nlevels(quarter)))

#Now we add a new column called "quarter"
myDF$quarter<-quarter

#Now we add a new column called "quarter"
head(myDF)
tail(myDF)

#Question 6
#Including the statement 
cat ("I acknowledge that the STAT 19000/29000/39000 1-credit Data Mine seminar will be recorded and posted on Piazza, for participants in this course.")
