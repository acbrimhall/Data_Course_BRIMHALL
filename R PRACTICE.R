#############################
iris #practice data set that comes with R
iris[1, ] #Shows column headers and row 1
View(iris) #Pulls up data set
iris$Petal.Width #in this data frame (iris) $ shows column names
mean(iris$Petal.Width)
summary(iris$Petal.Width)
names(iris)

#new column called Petal.Area
#lenght * width
#multiplying one column by another
iris$Petal.Length * iris$Petal.Width
#create a new column in the iris data frame
iris$Petal.Area <- iris$Petal.Length * iris$Petal.Width

##Go through practice examples in Week 3

#FOR LOOP Examples
for (i in names(iris)) {
  x <- iris[ ,i]
  print(summary(x))}

for (i in names(iris)) {
  x <- iris[ ,i]
  print(mean(x))}

y <- c("sucks", "is stupid", "is cool")
for (i in y) {
  print(paste0("Your mom ", i))
}



#############################
# WEEK 4
library(tidyverse)
  #should be seen at the top of almost every
  #Conflicts "dplyr::filter() masks stats::filter()" means that using the function
    #"filter(), will use the coding from the dplyr package instead of the old stats
    #package. The old one can still be used by typing out "stats::filter().

iris

ggplot(iris, 
      aes(x= iris$Petal.Length,
          y= iris$Petal.Width,
          color = iris$Species,
          group = 1))               +   
  geom_point(alpha = 0.25, 
             size = 0.25)           +   
  geom_smooth(method = "lm", 
              se = TRUE)            +   
  geom_smooth(method = "lm", 
              color = 'black', 
              linetype =2,
              aplha = 0.25)         +
  scale_color_viridis_d()           +
  theme_minimal()                   +
  labs(x ="Petal Length",
       y = "Petal Width",
       color = "Species of Iris")   +
  facet_wrap(~Species,
             scales= 'free')
      
mpg
  #miles per gallon data.frame

ggplot(mpg,
       aes(x = cty,
           y = hwy,
           color = drv,
           group = 1))            +
  geom_point(alpha = 1.0,
             size = 0.5)          +
  geom_smooth(method = "lm")      +      
  geom_smooth(method = "lm", 
              color = 'white', 
              linetype =2,
              aplha = 0.50)       +
  theme_grey()                    +
  geom_area(color = 'grey')
  
?geom_area

ggplot(mpg,
       aes(x = factor(cyl),
           y = cty,
           fill = drv,
           group = 1))                     +
  geom_violin()                            +
  geom_jitter(width =0.1,
              alpha = 0.25)                +
  facet_wrap(~drv,
             scales = 'free')              +
  theme_bw()                               +
  scale_fill_viridis_d(begin = 0.3)


  #Web-Scrapping
    #Use code to scrape a website
#############################
  
#1-Give ggplot a data frame
#2-Map column names to various aspects of the plot with aes()
   #aes for asthetics
    #need to map each column onto the plot
    #tells R what x is, or what color a column is
#3-Give it Geoms (don't forget the + symbol when adding each new geoms)
  #geom for things to draw or geometry
    #geom_point plots each point in the data
        #alpha = 0.25 changes the transparency of the points
        #size = 0.25 changes the thickness of the points
    #geom_smooth plots a smooth line for the data (if color paramenter is 
    #present than each color gets its one smooth line)
    #geom_smooth is a leoss curve
        #leoss curve is an equationless line
      #within geom_smooth parenthesis you can change the line
        #method = "lm" straightens the lines
        #color will override any column color distinction
        #se =False will get rid of the standard error lines
    #scale_color_viridis creates colors that are always distinguishable to 
      #the human eye, and color-blind friendly
    #facet_wrap()
      #~ tilda means "as a function of"
##getwd()
## Assignment 2
#Only saves your text, reopening will require you rerun the code
#lists the files from Data that are .csv (comma separated values) files
 list.files(path="Data", 
            pattern = ".csv")
#assigns the name csv_files to all of the files in that list
  list.files(path = "Data/", 
             pattern = ".csv")
  csv_files <- list.files(path="Data",
                          pattern = ".csv")
#will show what that contains 
  csv_files
#? before the command will pull up the Help information
#usage, arguments and examples are usefull portions of the help guide
  #?length()
#gives the number of the x within the parenthesis
  length(csv_files)
#1:10 gives all the numbers between 1 and 10
  1:10
  length(1:10)
#read.csv is american , separated
#read.csv2 is EU vertion
  read.csv("./Data/wingspan_vs_mass.csv")
#assigning it a name
  read.csv("Data/wingspan_vs_mass.csv")
  df <- read.csv("./Data/wingspan_vs_mass.csv")
#looks at file
  head(df)
#head default gives 6 lines for n
  head(df, 
       n=5)
#finding letter b files 
#recursive will look through all sub folders when true
  list.files(path ="Data", 
             pattern = "b", 
             recursive = TRUE)
#to get only files starting with b
#regular expression character ^ means starts with
#gives relative file location
  list.files(path ="Data", 
             pattern = "^b", 
             recursive = TRUE)
#use a for-loop for Question 9 and 10
  readLines("Data/data-shell/creatures/basilisk.dat", n=1)  
  readLines("Data/data-shell/data/pdb/benzaldehyde.pdb", n=1)
  readLines("Data/Messy_Take2/b_df.csv",n=1)
   x <- 1:0
   for (i in x) {
     print(readLines(n=1))
   }
     for (j in list.files(path = "Data",
                          full.names = TRUE,
                          recursive = TRUE,
                          pattern = ".csv")) {
       print(readLines(j, n=1))}
  
   for (j in list.files(path = "Data",
                        full.names = TRUE,
                        recursive = TRUE,
                       pattern = ".csv")) {
    print(readLines(j, n=1))}
  
   #Prep
   library(tidyverse)
   library(dplyr)
   library(tibble)
   
   #I
   read.csv("./Exams/Exam_1/cleaned_covid_data.csv")
   ccdata <- read.csv("./Exams/Exam_1/cleaned_covid_data.csv")
   
   #II
   A_States <- subset(ccdata,
                      subset = grepl(pattern = "^A",
                                     Province_State))
   
   #III
   #ggplot(A_States,
   #  aes(x = Last_Update,
   #       y = Deaths,
   #        color = Province_State))   +
   # geom_point(alpha = 0.5,
   #          size = 0.5)              +
   # facet_wrap(~Province_State,
   #           scales = 'free')         +
   #geom_smooth()
   
   #IV
   C <- ccdata[ ,c("Province_State", "Case_Fatality_Ratio")]
   #Creates a new data frame with all rows of the columns Province_State,
   #and Case_Fatality_Ratio from the main data set (ccdata)
   
   Maximum_Fatality_Ratio <- 
     lapply(split(ccdata, ccdata$Province_State), 
            function (y) max(y$Case_Fatality_Ratio, 
                             na.rm = TRUE))
   #Creates a new data frame
   #lapply applies a function on a list of objects and returns a list 
   #hence the l-apply moniker.
   #Subdivides the main data frame (ccdata) into groups 
   #defined by the column Province_State.
   #The max of each of the groups is taken with the function command.
   #na.rm means all N/A are removed to allow the data to find the max.
   
   
   C$Maximum_Fatality_Ratio <- 
     Maximum_Fatality_Ratio
   #Creates a column within the data frame C. 
   #Column is pulled from the data frame list Maximum_Fatality_Ratio
   
   M <- 
     C[ , c('Province_State', 
            'Maximum_Fatality_Ratio')] 
   #Creates a data frame M.
   #Uses data frame C as a template.
   #All rows will be pulled from relavant columns.
   #The columns Province_State and Maximum_Fatality_Ratio are pulled.
   
   smfr <- 
     dplyr::distinct(M)
   #Creates a data frame smfr.
   #Using the dplyr function distinct all repeated rows are eliminated from 
   #the data set so only one set of each group (Province_State) is listed.
   
   smfr[order(-as.numeric(smfr$Maximum_Fatality_Ratio)), 
        "Province_State"]  
   #Preview list of
   #From the smfr data frame, order of the Province_States column if 
   #rearranged according the decreasing (- ; high to low) numerical 
   #values of column Maximum_Fatality_Ratio.
   
   state_max_fatality_ratio <- 
     smfr 
   #A new data frame state_max_fatality_ratio is created from the template smfr.
   
   state_max_fatality_ratio$Province_State <- 
     smfr[order(as.numeric(smfr$Maximum_Fatality_Ratio), 
                decreasing = TRUE), 
          "Province_State"]  
   #A new column in state_max_fatality_ratio data frame is named Province_State
   #Preview from previous step (two prior) is implemented in new column. 
   
   state_max_fatality_ratio$Maximum_Fatality_Ratio <- 
     sort(as.numeric(state_max_fatality_ratio$Maximum_Fatality_Ratio), 
          decreasing = TRUE)
   #A new column in state_max_fatality_ratio is named Maximum_Fatality_Ratio.
   #The output of the function by which the previous column was created 
   #is now listed as this new column.
   
   #V
   
   
   
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
letters %>% grep(e)
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
  library(kableExtra)
  

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
#WEEK 6

#############################
#Week 8
library (tidyverse)

myfunction <- function(x){return(x+3)}
secondfunction <- function(x=10){return(x+3)} 

myfunction (x=10)
secondfunction ()


#LISTS
  #New class of objects called list, similar to vector but
  #can contain a variety of character types.
  #Can hold several vectors like x below.

  a <- 1:10
  b <- letters
  c <- c(TRUE, TRUE, FALSE)

x <- list(a,b,c)
  view(x)

x[[1]]
  #Gives first element in list

x[[1]][3]
  #Gives the third value in the first element in list x

x[[1:3]][1]

for (i in 1:3) {print(x[[i]][1])}
i <- 1
x[[i]][1]

#PURRR / MAP
  #For working with lists smoothly

map(x,1)

map_chr(x, 1)

y <- list(a=iris,
          b=mtcars)
y
map(y, class)

map(x, class)
  #Map can replace most functions done by a for loop


#A function that takes first and second columns of list y and 
# multiplies them. Creating a new column named "products"

newcol <- y[[1]][ ,1] * y[[1]][ ,2]
y[[1]]["products"] <- newcol


newcol <- z[ ,1] * z[ ,2]
z["products"] <- newcol

make_products <- 
function(z){
  newcol <- z[ ,1] * z[ ,2]
  z["products"] <- newcol
  return(z)}

lappy(iris, as.character) 
lappy(y, make_products)
  #Apply to list
map(y, make_products)
  #Successor to lappy




function(z){
  if(!is.numeric(z[ ,1])){
    stop("Hey idot a column is not numeric. TRY AGAIN!")
  }
  newcol <- z[ ,1] * z[ ,2]
  z["products"] <- newcol
  return(z)
}
#Stop if there is a non numeric value with in x
#not equal = !

y$a$Sepal.Length <- as.character(y$a$Sepal.Length)

make_new <- 
function(z){
  if(!is.numeric(z[ ,1])){
    stop("Hey idot a column is not numeric. TRY AGAIN!")
    z[ ,1] <- as.numeric(x[ ,1])
  }
  newcol <- z[ ,1] * z[ ,2]
  z["products"] <- newcol
  return(z)
}
#Would also convert incorrectly formatted column to the correct numeric version

map(y, make_new)

# PURRR has the key features map and reduce
  #map- convert aspects of a list
  #reduce- convert a list of multiple data.frames to a single data.frame
 

########################################
#############################
#Models
library(tidyverse)

mpg
mpg %>% names
#Scientists usually gather all data that MIGHT be influential 

mpg %>% 
  ggplot(aes(x = displ,
             y = hwy))          +
  geom_smooth(method = 'lm')
#Statistical models help us be LESS WRONG when making assumptions

mpg$hwy %>% mean

mpg %>% 
  ggplot(aes(x = displ,
             y = hwy,
             color = factor(cyl)))          +
  geom_smooth(method = 'lm')
#GGPLOT is running linear models(y=mx+b) in the background

glm()
#generalized linear model

mpg %>% names

m <- glm(data = mpg,
    formula = hwy ~ displ)
#Generalized linear model regression using mpg data frame,
# find highway as a function of displacement

m

summary(m)

m$coefficients
  #values for the y=mx+b equation


n <- glm(data = mpg,
         formula = hwy ~ displ + factor(cyl))

summary(n)



#install.packages('modelr')
library(modelr)

preds <- 
add_predictions(mpg, m)

preds

preds %>% 
  ggplot(aes(x = displ,
             color = factor(cyl)))  +
  geom_point(aes(y = hwy),
             color = 'black')       +
  geom_smooth(method = 'lm',
              aes(y = preds))


#############################
library(tidyvrse)
library(palmerpenguins)
#install.packages('easystats')
library(easystats)
penguins %>% 
  ggplot(aes(y = bill_depth_mm,
             x = bill_length_mm)) +
  geom_point() +
  geom_smooth(method = 'lm') #+
 #coord_cartesian(xlim = c(0,60))

#Making a linear regression of this plot
glm()
y~x

glm(data = penguins,
    formula = bill_depth_mm ~ bill_length_mm) %>%  
 summary()
#intercept estimate is 20.88547 (y intercept, x=0)
  #which is the average estimate from the linear regression
#bill_length_mm estimate is the slope of the linear regression line


aov(glm(data = penguins,
        formula = bill_depth_mm ~ bill_length_mm) %>%  
     summary())


#adding another predicting variable (species)
penguins %>% 
  ggplot(aes(y = bill_depth_mm,
             x = bill_length_mm,
             color = species)) +
  geom_point() +
  geom_smooth(method = 'lm') 


  glm(data = penguins,
      formula = bill_depth_mm ~ bill_length_mm) %>%  
    summary()
  
M1 <- glm(data = penguins,
          formula = bill_depth_mm ~ bill_length_mm)
M1

glm(data = penguins,
      formula = bill_depth_mm ~ bill_length_mm + species) %>%  
   summary()
M2 <- 
  glm(data = penguins,
      formula = bill_depth_mm ~ bill_length_mm + species)
M2
#The species Adelie is the default for intercept values
  #chosen by alphabetical order
  #so the other species need to be adjust from the default
#AIC is useful for comparing models
  #a lower AIC means a better model

glm(data = penguins,
      formula = bill_depth_mm ~ bill_length_mm * species) %>%  
    summary()
M3 <- 
  glm(data = penguins,
      formula = bill_depth_mm ~ bill_length_mm * species)
M3 
#introducing the interaction term between bill length and species
  #slope can vary between species
  #tells whether bill_length is dependent on species


#AIC comparison of models
M1$aic
M2$aic
M3$aic

compare_performance(M1, M2, M3)

compare_performance(M1, M2, M3) %>% plot
#shows that M2 is in fact the best model out of the 3

#MODELS
  #are imperfect
    #allow us to extrapolate information that we dont yet know
  #allow us to try and understand reality


names(penguins)

M4 <- 
  glm(data=penguins,
      formula = bill_depth_mm ~ bill_length_mm * species + sex)

M4

penguins %>% 
  ggplot(aes(y = bill_depth_mm,
             x = bill_length_mm,
             color = species)) +
  geom_point() +
  geom_smooth(method = 'lm',) 

compare_performance(M1, M2, M3, M4) %>% plot

M5 <-   
  glm(data=penguins,
      formula = bill_depth_mm ~ bill_length_mm * species + sex + island)

compare_performance(M1, M2, M3, M4, M5) %>% plot

formula(M5)
w <- data.frame(bill_length_mm = 5,000,
           species = 'Chinstrap',
           sex = 'male',
           island ='Dream')
predict(M5,newdata = w)

s <- data.frame(bill_length_mm = 5,000,
                species = c('Chinstrap','Chinstrap'),
                sex = c('male','male'),
                island = c('Dream', 'Dream'))
predict(M5,newdata = s)



mpg %>% 
  ggplot(aes(x = displ, y = hwy, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = 'lm')

mpg %>% 
  ggplot(aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth(method = 'lm')
  
t <- data.frame(displ = 500)
M6 <- glm(data=mpg,
          formula = hwy~displ)
predict(M6,t)
  #gives the impossible gas mileage of -1730
    #Horrible extrapolation
  #do not try to use your model for data it has not seen
    #only use data within the data or a small portion away
l <- data.frame(displ = 4.5)
predict(M6, l)
p <- data.frame(displ = 8)
predict(M6, p)


#t <- data.frame(displ = 500)
M7 <- glm(data=mpg,
          formula = hwy~log(displ))
predict(M7,t)
  #in the log scale
10^predict(M7,t)
  #actual result


mpg %>% 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = 'lm', formula = y~poly(x,3))

mpg %>% 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = 'lm', formula = y~log(x,3))

#MODELS
  #Trying to better understand the world


Titanic
Titanic %>% as.data.frame()



#LOGISTICAL REGRESSIONS
df <- read_csv("./Data/GradSchool_Admissions.csv")
  #admit = True or False
  #gre = test score
  #gpa = grade point average
  #rank = ranking of their undergrad school
df <- 
  df %>% 
  mutate(admit = as.logical(admit))

M8 <- glm(data=df,
    formula = admit ~ gre + gpa +rank)

summary(M8)

#Logistic regression (outcome is TRUE/FALSE)
  #logistic -> family ='binomial
M9 <- glm(data=df,
          formula = admit ~ gre + gpa +rank,
          family = 'binomial')

summary(M9)

library(modelr)

add_predictions(df, M9)
  #log odd predictions

add_predictions(df, M9, type = 'response')
  #percentages = 100 * predictions

add_predictions(df, M9, type = 'response') %>% 
  ggplot(aes(x=gpa, 
             y=pred))+
  geom_smooth()
  

add_predictions(df, M9, type = 'response') %>% 
  ggplot(aes(x=gpa, 
             y=pred,
             color = factor(rank)))+
  geom_smooth()

#############################
#10/17/2023
df <- read_csv("./Data/GradSchool_Admissions.csv")
#admit = True or False
#gre = test score
#gpa = grade point average
#rank = ranking of their undergrad school
df <- 
  df %>% 
  mutate(admit = as.logical(admit))

M8 <- glm(data=df,
          formula = admit ~ gre + gpa +rank)

summary(M8)

#Logistic regression (outcome is TRUE/FALSE)
#logistic -> family ='binomial
M9 <- glm(data=df,
          formula = admit ~ gre + gpa +rank,
          family = 'binomial')

summary(M9)

library(modelr)

add_predictions(df, M9)
#log odd predictions

add_predictions(df, M9, type = 'response')
#percentages = 100 * predictions

add_predictions(df, M9, type = 'response') %>% 
  ggplot(aes(x=gpa, 
             y=pred))+
  geom_smooth()

??add_predictions

add_predictions(df, M9, type = 'response') %>% 
  ggplot(aes(x=gpa, 
             y=pred,
             color = factor(rank)))+
  geom_smooth()


m6 <- M9

m6 <- glm(data=df,
          formula = admit ~ gre * gpa * rank,
          family = 'binomial')

library(MASS)
#overlaps Select from dplyr
#will need to use dplr::select


step <- stepAIC(m6)
#algorithm to find the best fit model for you.

step$formula
#gives the formula for the best model

mod_best <- 
  glm(data= df,
      family= 'binomial',
      formula = step$formula)

compare_performance(m6, M9, mod_best) %>% plot



#Find best model for predicting penguin bill length
library(palmerpenguins)

  penguins <- penguins

  penguins %>% names  

  full_modp <- 
    glm(data= penguins,
        formula = bill_length_mm ~ .^2)
  steps <- stepAIC(full_modp)
  steps$formula

  best_modp <- glm(data = penguins,
                   formula = steps$formula)  

  compare_performance(full_modp, best_modp)  

  compare_performance(full_modp, best_modp)  %>% plot
  
#We built a model based on the entire data set 
  #so we now have no data to test the model with.
  
  
#####1-Train model on some data (not the whole data frame)
#####2-TEST model on other data
  
  
  dim(penguins)

  .2* 344  #20% of the dataframe
  
  rbinom(10, 1, 0.5)
  rbinom(10, 6, (1/6))
  
  rbinom(nrow(penguins), 1, 0.8)
    #randomly assigning a 1 or 0 to each row of penguins 
      #with a 80% probability of getting a 1 assigned
  penguins$newcol <- 
  penguins %>% 
    mutate(newcol= rbinom(nrow(penguins), 1, 0.8))
  #create a new column with random T/F(binomial)
  #family of distributions 
  
  #use new column to split data set
  trainp <- penguins %>% filter(newcol == 1)
  testp <- penguins %>% filter(newcol == 0)
  
  #train model on train set
  mod_best_penguins <- glm(data= trainp, formula = steps$formula)
  
  #calculating the absolute difference between actual and predicted bill length
  predictions <- add_predictions(testp, mod_best_penguins)  

  
  predictions %>% view
  
  predictions %>% mutate(resid = abs(pred - bill_length_mm))
  
  View(predictions)
  
  mean(predictions$resid)
  
  mean(predictions$resid, na.rm = TRUE)
  errors[i] <- mean_err
  
  predictions <- 
    penguins %>% 
    mutate(resid = abs(pred - bill_length_mm))  
    
  mean_err <- mean(predictions$resid, na.rm = TRUE)
  errors[i] <- mean_err  
  
  data.frame(errors) %>% 
    ggplot(aes(x = errors)) +
    geom_density()

  
#############################
  #Machine learning
  library(ranger)
  ?ranger
  
  ranger(formula= Species ~ . ,
         data = iris)
  #I care about Species in relation to everything else
    #basically if i give you a sepal length or other column value
      #can you give me the species name
  
  r_mod <- ranger(formula= Species ~ . ,
                  data = iris)

  pred <- predict(r_mod, iris)
  
  data.frame(iris$Species, pred$predictions)  


########################################
#############################
#Looking at Final Projects
  #Automate data pull from online sources
    #Webscraping package: rvest
    #Tutorial on Easily Harvest(Scrape)
      #https://rvest.tidyverse.org
    #Selector Gadget for firefox 
      #allows you to click on a piece of a
        #website and gives the address
  #Dealing with animal DNA sequences
    #phangorn-building tree for animals
    #ape-Analysis
    #DECIPHER- aligning genes
    #NCBI datasets-Downloading different 
      #sets of data
  #Datasets Search (ncei.noaa.gov)
  #To see Matlab files
    #https://cran.r-project.org/package=R.matlab
  
  library(matlab)
   
#Final project will ultimately end up in R Markdown
  #
  
  
#############################
  

  
  
  
  
  