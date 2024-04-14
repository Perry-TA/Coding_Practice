# week 1

#_______________________________
# 1) simple sums

1 + 1 # addition = 2
2 * 2 # times = 4
3 / 2 # division = 1.5
4 - 5 # subtraction = -1

(1+3*5)/(4)  # 

100^2 # 10000
25^2 +25 # 650  squaring
25^0.5 # 5 square root
27^0.3334 # 3 cube root

#_______________________________
# 2) making variables

w <- 
x <- 100  # assigning the numeric value of 100 to "x"
y <- x^2  # assigning the numeric value of x to the power of 2 to "y"
z <- "Ten Thousand"  # assigning character value of ten thousand

class(z) # checking class

x*y # a million as 100x 100^2 (10000) = 1,000,000

print(y/x/x/x) # 10000 divided by 100^3 = 0.01 10^4 - 10^6 = 10^-2

#____________________________
# 3) Data classes

# There are 4 main data classes
   
 # 'logical', 'character', 'numeric', and 'integer'
 # numerical operators only work with like operators, so numeric to numeric
 # cross interaction will result in an error being flagged 
 # the is.____ function and class() function can be used to check what type of data class is used

a <- TRUE # making a true variable
b <- FALSE # making a false variable

# ifelse can be used to change logical operators to what ever character type you like

2 >=2 # checking is 2 is greater than or equal to 2 = TRUE
2 > -10 # checking if 2 is greater -10 = TRUE
3 < 10 # if 3 is less than 10 = TRUE
10 <= 3 # if 10 is less than or equal to 3 = FALSE
10 != 10 # if 10 is not equal to 10 = FALSE
100^2 == 10000 # if 100 to the power of 2 is equal to 10,000 = True

100^2 == 10000 & 10 != 10 # if (5) is equal & (6) is not equal = FALSE 
100^2 == 10000 | 10 != 10 # if (5) is equal OR (6) is not equal = TRUE, takes either one if they are true

#___________________________________
# 4 Questions

#1) TRUE
#2) FALSE
#3) TRUE
#4) FALSE

# 4.2 Extra

#5) 
  x <- "the cake" # making a character variable "the cake"
  y <- "a lie"  # making a character variable "a lie"
  x == y # False, the values are not the same
  
#6)
  p <- nchar("perry") # creating a character variable with my name using nchar to list how many letters my name has
  p >= 10L # asking whether my name is greater than or equal to 6 letter long
  # false
  
p < 6L & p != "James"  & p != "Janelle" & #  logical expression to find out whether my name is 
  p != "Jamil" & p != "Jessica"              # less than 6 letters and whether it is not a collection of names
   # TRUE         

#______________________________
# 5) Scalars, Vectors and Matrices
  
  # scalars = value of a single input, eg x <- 2 or y <- "is a lie"
  # vectors = multiple values of a single input eg x <- c()

# 5.1 making vectors with c() <- collection
 #examples:
  
  w <- c(0.23, 0.33, 0.43, 0.53) # numerical vector
  x <- c(1:10) # integer vector
  y <- c("SAVE", "ME", "AHHHH") # character vector
  z <- c(TRUE, FALSE, TRUE) # logical vector
  
class(z) # to check vector classes
is.integer(w) # to check if the class of vector "w" is an integer vector, FALSE
 
# use of the rep function to repeat sequences a number of times
x <- rep(c("I", "WILL", "NOT", "TELL", "LIES" ), times = 20) # making a character vector using repeat 5 words 20 times to make an 100 element vector
 print(x) # print the repeated 100 element vector of repeating 5 distinct character elements, 20 times

y <- rep(c("a","b","c"), each = 5, times = 1) # making a character vector to repeat words 5 times after each other
 print(y)

# 5.2 - using the seq function
 # seq() makes numerical sequences: from = (start) , to = (end) , by = each value listed 

seq(from =1 , to = 50) # making a sequence from 1 to 50, no breaks
 seq(from = 0, to = 50, by = 10) # the same but every tenth value in the sequence is listed
ruler  <- seq(from = 0 , to = 15 ,  by = 0.1) # making a vector from the sequence function that lists from 0 to 15 staggered by 0.5
  
# 5.3 - subscripts and ":"
# a quick way of making a sequence using the integer class:

    x <- (10:-10) # integer sequence denoting from 10 to 3 in descending order
    print(x)
    
# with sub scripting, we can get a certain position of the sequence above  
    
    x[6] # position 6 yields integer element 5 in the "x" sequence
    x[1:7] # positions "1:7 yields all numbers from 10 to 4 in the "x" sequence   
    x[7:1] # same as above but  in the ascending order (the reverse order precisely)
    x[seq(from = 1, to = 20, by = 5)] # using seq function to obtain the positions of the 1 to 20 elements by 5
    
# its possible to subscript vectors with logical statements
   
    x <-c(1:20)
    x < 5 # checks if any of the elements in the sequence are less then 5

    # returns logical data which we can use to subset the vector
    
    y <- x[x < 10] # making the vector "y" which checks if the x sequence has numbers less than 10
    print(y) # y vector prints all numbers lower than 10

    vector1 <- c(2:15)
    x <- vector1[vector1 <= 7] # making a vector for all values in the sequence that are less than or equal to 7
    print(x) # prints the new vector which incorporates the above logical expression, listing numbers that are less than or equal to 7
    
    y <- vector1[vector1 %% 3 == 0] # creating a vector that checks whether the vector1 has any numbers divisible to 3
    print(y) # vector y prints all numbers in vector1 that is divisible by 3    
    
# 5.4 Matrices
   # we can make a 2D matrix, which acts as a table for any data we want to place
  vector2 <- c(2,4,6,8,10,12) # a vector with 6 elements, so we need either a 2x3 or a 3x2 (row, column) dimensions
mat1  <-  matrix(vector2, nrow = 2, ncol = 3, # making a vector by using the vector sequence before to make a matrix 2 x 3
           byrow = TRUE) # "By row" changes the presentation of the elements TRUE = elements going across, FALSE = element going down (by column)
mat1    
    #- Stuff
      #1) already said
  
      #2) 
        vector3 <- c("a","b","c","d","e","f","g","h","i","j","k","l")
mat2 <- matrix(vector3, nrow = 3 ,   # making new matrix out of vector3
               ncol = 4,      # 4 columns
               byrow = FALSE)    # elements presenting in column order
mat2    
 #sub scripting vectors, to see specific values in the matrix
      #3) 
        mat2[1,2] # row 1, column 2
        mat2[-1,] # do not show row one but highlight all columns
        mat2[,-2] # show all rows but remove column two from the print
        mat2[1:5] # show elements in position 1 to 5 in the matrix
        mat2[1,] # return all elements on the 1st row
        mat2[,4] # return all fourth column elements

        mat2[3,4] # third element of the fourth column
        mat2[2:3,1] # returning second and third row elements of the first column
        
#___________________________________
   # 6 The Data frame 
      # 6.1 basics
   NYC <- read.csv("NYTBestsellers.csv") # reading csv
    # unlike matrices, data frames can contain different classes of data
  
   str(NYC) # checking the structure of Bestsellers, filled with just int and chr classes
 
   NYC[1:5, 2:6] # prints the first to fifth elements from columns 2 to 6 of the data frame "NYC"
   NYC[1:5, "title"] # chooses the first 5 elements from the column "title" of the data frame "NYC"
   NYC[3,] # printing all Information from row 3 of the data frame "NYC" 

  #6.2 "Dollar" or "$" sign and where it matters
   
   # use of the $ helps with choosing parts of the data frame one wants to select
   NYC$title[1:5] # prints out information from the first 5 elements from the title column 
   NYC$total_weeks[2:10] # prints information regarding elements 2 to 10 of the total weeks column
   NYC[2:10,"total_weeks"] # same as above but without using the $ sign
   
   # can even make new columns in the data frame 
   NYC$number_of_pages <- rep(c("100","200","300"  # elements for editing
                                ,"400","500"), 
                                each = 20,         # print 20 each
                                times = 1 )        # print once, no repeats
   #or
   # using seq + req function as a solution
   NYC$number_of_pages <- rep(seq(from = 100, # start from value 100
                                  to = 500,   # end by 500
                                  by = 100),  # separate by 100
                                  each = 20) # repeat this sequence 20 times
    
#________________________________
   # 7 - second questions

#Q8) what are the classes
  # "character" 
   # "integer"
   # "logical"
   # "numerical"
#9) vector every even number between 1:100
   
   vect1 <- c(1:100)
  y <- vect1[vect1 %% 2 == 0]   # making a vector for all even numbers by using the divisor function
   print(y) # print even between 1:100 vector
   #or
  vec1 <- seq(2,100, by =2) # using seq function (faster)
     
#10) vector in odd numbers between 1000:1500 which are divisible by 7
   vect2 <- seq(1001, 1500, by =2) # vector of all odd numbers for 1000:1500
   z <- vect2[vect2 %% 7 == 0] # addition vector for all odd that are divisible by 7
   print(z)   # print vector
  
#11) make a vector of all books in the top spot for at least 10 weeks
   top2 <- NYC$title[NYC$total_weeks >=10]   # i dont understand this one
              # seems self explanatory
#12) less than 10 weeks and characters less than 15 characters long

   LessNYC <- NYC[NYC$total_weeks < 10 & nchar(NYC$title) < 15,] 

#13) Add a new column
  
   LessNYC$long10 <- nchar(LessNYC$title) == 10
   no <- FALSE  # adding to environment, turning false to no
   yes <- TRUE  # turning true to yes and adding to environment
   LessNYC$long10 <-ifelse(LessNYC$long10 ,TRUE, FALSE) # using ifelse to change logical arguments to yes & no

   editedNYC <-LessNYC[,2:4] # make a different data frame for "title", "author" ,and "year"
   editedNYC$long10 <- LessNYC$long10 # add the long10 data frame from the previous data frame
   print(editedNYC) # print new data frame

# easy way

   easyNYC <-LessNYC[,c("title","author","year","long10")]
