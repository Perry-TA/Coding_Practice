
#_______________________________
# Loops and functions I

# Loops are pretty important in most if not all types of coding
# They essentially repeat code multiple times
# there are different types of basic loops: For loops, while loops, nested loops etc

# example of a for loop
for (i in 1:10) {    # making a for loop, i = iterative, vector is 1:10, runs 10 times
  print(i)           # printing the iterative, prints the sequence between 1 through 10 in ten loops, once each.
}

# nested loop
for (i in 1:6) {    # first loop, loop occurs after the loop within
  for (j in 7) {    #second loop inside the first one, starts first
    print(j)      # prints just seven at the start and after every loop with the i iterative
  }
 print(i)         # prints sequences 6 times from 1 to 6 each
}
# 2.2
# the above for loop uses the i ( or iterative) to print the data inside the vector
# the first i would be 1, the the second i would be 2 and so on.

# we can make the iterative anything and assign it a vector inside

x <- 5            # make the scalar x equal to 5
for (j in 1:5) {  # construct a for loop with "j" iterative that runs 5 times
  x <- x + j      # add the value of x to the iterative value
  print(x)        # print the new value of x 5 times
}
print(x)
# the value of x is saved from the first loop (6) and used in the second loop to add to the value of j (2) making 8
# this continues from the second loop to the third with the value of x now 8 is added to the third loop which the j is = 3 making 11 and so on

# 2.3 basic loop questions

#1)
# answered in the above script, basically print (x) prints 5 times adding 1 each time to the sequence

#2)
# if you change the vector from five to ten, the length of the loop changes, more numbers are printed

#3)
# already done (i to j)

#4)
x <- c(10:20)
for (i in 1) {  # for loop choosing the number of loops to 1
  x2 <- x^2     # square each number in the vector x by 2
  print(x2)     # print the modified x vector, prints once all the
}

#or
for (i in 10:20) { # length 10 of 10 to 20 values
  print(i^2)       # print square of the iterative
}

#2.4 looping over non-integer vectors
# loops can take character vectors as well

whiplash <- c('Were', 'you', 'rushing', 'or', 'were', 'you', 'dragging?')
for (word in whiplash) {   # for loop for the above quote, loops each word separately, length is as long as the quote
  print(toupper(word))     # prints the iterative in upper case
}

# can use 1:length as well
for (placeh in 1:length(whiplash)) {   # for loop for the above quote, loops each word separately, length 
  print(toupper(whiplash[placeh]))     # prints the iterative of each word using sub scripting of the iterative
}
#you get the same result

# the placeh is the iterative, 1:length sets the length to be as long as the vector, making this loop over
# toupper puts all characters in the loop as upper case, whiplash is the input vector
# whiplash[placeh] is using the iterative to subscript the vector, highlighting all words in the character vector sequence

#________________________________
# 3. Saving outputs
# its important to save outputs using an empty output vector with the input vector and then use both
# inside the for loop

output <- vector() # makes an empty vector, like a save file
for (i in 1:length(whiplash)) {   # for loop for the above quote, loops each word separately, seq_along is as long if the quote
  output[i] <- nchar(whiplash[i])  
}
print(output)   # prints the save file once, if this was in the for loop, it would have printed 7 times

# nchar counts how many characters are in each word in the vector sequence

wordwords <- vector() # empty vector
words <- c('buzz','cross', 'broads','fore','')

for (i in 1:length(words)){   # for loop
  wordwords[i] <- gsub(pattern = "$",      # "$" to anchor the end of each word
                       replacement = 'word', # replace the end with "word"
                       words[i] )          # using the gsub function to bypass " non-numeric argument to binary operator"
}
print(wordwords) # print

#_________________________________
# 4. conditional statements
# for evaluation of conditions, parses through dataset to see if they are true or false
# the allows for more complex for loops

# 4.1 Using if()

input <-c(10,100,1000,4,10000,33, 345,100000)
  for (i in input) {   # for loop
    if(i >100){      # condition if i is over 100
      print(i)   #prints all numbers in input if i is over 100
    }
  }
# when the condition is met, or is true, the number is printed.
# can do this again but with the paste function to add words and a particular presentation

input <-c(10,100,1000,4,10000,33, 345,100000)
for (i in input) {   # for loop
  if(i >100 & i < 11000){      # condition if i is over 100 and less than 11,000
    print(paste(i, "is greater than 100 & less than 11,000" ))   # prints all numbers in input if i is over 100
  }
}

# 4.2 using else
# else can define another thing that was false in the first codnitional statement

input <-c(10,100,1000,4,10000,33, 345,100000)
for (i in input) {   # for loop
  if(i > 100 & i < 11000){      # condition if i is over 100 and less than 11,000
    print(paste(i, "is greater than 100 & less than 11,000", sep = " " ))   # prints all numbers in input if i is over 100
  } else if (i <= 100 & i < 11000) {
    print(paste(i, "is less than or equal to 100 and less than 11,000", sep = " ")) # prints all numbers less than 100 and less than 11,000
  } else if (i > 100 & i >11000) {
    print(paste(i, "is greater than 100 and greater than 11,000",sep = " "))    # prints all numbers more than 100 and greater than 11,000
  } 
}
#____________________________
#5. questions

 #1

output <- vector()
nacci <- c(1,1,3,5,8,13,21) # numeric vector
for (j in 1:length(nacci)) { #for loop with length of the vector
  print(j^0.5)  # prints the ^0.5 of fib sequence
  }


#or
e <-sequence()
for (i in 3:10) {
  i <- (i-1)+(i-2)
  print(i)
}

 #2 
whiplash <- c('Were', 'you', 'rushing', 'or', 'were', 'you', 'dragging?')

for (i in whiplash) { # for loop for the above quote, loops each word separately, length is as long as the quote
  if (nchar(i) >= 4L & nchar(i) <= 6L ){   # if word is 4-6 letters long
  print(paste(i))                          # paste i
  }else if (nchar(i) < 4) {                 # if word is less than 4 letter long
  print(paste("no"))                       # print paste "no
  }else {                                   # any other condition
  print(paste("harry potter"))  # print "harry potter"
  }   
}


#3

garbled_film_quote <- vector()
whiplash <- c('Were', 'you', 
              'rushing', 'or', 
              'were', 'you', 
              'dragging?')

for (i in 1:length(whiplash)) { # for loop for the above quote, loops each word separately, length is as long as the quote
  if (nchar(whiplash[i]) >= 4L & nchar(i) <= 6L ){             # if word is 4-6 letters long
garbled_film_quote[i] <-   whiplash[i]                        
  }else if (nchar(whiplash[i]) < 4) {                          # if word is less than 4 letter long
garbled_film_quote[i] <-    "no"             
  }else {                                            # any other condition
garbled_film_quote[i] <-  "harry potter"     
  }   
}


print(garbled_film_quote)




#____________________________
# 6. challenge

alphabet <- matrix(data = c('A','B','C','D','E','F','G','H',
                            'I','J','K','L','M','N','O','P',
                            'Q','R','T','S','U','V','W','X',
                            'Y','Z'),
                   nrow = 2)
position <- matrix(data = c('first','second','third',
                            'fourth','fifth','sixth',
                            'seventh','eighth','ninth',
                            'tenth','eleventh','twelfth',
                            'thirteenth','fourteenth','fifteenth',
                            'sixteenth','seventeenth','eighteenth',
                            'nineteenth','twentieth','twenty first',
                            'twenty second','twenty third','twenty fourth',
                            'twenty fifth','twenty sixth'),
                   nrow = 2)

for (i in 1:length(alphabet)) {    # nested loop
  for (j in 1:length(position)) {
    if( i==j) {                    #use of conditional, if first iterative is of equal length to second iterative
      print(paste(alphabet[i],  # print paste the words from the alphabet vector with the iterative specigying the position
                  "is the", position[j], 
                  "letter of the alphabet", 
                  collapse =  "")) 
    }
  }
}

# or
# use for uneven matrix or vectors
for (i in 1:13) {
  for (j in 1:2) {
      print(paste(alphabet[j,i], "is the", position[j,i],"letter of the alphabet", collapse =  ""))
  }
}

#__________________________________________________________
# Loops and functions II

#2) While loops

# while loops loop over a conditional statement 
x <-0
while(x < 10){ # while x is less than 10
  x<- x + 1    # add the value of x
  print(paste("the value is now", x, sep = " ")) # will print 10 loops
}
