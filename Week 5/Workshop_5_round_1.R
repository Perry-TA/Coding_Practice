#_________________________________
# Workshop 5 - tidy data

# rules
#1) Each row has its own observations "[x,]"
#2) Each column has a variable "[,y]"
#3) Each value has its own cell


dung_boys <-read.csv("dung_beetles_v1.csv") # loading up dung beetle data set
dung_boys # breaks rule 1 (species are the observations) and 2 (each month should have a column, each column are observations not variables)

dung_boys2 <-read.csv("dung_beetles_v2.csv") # loading up dung beetle data set
dung_boys2 # breaks rule 2 and 3, genus and species are two values joined into one for one and some cells have no values

dung_boys3 <-read.csv("dung_beetles_v3.csv") # loading up dung beetle data set
dung_boys3# fails all 3, multiple row observations (months) ,genus+ species, missing values 

dung_boys4 <-read.csv("dung_beetles_v4.csv") # loading up dung beetle data set
dung_boys4# apparently fails just number 3 (but i think it fails 1 and 2(has genus and species))

# while none are tidy, row 4 is the tidiest

# to see number of unique sites...

uniq_dungsites <-unique(dung_boys$Site) # making a vector using the unique function
length(uniq_dungsites) # length = 5

# to count the number of species
colnames(dung_boys[3:ncol(dung_boys)])

#counting number of species in data frame

length(unique(dung_boys3$spp)) # length = 3

#checking other 2

length((unique(dung_boys4$Site))) # beetle table 4 allows the counting all all variables

# so length is used to count variables

#________________________________
# 3 overviews of data sets

# to view larger data sets:
  # str() = for structure, cannot see larger sets
  # summary() = summarizes each variable (column), with int data in quartiles and averages and chr data with length and class
  # head() = views data in the console, will not work with wide tables 
  # view() = view data frame in another tab, works with larger tables

str(dung_boys4) # shows data class and overall data info (15 obs with 4 variables)
summary(dung_boys4)
head(dung_boys4)
View(dung_boys4)

#________________________________
# 4

#reading tables

beetles1 <- read.table("dung_beetles_read_1.csv",
                             sep = ","            # separator is different
                             , header = T)
View(beetles1)

beetles2 <- read.table("dung_beetles_read_2.txt",
                       sep = "\t"            # separator is different = \t for a tab-delimited file or txt
                       , header = T)
View(beetles2)
beetles3 <- read.table("dung_beetles_read_3.txt")
beetles3 <- read.table("dung_beetles_read_3.txt",
                       sep = "\t"            # separator is different
                       , header = T,
                       skip =1)     # to skip the first column to
View(beetles3)

# without the header and separator...
beetles <- read.table("dung_beetles.csv")

beetles <- beetles %>% separate(Site.Month)
#fill___________________

library(tidyr)

?fill

beetles1 <- fill(beetles1,Site) # fills the site column for beetles1 dataframe #  might cause errors
# it works (capitalise things!)

beetles4 <- read.table("dung_beetles_read_4.txt", header = T, sep = "\t", na.strings = "-") # reading the last file
# i do not know why it doesn't fill in the missing values # na.strings deals with dashed lines

View(fill(beetles4,Site))

beetles4 <-beetles4 %>% fill(Site, .direction = "down") # sorting out Site with fill using the Pipe

#_____________________________________
#5. The Pipe

beetles1 <- read.table("dung_beetles_read_1.csv",
                       sep = ",",            # separator is different
                       header = T) %>% fill(Site)    # outputs both functions at the same time.
# pushing one function into the next one
View(beetles1)

#____________________________________
#6 Pivoting

# pivot longer function 

pivot_longer(data = beetles1, 
             cols = c(3:10),      # numerical index
             names_to = "spp")

colnames(beetles1[3:ncol(beetles1)]) # shorthand for all species, subscript index

#doing starts with c

beetlesv1 <-pivot_longer(data = beetles1, 
             cols = matches("_")) # like grep with the pattern, selects all values

pivot_longer(data = beetles1,
             cols = starts_with("Caccobius_bawangensis"),
             last_col("Microcopis_hidakai"),
             names_to = "spp")


?pivot_longer

# pivoting is for reorganizing tables to look more tidy and adhere to the three rules

#change name of value to "count"
beetlesv1<-pivot_longer(data = beetles1, cols = matches("_"), values_to = "count" )
pivot_longer(data = beetlesv1, cols = "name", values_to = "spp")

#pivot wider
# 7
casesdf <- read.table("WMR2022_reported_cases_3.txt", sep="\t",
                      header = T,
                      na.strings =c("")) %>% fill(country)

 pivot_wider(casesdf,    #data frame
            names_from = "method",   # choose all names from "method" column
            values_from = "n") #place holder
#pivot longer for observations
casesdf<-pivot_longer(casesdf, 
             cols = 3:14,          # select these columns
             names_to = "year",    #make another column called years (rule 1)
             values_to = "cases")  # values inside of year goes to a new column called cases
#moving all method variables into one column (rule 2), pivot wider for variables, increases columns to decrease rows

casesdf<- pivot_wider(casesdf,             #data frame
             names_from = method, # choosing column values from method
             values_from = cases) # choosing the column from cases

casesdf <- read.table("WMR2022_reported_cases_3.txt", sep="\t",
                       header = T,
                       na.strings =c("")) %>% 
                        fill(country) %>%
pivot_longer(cols = 3:14,          # select these columns
               names_to = "year",    #make another column called years (rule 1)
                values_to = "cases") %>%
pivot_wider(names_from = method, # choosing column values from method
              values_from = cases) # choosing the column from cases
#moving all method variables into one column (rule 2), pivot wider for variables
 


# next time remove all the succeeding data frame objects due to pipe chaining the whole thing
