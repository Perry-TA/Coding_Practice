#______________________________
# Regular expressions round 2

# 2.1 introduction
# regular expressions is a tool used to find certain elements in data sets
# that are of interest, they allow for the seeking of specific characters,
# words, numbers or phrases in addition to complex patterns in text

# consider this character vector containing a film quote from "Lord of the Rings"

lotr_quote <-c("It's", 'a', 'dangerous', 'business', 'Frodo', 'going', 
              'out', 'your', 'door', 'You', 'step', 'onto', 'the', 'road', 
              'and', 'if', 'you', 'dont', 'keep', 'your', 'feet', 
              'theres', 'no', 'knowing', 'where', 'you', 'might', 
              'be', 'swept', 'off', 'to.')

# we can used the grep function to find all elements in the vector that have the word "you"

the_lotr <-grep(pattern = 'you',
                lotr_quote) # make a vector using grep to find the pattern 'you'
print(the_lotr) # print all positions 'you' is in the lotr quote

lotr_quote[the_lotr] # subscript to return all words part of the pattern

# we wanted 'you' but 'your' also was picked, so we need to make the pattern more specific
# we can make the pattern more specific if you use anchor signs
# ^ = start anchor, $ = end anchor, . = all characters

the_lotr_anch <- grep(pattern = '^you$',
                      lotr_quote) # using anchor to specify the pattern for the vector using the grep function
print(the_lotr_anch) # print vector to see if 'you' has been specified
lotr_quote[the_lotr_anch] # return the sub script to see the above

# 2.2 - regular expression tools
# regular expressions can be used to find a range of patterns through use of a subscript and a hyphen (-)

all_range_lotr <- grep(pattern = ".",
                       lotr_quote) # basic search for all lower case words
print(all_range_lotr) # print the above vector

# we can do this with numbers like "[0-9]" and different cases "[A-z]" etc
# the character mentions above "." can specify all characters
# this can be combined with using letters

specify_lotr <- grep(pattern = "y.u", 
                     lotr_quote) # searching for when y & u are separated by any character
print(specify_lotr) # print positions in the quote all words that match the pattern
lotr_quote[specify_lotr] # returns all words in the pattern

# from this we can use anchoring to specify even further

# 2.3 Quantifiers
# Quantifiers add an additional level of specificity to searching element in a data set
# they enable users to select how many characters "grep" is matching to
# paired after "." a higher level of choice can be achieved

# the main Quantifier symbols are:
# "?" represents whether the letter after appears next to or 1 character after the preceeding character, 0-1
# "*" represents whether the letter after appears next to or after the proceeding character, 0+
# "+" represents whether the letter after appears 1 character after the preceeding character or more, 1+

# heres the difference

Quant1 <- grep(pattern = "o.?u", 
               lotr_quote) # make a vector
Quant1 # return vector, shows patterns o and u are next to or 1 character apart
  
Quant2 <- grep(pattern = "o.*u", 
               lotr_quote) # make a vector
Quant2 # return vector, shows 7 patterns with o and u being 0+ apart fro each other in one position (3)
  
Quant3 <- grep(pattern = "o.+u", 
               lotr_quote) # make a vector
Quant3 # return vector, no patterns with o and u being at least one character or more apart
# this regular expression highlights that all words from this quote have o and u next to each other

# 2.4 gsub() function
# like grep, gsub can search for patterns, but in addition, they can replace the pattern if need be

Replace_lotr <- gsub(pattern = "o.*u", 
                     replacement = "noob",
                     lotr_quote) # make a vector to replace the letters in words that the pattern recognizes
print(Replace_lotr) # print the whole quote, showing replacements being made, substituting the searched letters specified in the gsub function above

#________________________________
# 2.5 Challenge

# 1
dung <- read.csv("dung_beetles.csv") # read dung_beetles, make a vector/data frame with a shorter name

# 2
str(dung) # looking at the data frames structure
# integer heavy structure with a column for the names of the months
# data set that features number of dung beetles with their scientific names in different sites separated by months

# 3
dung_species <- dung[,3:50] # making a data frame with only species names
# or
dung_species2 <- colnames(dung[3:50]) # making a vector with species names and their data as the only element
dung_species2 # print to see if it worked

# 4
dung_species2[grep(pattern = "C", 
                   dung_species2)] # prints all genus names with "C"

# 5
# creates a vector correction of "Copis" to "Copris", using gsub
dung_species_Copris <- gsub(pattern = "Copis", 
                            replacement = "Copris", 
                            dung_species2 ) 
print(dung_species_Copris) # prints correction

# 6
# creates a vector correction of "copis" to "copris", using gsub
dung_species_Micro <- gsub(pattern = "copis", 
                            replacement = "copris", 
                            dung_species_Copris ) 
print(dung_species_Micro) # prints correction

# 7
# make a gsub command that can flexibly change genus and species names
dung_correct <- gsub(pattern = "opis",
                    replacement = "opris",
                    dung_species2)
print(dung_correct) # print

# 8
# replacing column names in old data set with new ones
colnames(dung_species) <- dung_correct # replace with corrections
print(dung_species)

#___________________________________

# mega challenge
# 1
# finding all species with genus starts with O and specific epithet ends in s
dung_grep <- dung_correct[grep(pattern = "^O.+s$", dung_correct)]

# 2
# sub setting ("()") data frame to highlight species from months ending 
# in y and genera with an O

dung_sub <- dung[grep(pattern = "y$", dung$Month),
                 c(1,2,grep(pattern = "^O", colnames(dung)))]

# unable to do last one, will come back