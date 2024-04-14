# making regular expressions - grep
grep_out <- grep(pattern = 'the', x = sentence) # pattern function is the subject and the x function is the character function we want to search through

print(grep_out) # returns the numerical order the subject is place in 

sentence[grep_out] # returns the words

# for specific values use ^ before and $ anchors after the subject
pattern = '^the$'

# new script - making a vector sentence for regular expression use
Edgar_expressions.R <- c("Once", "upon", "a", "midnight", "dreary", "while", "I", "pondered", "weak", "and", "weary",
                           "Over", "many", "a", "quaint", "and", "curious", "volume", "of", "forgotten", "lore",
                           "While", "I", "nodded", "nearly", "napping", "suddenly", "there", "came", "a", "tapping",
                           "As", "of", "some", "one", "gently", "rapping", "rapping", "at", "my", "chamber","door",
                           "Tis", "some", "visitor","I", "muttered", "tapping", "at", "my", "chamber", "door",
                          "Only", "this", "and", "nothing", "more")

#focusing on some words from the vector sentence
grep_away <-grep(pattern = "ra", x = Edgar_expressions.R)

print(grep_away)

# Regular expression tools - 2.2

# you can specify certain letters in words a well
grep_away2 <-grep(pattern = "a.e", x = Edgar_expressions.R)
Edgar_expressions.R[grep_away2] # characters with the  combination of words "a" then "e"


# 2.3 - Quantifiers

grep_away3 <-grep(pattern = "e.?e", x = Edgar_expressions.R) # "?" whether there are 0-1 instances

Edgar_expressions.R[grep_away3]

grep_away4 <-grep(pattern = "e.*e", x = Edgar_expressions.R) # "*" whether there are 0+ instances

Edgar_expressions.R[grep_away4]

grep_away5 <-grep(pattern = "e.+e", x = Edgar_expressions.R) # "+" 1+ instances

Edgar_expressions.R[grep_away5]

# in this example, there is no difference, but in the workshop example, * shows all instances whether 0 instances = asl"ee"p or 1 or more = e-e - heavens

# 2.4 gsub - used to such for text but substitutes text with a specifically chosen text

gsub_away <- gsub(pattern = "t", x = Edgar_expressions.R, replacement = "ass") # replace all "t"s with "ass"

gsub_away # gsub is useful for showing the whole sentence and replacing the pattern with something else

# 2.5 - stuffs

dung_boys <- read.csv("dung_beetles.csv") # loading in data set
str(dung_boys) # looking at the structure, almost all columns are integer values but the "month" which is character

# making an object that has all species names

Species <- colnames(dung_boys[-1,3:50]) # using subscript to isolate names from the colomn titles

Species # all species names

Grep_out2 <- gsub(pattern = "C", x = Species, replacement = "&&&&&&&") # distinguishing species names starting with "C" with a glarish "&&&&&&"
Grep_out2

Grep_out3 <- gsub(pattern = "r", x = Species, replacement = "%%%%%%") # "" Same for "R"
Grep_out3 # 4 species names that have an r at the start of its second name
#5
Grep_correct <- gsub(pattern = "Copis", x = Species, replacement = "Copis") # "" correcting Copis to Corpis
Grep_correct # corrected version of the "Copris" species
#6
Grep_correct2 <- gsub(pattern = "Microcopis", x = Species, replacement = "Microcopris") # "" 
Grep_correct2 # Corrected version of the "Microcopris" species
#8 creating new gsub command that changes both copris and Microcoris

Grep_corrections <- gsub( pattern = "opis", x = Species, replacement = "opris") # flexible corrects to the misspellings
Grep_corrections

colnames(dung_boys)[3:50] <- Grep_corrections # replacing Species names

# EXTRA -------------------------------------------------

#10. Find all the species where the genus starts with an ‘O’ and the specific epithet ends in an ‘s’.
print(Species)
grep_genus <- grep(pattern = "O.*s$", x = Grep_corrections) 
              
Species[grep_genus] # print to see if it works
grep_genus

# 11. Subset the data frame using regular expressions so that it only contains data 
#     from months ending in a ‘y’ and genera starting with an ‘O’

Months_db <- dung_boys[,"Month"] # Checking the code for all recorded months
Months_db  # console print

Genus_O <- grep(pattern = "O", x = colnames(dung_boys)[3:50]) # using regular expressions to make an object for all genera starting with "O"
Genus_O
x <- grep(pattern = "y", x = dung_boys$Month ) # making a vector for all months ending in "y"
x

y <- Species[Genus_O] # making a vector for all Genera starting with the letter "O"
y
final_dung_boys <- dung_boys[x,y]  # placing the two changes into a new data frame
final_dung_boys
#adding Month column to data frame to the front
final_dung_boys <- cbind(Month = c("January","January","January","February",
                                    "February","May","May","May","May","July"), 
                                      final_dung_boys)          
