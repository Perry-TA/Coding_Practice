#______________________
# Data vis I -  

install.packages("palmerpenguins")
install.packages("tidyverse")
library(palmerpenguins)
library(tidyverse)
library(ggplot2)


head(penguins)
str(penguins)
view(penguins)

# the first graph shows a positive correlation
ggplot(data = penguins) +      # using the dataframe "penguins"
  geom_point(
    mapping = 
     aes(x = bill_length_mm,       
      y = body_mass_g, 
       colour = species)       # add colour depending on species
    )      

# Gentoo has the biggest morphological features from an eyeball

# the second graph colors the species (helpful)
ggplot(data = penguins) +
  geom_point(mapping = 
               aes(x = bill_length_mm, 
                   y = body_mass_g,
                   colour = island)   # colour dependent on island
             )     
# seems those on the island "Biscoe" have the biggest morphological features
# maybe gentoo's habitat?

# coloured layered plot
ggplot(data = penguins,      # no plus this time
       mapping = aes(
         x = bill_length_mm, 
         y = body_mass_g)
       ) +  # additional layer
  geom_point(mapping = aes(
    colour = species)
    ) +
  geom_smooth()


pengu_plot <-
  ggplot(data = penguins,
         mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(aes(colour = species))

#We can add layers to our plot
pengu_plot +
  geom_smooth()

# how to run lines across separate clusters
ggplot(data = penguins, 
       mapping = aes(
         x = bill_length_mm, 
         y = bill_depth_mm)) +
  geom_point(mapping = aes(               # geom point to add colour to species
         colour = species)) +           
  geom_smooth(mapping = aes(              # second colour different species
    colour = species))     

# can just leave addition geom layers open
# this looks horrible.... but there is a curve in every species on the graph

# saving the plot

Pingu_plot <-
  ggplot(data = penguins, 
         mapping = aes(
           x = bill_length_mm, 
           y = bill_depth_mm,
           colour = species)) +
  geom_point() +
  geom_smooth()      # add lines, default

pingu_plot

# straight lines through each
pingu_plot <- 
  ggplot(data = penguins, 
       mapping = aes(
         x = bill_length_mm, 
         y = bill_depth_mm)) +
  geom_point(mapping = aes(     # concerns data points
    colour = species,           # add colour to the data points
    shape = species)) +     
  geom_smooth( mapping = aes(   # concerns addition of lines 
    colour = species),          # add colour to line (inside the aes)
    method = "lm",              # add straight lines
    se = FALSE)
# produces a better plot, with the curves   
 

#_________________________________
#3 saving plots

# use ggsave to save plots

ggsave("pingu_plot_1.png",      # choose name of saved plot
       plot = pingu_plot)       # choose specific plot made in R

# saving with different dimensions 200 x 300 mm

ggsave("pingu_plot_2.png", 
       width =300,         
       height = 200,
       units = "mm")

#_________________________________
# 4. continuous vs categorical values

# explanatary variable is used to map colours usually

ggplot(data = penguins,           # make a ggplot using the penguin data frame
       mapping = aes(             # map aesthetics 
         x = species,             # x-axis : species
         y = body_mass_g            # y-axis : body mass
       ))+
  geom_boxplot( mapping =aes(
                colour = species))
# I wonder what input codes for the legend

# fill boxes with the colour

ggplot(data = penguins,           # make a ggplot using the penguin data frame
       mapping = aes(             # map aesthetics 
         x = species,             # x-axis : species
         y = body_mass_g            # y-axis : body mass
       ))+
  geom_boxplot( mapping =aes(
    fill = species))              # fills each species with different colors

# to determine the order, we can use variable factors - ordered alphanumerically.

# species island, and sex are factors with 3, 3 and 2 levels respectively.

# making violin plots

penguins2 <- penguins

penguins2$species <- factor(
  penguins2$species, 
  levels = c("Adelle",
             "Chinstrap",
             "Gentoo"))

ggplot(data = penguins2,           # make a ggplot using the penguin data frame
       mapping = aes(             # map aesthetics 
         x = species,             # x-axis : species
         y = body_mass_g            # y-axis : body mass
       ))+
  geom_violin(mapping =aes(
    fill = island)) 

#_________________________________
# 5. statistical transformations
# we can visualize more statistical stuff
ggplot(data = penguins) +
  geom_bar(mapping = aes(
    x = species
  )) + coord_flip() # inverts x and y axis
# this gives a count of all penguins by species

# the difference between geom bar and col is that data with one variable which is categorical
# is good for geom bar
# and and data with 2 variables is for geom col, x being categorical and y being continuous,
# sometimes you can just use the histogram geom for continuous x axis and distinguish categories with colour legends
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm     # make x axis a continuous variable
  )) +
  geom_histogram(aes                 # make histogram with aesthetics
                 (fill = species),   # fill categorical variables with colors
                  position = "identity",   # change "right - stack formation" geom plot to left geom "fused"
                     alpha = 0.2)    # adjust transparency

#________________________________
# 6. parsing subsets in plots using filter()

 penguins %>%
   filter(!species == "Chinstrap") %>% # remove Chinstrap from subsequent plot
    ggplot(mapping = aes(
            x = flipper_length_mm, 
            y = body_mass_g)) +    # add geom point layer
    geom_point(mapping = aes(  # plot in dots | scatter plot | and legend
      colour = species,    # distinguishes species by colour, legend attach
      shape = island   # distinguishes islands by shape, ledend attached
  ))

 penguins %>%
   filter(!is.na(sex) ) %>%       # filters the addition of data points with NA
   ggplot(mapping = aes(
     x = species, 
     y = body_mass_g)) +    # add geom point layer
   geom_violin(mapping = aes(  # plot in dots | scatter plot
     fill = sex    # distinguishes sex by colour, legend attach       
   ))

#________________________________
# 7. adding labels
# using labs()
penguins %>%
   filter(!is.na(sex) ) %>%       # filters the addition of data points with NA
   ggplot(mapping = aes(
     x = species, 
     y = body_mass_g)) +    # add geom point layer
   geom_violin(mapping = aes(  # plot in dots | scatter plot
     fill = sex    # distinguishes sex by colour, legend attaches and levels between species are shown       
   )) +
  labs(title = "weight distribution among penguins",          # add titles
       subtitle = "plot generated by ????, March 2024",       # add subtitles
       x = "Species",                                         # rename x axis
       y = "weight in g",                                     # rename y axis
       caption = "data from some place, somewhere, somehow") +  # add a caption below plot
   scale_fill_discrete(name = "sex",
                       labels = c("Female",   # choose which legend to change
                                  "male"),
                       type = c("red4",    # control the colour of the graph
                                "green4"))
#_________________________________________
# 8. the challenge

wmr_data <- read.table("wmr_modelling.txt",
                       sep ="\t",
                       header = T)
view(wmr_data$country)
head(wmr_data)

wmr_data2<- wmr_data

# filtering for just plots for 2020

year2020 <- wmr_data2 %>%
  filter(year == 2020) %>% arrange(deaths)

# making countries factors in death order
death2020 <- year2020$country

year2020$country <- factor(year2020$country, levels = death2020)

year2020$country # factored countries

# ploting data now

ggplot(data = year2020,
       mapping = aes(
         x = country,
         y = deaths)) +
  geom_col()+
  coord_flip()+
  labs(title = "Malaria deaths in 2020")

# plotting workshop thingy
penguins2 <- penguins

penguins$year <- factor(
  penguins2$year, 
  levels = c("2007",
             "2008",
             "2009"))

penguins %>%
  ggplot(mapping = aes(
    x = species, 
    y = body_mass_g,
    colour = year)) +    # add geom point layer
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(colour = year),
             position = position_jitterdodge())+   # positions points following boxes 
  labs(title = "Penguin weight over the years",          # add titles
       subtitle = "plot generated by ????, March 2024",       # add subtitles
       x = "Species",                                         # rename x axis
       y = "weight in g",                                     # rename y axis
       caption = "data from some place, somewhere, somehow")   # add a caption below plot

str(penguins)
#_________________________________________

#IRAT:

install.packages("datasets")
library(datasets)

#showing the effect on vitamin c on tooth Growth in guinea pigs
str(ToothGrowth) # 60 obs with 3 variables, second var is a factor w/2 levels: OJ(orange juice) and VC(ascorbic acid or vitamin c)
head(ToothGrowth)
view(ToothGrowth)

ToothGrowth2 <- ToothGrowth

ToothGrowth2$dose <- factor(
  ToothGrowth$dose, 
  levels = c("0.5",
             "1",
             "2"))

as.numeric(ToothGrowth$dose)

ToothGrowth2$dose
ToothGrowth$dose

str(ToothGrowth)

ToothGrowth2 %>%
  ggplot(mapping = aes(
    x = dose, 
    y = len,
    colour = supp)) + # add geom point layer
  geom_boxplot(aes(colour = supp))+
  geom_point(aes(colour = supp),
             position = position_jitterdodge())+
  labs(title = "effect on vitamin c on tooth Growth in guinea pigs",          # add titles
       subtitle = "plot generated by ????, March 2024",       # add subtitles
       x = "Dose (mg/day)",                                         # rename x axis
       y = "Length",                                     # rename y axis
       caption = "data from some place, somewhere, somehow")   # add a caption below plot

# or

ToothGrowth2 %>%
  ggplot(mapping = aes(
    x = dose, 
    y = len,
    colour = supp)) +
  geom_point(aes(colour = supp),
             position = position_jitterdodge())   # correct

# or 
ToothGrowth2 %>%
ggplot(mapping = aes(
  x = dose, 
  y = len)) +    # add geom point layer
  geom_violin(mapping = aes(  # plot in dots | scatter plot
    fill = supp    # distinguishes sex by colour, legend attaches and levels between species are shown       
  )) +
  labs(title = "effect on vitamin c on tooth Growth in guinea pigs",          # add titles
       subtitle = "plot generated by ????, March 2024",       # add subtitles
       x = "Dose (mg/day)",                                         # rename x axis
       y = "Length",                                     # rename y axis
       caption = "data from some place, somewhere, somehow")+   # add a caption below plot
scale_fill_discrete(name = "supp",
                      labels = c("OJ",   # choose which legend to change
                                 "VC"),
                      type = c("red4",    # control the colour of the graph
                               "green4"))

test <- "I loooove R programing"

test2 <- gsub("R","\nR", test)
cat(test2)


ggplot(data = ToothGrowth2,
       mapping = aes(x = dose     # make x axis a continuous variable
       )) +
  geom_histogram(aes                 # make histogram with aesthetics
                 (fill = supp),   # fill categorical variables with colors
                 position = "identity",   # change "right - stack formation" geom plot to left geom "fused"
                 alpha = 0.2)    # adjust transparency

