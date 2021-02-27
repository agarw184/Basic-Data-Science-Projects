#Project - 8
#Abhimanyu Agarwal, agarw184

### Question 1
#Loads into two distinct dataframes using read.csv()
books <- read.csv("/class/datamine/data/goodreads/csv/goodreads_books.csv")
authors <- read.csv("/class/datamine/data/goodreads/csv/goodreads_book_authors.csv")

strip_punctuation <- function(myColumn) {
  # Use regular expressions to identify punctuation.
  # Replace identified punctuation with an empty string ''.
  
  desc_no_punc <- gsub('[[:punct:]]+', '', myColumn)
  
  # Return the result
  return(desc_no_punc)
}
books$description <- strip_punctuation(books$description)
head(books$description)
#The function has one argument. It is called "mycolumn". The name of the function is string_punctation. 

### Question 2
#Initialize the test string 
test_string <- "This is  a test string  with no punctuation"

#Now we split the string into individual components using strsplit 
strsplit(test_string, c(" "))

#No, it is not accurate as it takes into account several other punctuations. 
#This affects the net result as to how the split turns out to be. 

### Question 3
#Breaks into individual words
unlist(strsplit(c(test_string)," "))

#Counts 
sum(unlist(strsplit(test_string, " ") [[1]] != ""))

#It is an alternative way of doing it 
#Uses the length instead both account 8
length(which(unlist(strsplit(test_string, " ") [[1]] != "")))

###Question 4
count_words <- function(description)
{
  aux <- gsub('[[:punct:]]+','', description)
  
  # split the sentence by space and remove extra spaces
  result <- sum(unlist(strsplit(aux, " ")) != "")
  return(result)
}
#It prints out the number of words
count_words(books$description[2])

###Question 5 
#Function takes in one argument and returns split based on first name, middle name and last. The argument is the complete name.
myfunction<- function(names) 
{
  return (unlist(strsplit(c(names), " ")))
}
head(authors$name)
myfunction(as.vector(authors$name))
head(authors$name)

## Pledge
#By submitting this work I hereby pledge that this is my own, personal work. I've acknowledged in the designated place at the top of this file all sources that I used to complete said work, including but not limited to: online resources, books, and electronic communications. I've noted all collaboration with fellow students and/or TA's. I did not copy or plagiarize another's work.

