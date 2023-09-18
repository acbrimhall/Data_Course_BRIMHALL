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
   
   