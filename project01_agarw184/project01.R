# Abhimanyu Agarwal, agarw184
# Project - 1

#1. 
#   The memory on the 7 frontend nodes is: (4*512 + 3*768) GB = 4352 GB = 4.3 TB and (4*20 + 3*20) = 140 cores. 
#   The memory on the 28 nodes in the sub-cluster is: (24*64 + 4*192) GB = 2304 GB = 2.3 TB and (24*20 + 4*16) = 544 cores.
#   The memory on Abhimanyu's laptop is 8 GB and 4 cores.

#2. 
#   The node we are working on is: 
system("hostname")
#   Working on Scholar frontend number 00.

#3. 
#   Printed Message Sentence: "You've successfully loaded The Data Mine R settings!"

#4. 
#   There are 3 chunks of R code, 1 chunk of Python, 1 chunk of Bash and 1 chunk of SQL.

#5. 
#   2nd R code chunk.
my_variable <- c(1,2,3)
my_variable
#   Basically 1,2 and 3 are stored into a variable called "my_variable". 
#   The displayed output is: 1 2 3

#6. 
#   Referring back to question 1, we can perform the following arithmetic calculations: 
#   Memory (GB) and Core (Number of Core units) calculations using R for 7 front end respectively:
4 * 512 + 3 * 768
4 * 20 + 3 * 20

#   Memory (GB) and Core (Number of Core units) calculations using R for 28 sub-clusters respectively:
24 * 64 + 4 * 192 
24 * 20 + 4 * 16

#7.
#   We load in given dataset as follows:
dat <- read.csv("/class/datamine/data/disney/splash_mountain.csv")
head(dat)

#8.
#   Submission
#   Submitting deliverable: project01.RMD, project01.R and project01.pdf
