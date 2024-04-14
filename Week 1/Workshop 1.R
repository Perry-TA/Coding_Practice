x <- 15
y <- 20
z <- 125

a <- TRUE
b <- FALSE


0.99 < 1 | 0 > 2


# 4)
#Q1, TRUE

#Q2, FALSE
x <- 12 / 3 > 3 & 5 ^ 2 < 25
#Q3, TRUE
y <- 12 / 3 > 3 | 5 ^ 2 < 25 | 1 == 2
#Q4,false 



#Q5)

The_cake <- 1  #Assigning value to "The cake"
A_lie <- 0    #Assigning value to "A lie"
a <- The_cake  # creating objects from "The cake"
b <- A_lie # Creating an object for "A lie"
a == b     # Logical assumption
The_cake == A_lie  # second check
# Answer = False

#Q6) # Logical expression to check if name is greater than or equal to an arbitrary number "6"
PERRY <- 5 # length of my name
PERRY >= 6 #FALSE
b <- nchar("perry") #assigning length of name to object "b"
b >= 6L # testing number length assumption

#Q7) checking if name is less than 6 letters and is not "James, Janelle, Jamil or Jessica"

x <- nchar("PERRY") 
x < 6L
#b
y <- "Perry"
y == "James"
y == "Jessica"
y == "Janelle"
y == "Jamil"

#5)

x <- c(1, 3, 5, 7, 9, 11) # numerical matrix
y <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE) #logical matrix

rep(x = c(1, 3, 5, 7, 9, 11), times = 2) # testing repetition function

rep(x = c("I", "will", "not", "tell", "lies"), times = 100)
dam<-rep(x = c("a","b","c"), each = 5, times = 1)
?rep()


# 5.2 seq
?seq # arguments for seq: by= number increment, length.out= desired length
    # along.with=manipulating the length using seq length, 
    #from & to = starting and end values

seq.int(from = 0, to = 15, by = 0.1 )


# 5.3 sequences/sub scripting

seq(from = 5, to =50) # sequence numbers from 5 to 50 by 1
seq(from =5, to = -50, by = -10) # sequence numbers from 5 to -50, by minus 10


x <- c("a", "b", "c", "d", "e")
str(x) #character matrix
x[3] # subscript, choosing the third value in the matrix, sequence

x[2:5] # choosing values 2 to 5 in the sequence
x[5:2] # same as before but backwards

x[seq(from =1, to = 5, by = 2)] # sub scripting choosing every second value in the sequence

y <- c(2,3,4,5,6,7,8,9,10,
       11,12,13,14,15) # new sequence
Z <- y[y <= 7] # Choosing all numbers equal to and below "7"
Z

Z2 <-Z[Z %% 3 == 0] # FINALLY
Z2



#5.4
mat1.data <- c(1:9)
mat1 <- matrix(mat1.data,
               nrow = 3,
               ncol = 3,
               byrow = FALSE) # Changing this changes the row orientation from across 
                              # to numbers in the sequence going down
mat1

mat3.data <- c("a", "b", "c", "d", "e", 
               "f", "g", "h", "i", "j", 
               "k", "l")
mat3 <- matrix(mat3.data,
               nrow = 3,
               ncol = 4,
               byrow = FALSE) 

mat3 == letters[1:12]
class(pi)

mat3[1,4] # locating the first row, fourth column
mat3[2:4] # first row second to fourth value
mat3[3,2:4] # third row, second to fourth value

mat3[3,4] # third element, fourth column
mat3[2:3,1]    # 2nd and 3rd rows of the 4 column "k and l"
mat3[2:3,]    # return all but the elements of the first row



#6 - data frame

BS <- read.csv("NYTBestsellers.csv")
str(BS)     # Checking structure

BS[3,]
BS[1:5,"title"] # First subscript is for the row values, 
#second subscript is for the column  subjects

#6.2
hist(BS$year) # Histogram choosing the data frame in respect to ($) the year
hist(BS$year [1:20]) # choosing specific data frames 1 to 20
#20 = 100, 40 = 200, 60 = 300, 80 = 400, 100 = 500
BS$Number_of_pages <-rep(A, times = (ncol(BS)))
# rep(x = c("a","b","c"), each = 5, times = 1)
A <- c(rep("100", times = 20),rep("200", times =20),   # organizing specific column
       rep("300", times = 20), rep("400", times =20),
                                  rep("500", times =20))
str(A)

BS$Number_of_pages <-c(A)  # adding "A" Column to existing data set using $
print(BS$Number_of_pages)
#alternate way
BS$Number_of_pages <- rep(seq(from = 100, # start from value 100
                              to = 500,   # end value 500
                              by = 100), # increments of 100
                              each= 20) # each value generates 20 repeats "each"
?rep

#Use seq to create the rep function
?seq
#7)
#Q1 - Character, integer, logical, numerical 
#Q2 
Mat1.data <- c(1:100)
Mat1.data[seq(0, 100, 2)]
str(Mat1.data)
Mat2 <- seq(1001,1500, 2)
Mat2 

Mat2v <- Mat2[Mat2 %% 7 ==0] # Mat2 all integers divisible by 7
Mat2v # the print

#Q3 Using the NYT bestseller data, create a vector of 
# the names all the books that were in the top spot for at least 10 weeks.
BS_Title<- BS[1:100,"title"]
BS_Ten <- BS$title[BS$total_weeks >= 10] # Choosing all numbers equal to and above "10 weeks"
 
print(BS_Title)
str(BS_Title)

Ten_Weeks<- BS_Title[BS$total_weeks >= 10]# ALL NAMES OF TOP SELLERS
                                      # FOR MORE THAN 10 WEEKS OR EQUAL TO
print(Ten_Weeks)

#Q4 - Using the NYT bestseller data, create a new data frame where all the 
#books were in the top spot for less than 10 weeks and have titles that are 
#less than 15 characters long.
Less <- BS[ BS$total_weeks < 10 & nchar(BS$title) < 15,] #books were in the top spot for less than 10 weeks 
print(Less_ten)



#Q5 - Add a new column to your data frame called ‘long10’ that contains the word 
# ‘yes’ if the book title is 10 characters long, and ‘no’ if it is not
Less$long10 <- nchar(Less$title) == 10 # Vector made to parse titles with 10 characters, logical TRUE & FALSE
Less$long10 <- ifelse(Less$long10, "yes", "no") #  change name of
                                          #logical statements to no or yes
?ifelse
nrow(Less) #see dimensions "49"
ncol(Less) # see number of rows "2"
str(Less) # Chr
names(Less) # column names

#Q6 - Using sub scripting, update your edited data frame 
# to only contain the ‘title’, ‘author’, ‘year’ and ‘long10’ columns.
#Adding an author column


# lame short cut
Lame<-(BS[,2:4]) # new data frame

Lame$long10 <- nchar(Lame$title) != 10 # adding long10 to new vector

Lame$long10 <- ifelse(Lame$long10, "no", "yes") #changing logical answers to "yes" or "no"

# Now, have to reduce ones with less than 
# 10 weeks + less than 15 characters

Lame$Total_weeks <- BS$total_weeks # Moving total weeks from old data frame to edited one

Lame2<-Lame[Lame$Total_weeks < 10,]  #books were in the top spot for less than 10 weeks 
print(Lame2)


#making less ten with less than 15 characters
Lame3<-Lame2[nchar(as.character(Lame2$title))<15,]


#Super lame short cut achieved
Lame4 <- Lame3[,1:4]

print(Lame4[,1:4])

finalLame <- Less [,c("title", "author", "year", "long10")]

 