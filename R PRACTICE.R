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
  ?length()
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

  
   