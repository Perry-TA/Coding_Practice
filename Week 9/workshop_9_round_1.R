# Workshop 9 - themes and labelling data _________________________
install.packages("palmerpenguins")
install.packages("tidyverse")
library(tidyverse)
library(palmerpenguins)
penguins
#2. Annotating data

# we can label specific data points through subsetting biggest penguins first
big_boys <- penguins %>%
  filter(species == "Gentoo",      # select a specific species
          !is.na(body_mass_g))%>%  # remove NA values in these observations
  arrange(body_mass_g) %>%         # arrange using bogy mass variable
  tail(n = 5L)  # pick the five largest

# then create a column with the largest gentoo penguins with given names
big_boys$names <- c("Gundyr","Allant","Sif","Nito","Yhorm")

# start the plot for all gentoo penguins with using big penguins as labels
penguins %>% filter(species == "Gentoo") %>%
  ggplot(aes(x = body_mass_g,
             y = flipper_length_mm)) +
  geom_point(aes(colour = flipper_length_mm)) +  # add scatterplot point colours to all flipper length data values
  geom_text(    # labelling geom
    data = big_boys,   # subset big boys dataframe for labelling
    mapping = aes(label = names), # label all big gentoos 
    nudge_x = -1.5,    # appropriate horizontal positioning,- is left, + is right
    nudge_y = -0.5,    # precise vertical positioning, - is under, + is over
    colour = "darkgreen"   # colour the labels lightblue
  ) +
  xlim(3900,6400)   # limit x axis, makes it longer

penguins %>% filter(species == "Adelie") %>%
  ggplot(aes(x = body_mass_g,
             y = flipper_length_mm)) +
  geom_point() +  # data save
  geom_text(      # labeling geom
    data = filter(penguins, species == "Adelie" &
                    flipper_length_mm > 200),     # filters flipper legnth if adelie and over 200
    aes(label = island),    # label with the island names if over 200 flipper length
    nudge_y = -0.5
  ) 

# if you dont filter in geom_text, it will label all data points

#____________________________________
# 3) Facets
# making several smaller plots are possible with ggplot
# splitting with

wmr_model <- read.table("wmr_modelling.txt", header = T , sep = "\t")

smaller_wmr <- head(wmr_model,
                    n = 506L)     #Select only 509 Observations
str(wmr_model)
# plotting smaller plots
smaller_wmr %>% drop_na()     # remove na values
          %>%  
  filter(year > 2018) %>%
  ggplot(aes(x = year,
             y = deaths))+
  geom_col(fill = "hotpink") +
  facet_wrap(~country, ncol = 5,    # split each small plot by countries
             dir = "v")

# we can plot in a 2d grid
penguins %>% drop_na() %>%
  ggplot(aes(x = bill_length_mm,
             y = flipper_length_mm)) +
  geom_point(colour = "green") +
  facet_grid( ~species)    # first determines rows, second determines the column

# we can even just use one variable
# same plot +
facet_grid(~ species )
facet_grid(species ~  .)

#______________________________________
# 4. Patchwork
install.packages("patchwork")
library(patchwork)
# use patchwork to collate different plots into a presentation

p1 <- penguins %>% drop_na() %>%
  ggplot(aes(x = bill_length_mm,
             y = flipper_length_mm,
             colour = species)) +
  geom_point() +
  facet_grid(. ~ species)   

p2 <- penguins %>% drop_na() %>%
  ggplot(aes(x = body_mass_g,
             y = flipper_length_mm)) +
  geom_point(colour = "hotpink") 

p3 <- penguins %>% drop_na() %>%
  ggplot(aes(x = bill_depth_mm)) +
  geom_histogram(aes(fill = species))

#patch work works like this:

p2| (p1/p3) # p2 on the left first
# or
p1/(p2+p3) #different presentation p1 above, p2 and 3 below

#we can also annotate plots to place titles for example

p1/(p2+p3) + plot_annotation(tag_levels = "a",
                             title = "some plots about peinguin characteristics")

# we can also align plots with the same x and y axis

High_deth <- smaller_wmr %>% 
  filter(country %in% c("Angola",
                        "Cameroon", 
                        "Burundi")) %>%
  ggplot(aes(x = year, 
             y = deaths_high,
             colour = country)) +
  geom_point() +
  geom_line() +     # goes with geom_line
  xlim(1999,2022)



low_deth <- smaller_wmr %>% 
  filter(country %in% c("Angola",
                        "Burkina Faso", 
                         "Chad")) %>%
  ggplot(aes(x = year, 
             y = deaths_low,
             fill = country)) +
  geom_col(position = "dodge") +
  xlim(1999,2022)

High_deth/low_deth + plot_annotation(tag_levels = "a",
                                     title = "low deaths and high deaths")
# alot of deaths in angola, but number of low deaths are prominent in
# burkina faso but reduces over time, unlike other contries whom show 
# a stable low death trend.

#_____________________________
#5 colours

# lotsa colours to use

# can use fill, colours or just mapping continuous variables.

omg <- penguins %>% ggplot(aes(x = species,
                               fill = species)) +
  geom_bar()

omg + scale_fill_manual(values = c("red4",
                                   "yellow3",
                                   "orange3")
                        )

# you can choose with tried and tested colour palates too
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()   # 1)discrete graphs, 2) unranked categorical data
                       # 3) discrete ranked data, low to high

# we can apply the sets like so

set1 <-low_deth + scale_fill_brewer(palette = "Set1") # not good due to red/green presence
set2 <-omg + scale_fill_brewer(palette = 
                                 
                                 "Accent", direction = -1)

set1/set2

#for colour blind friendly graphs

cbf1 <-low_deth + scale_fill_viridis_d()
cbf2 <-omg + scale_fill_viridis_d(option = "plasma")

cbf1/cbf2 # colour blind friendly colours for graphs

#continuous colours

con1 <- penguins %>% drop_na() %>%
  ggplot(aes(x = bill_length_mm,
             y = flipper_length_mm)) +
  geom_point(aes(size = year,        # ranks with y axis, the bigger the y the larger the points
                 colour = year))     
con1
con2 <- con1 + scale_colour_viridis_c(option = "magma") 

con1 +con2

# NA values displayed

#_________________________________
# 6) themes

# changing background!

con1.1<-con1 + theme_classic()   # make the backgorund white
con2.1<- con2 +theme_classic()   # make the backgound white

con1.1 +con2.1+ plot_annotation( title = "white background plots")

penguins %>% drop_na() %>%
  ggplot(aes(x = bill_length_mm, 
             y = flipper_length_mm)) +
  geom_point(aes(colour = body_mass_g)) +
  labs(title = "my plot") +
  scale_colour_viridis_c(option = "magma") +   # colours of points according to body mass, ranked
  theme(legend.position = "bottom",     # allocate legend position
        axis.title.x = element_text(colour = "black", 
                                    size = 12, hjust = ),#x axis colours
        axis.title.y = element_blank(),
        axis.line.y = element_line(colour = "blue4", size = 4),
        axis.text.y = element_text(size =15,    # size of  y-axis text
                                   angle = 35), # angle of y-axis text
        panel.background =  element_rect(colour = "maroon4", 
                                         fill = "grey", size = 6),
        plot.title = element_text(family = "Arial", # font
                                   face = "italic", # italise
                                   hjust = 0.5, size = 20))
#_________________________________  
# 7) exercise

penguins %>% filter(island == "Biscoe") %>%
  ggplot(aes(x = bill_depth_mm,
             y = bill_length_mm)) +
  geom_point(aes(colour = species)) +
  geom_text(
    data = filter(
      penguins,
      island == "Biscoe" &
        (bill_length_mm >54 |
           bill_depth_mm >20)
    ),
    aes(label = sex),
    nudge_y = -0.5
  ) +
  labs(title = "Penguins on the island Biscoe")
# almost all males have a big bill depth between a certain range

#2

wmr_summary <- read_table("wmr_cases_deaths_modelling_summaries.txt" 
                         ,sep="\t", header=T)

# challenge

