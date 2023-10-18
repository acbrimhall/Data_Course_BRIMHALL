# PENGUIN PRACTICE WEEK 5
#############################
library(tidyverse)
library(palmerpenguins)
library(ggimage)


#THE PIPE:
  # %>% 
#CRT +SHIFT + M

penguins <-  penguins

glimpse(penguins)
    #glimpse a sample of the data frame

penguins %>% glimpse
    #Looking at Penguins glimpse it

1:10 %>% max()

c(1,2,3,4,5) %>% max()

max(c(1,2,3,4,5))
  #make a vector with c()
    #take the max of that vector

letters
#letters %>% grep(e)
  #grep the first argument is what to look for
    #grep second argument is where to look
  #THE PIPE inserts as the first argument

penguins %>% dim
penguins %>% filter()
penguins %>% arrange()
penguins %>% ggplot(aes())
  #Tidyverse packages all have data frame as the first argument

penguins %>% 
  na.omit() %>% 
  ggplot(aes(x = flipper_length_mm,
             y =body_mass_g,
             color = sex))                                         +
  geom_boxplot(alpha = 1, 
               size= 0.75)                                         +
  geom_point(size = 2,
             shape = 12)                                           +
  facet_wrap(~species, 
             scales = 'free')                                      +
  labs(title = 'Species Relation of Body Mas to Flipper lenght')   +
  theme(axis.title.x = element_text('Flipper Length (mm)'),
        axis.title.y = element_text('Body Mass (g)'),
        legend.background =element_rect(fill = 'gold'),
        legend.title.align = .5,
        panel.grid = element_line(linewidth = 0.3,
                                  color = 'orange'),
        panel.background = element_rect(fill = 'steelblue'))



penguins %>% 
  ggplot(aes(x=bill_length_mm,
             y=bill_depth_mm))
  geom_image(aes(image="./",
                 size=0.1))

  
#############################
#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("palmerpenguins")
#install.packages("devtools")
#install.packages("ggpubr")
#install.packages("ggimage")  
#install.packages("ggforce")
#installed.packages("gganimate")  
#install.packages("GGally")
#install.packages("plotly")

  library(tidyverse)
  library(dplyr)
  library(ggplot2)
  library(palmerpenguins)
    penguins <- palmerpenguins
  library(ggimage)
  devtools::install_github("thomasp85/patchwork")
  library(patchwork)
  library(ggpubr)
  library(ggimage)
  library(ggforce)
  library(gganimate)
    ####gganimate transition.reveal = important for Exam 2
  library(GGaly)
  library (plotly)
  

GGally::ggpairs(penguins)


df <- read_delim("Data/DatasaurusDozen.tsv")


df%>%
    group_by(dataset) %>% 
    summarise(mean_x = mean(x),
              mean_y = mean(y),
              sd_x = sd(x))  
  
  
df %>%
    ggplot(aes(x,y),) +
    geom_point()      +
    facet_wrap(~dataset)
  
#Minimum ink; Maximum information

p <- ggplot(x = penguins$body_mass_g, 
      y =penguins$flipper_length_mm) +


ggplotly(p)
#gives interactive ability on graphs



install.packages("kableExtra")
library(kableExtra)
#easily create tables

  head(penguins) %>% 
    kable() %>% 
    kable_classic(lightable_options = "hover")
  
iris <- iris

p2 <- 
  iris %>% 
  mutate(blink = Sepal.Width < 2) %>% 
  ggplot(aes(x=Sepal.Length,
             y = Sepal.Width,
             color = Species)) +
  geom_point()  +
  gganimate::transition_states(Species) +
  gganimate::enter_appear()
  
p
p2
is.na(df$x)
as.data.frame(p)
(p | p2)/p2



iris %>% 
  mutate(blink = Sepal.Width < 5) %>% 
  ggplot(aes(x=Sepal.Length,
             y = Sepal.Width,
             color = Species)) +
  geom_point(data = iris %>% filter(Sepal.Length > 6), size = 3) +
  geom_point(data = iris %>% mutate(Sepal.Length <= 3), color = "black")
#mutate modifies the data that will be plotted  
#overlaying two different types of graph on each other
  

#############################
#review 
  #sub-setting
  #true false 
  #if else statements (==, =>, is.na)


#############################
# Ugly plot
penguins %>% 
  na.omit() %>% 
  ggplot(aes(x = flipper_length_mm,
             y =body_mass_g,
             color = sex))                                         +
  geom_boxplot(alpha = 1, 
               size= 3.75,
               fill = 'green')                                     +
  geom_point(size = 5,
             shape = 12)                                           +
  facet_wrap(~species)                                      +
  labs(title = 'Species Relation of Body Mas to Flipper length')   +
  theme(axis.title.x = element_text('Flipper Length (mm)'),
        axis.title.y = element_text('Body Mass (g)'),
        legend.background =element_rect(fill = 'gold'),
        legend.title.align = .5,
        panel.grid = element_line(linewidth = 0.3,
                                  color = 'red'),
        panel.background = element_rect(fill = 'hotpink'))

ggsave("uglyplot_brim.png")

#############################
# WEEK 6
#3 rules of tidy data
  #1-Every variable gets its own column
  #2-Every observation gets its own row
  #3-Resulting data should be rectangular

library(tidyverse)


table1
  #table 1 is the example the rest should look like

table1 %>% 
  ggplot(aes(x=year,
             y=cases,
             color=country)) +
  geom_path()

table2
table3
table4a
table4b
table5

#table2 corrections
table2 %>% 
  pivot_wider(names_from = type,
              values_from = count)
    #pivot_wider increases number of columns and shortens number of rows
      #pivot_wider(names_from = , values_from = )

#table3 corrections
table3 %>% 
  separate(rate, into= c('cases', "population"))

#table4 corrections
full_join(table4a, table4b)
  #doesn't quite work

a <- table4a %>% 
  pivot_longer(col= -country,
               names_to = 'year',
               values_to = 'cases')
b <- table4b %>% 
  pivot_longer(cols = -country,
               names_to = 'year',
               values_to = 'population')
 #now both individual tables are tidy
full_join(a,b)
full_join(table4a %>% 
            pivot_longer(col= -country,names_to = 'year', values_to = 'cases'),
          table4b %>% 
            pivot_longer(cols = -country,names_to = 'year', values_to = 'population'))

#table5 correction
table5 %>% 
  mutate(date= paste0(century,year) %>% as.numeric()) %>% 
  select(-century, -year) %>% 
  separate(rate,into = c('cases', 'population'), convert = TRUE)

  #mutate lets you build new columns based on existing columns
    #paste with zero space (paste0)
  #select lets us pick columns (negative means remove)
  #separates the variables in a column into multiple columns

#homework 
  #week 6 assignments 
  #week 6 resources
  #really learn mutate()