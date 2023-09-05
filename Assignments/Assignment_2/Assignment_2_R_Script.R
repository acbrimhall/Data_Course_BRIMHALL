#Step 1
  ##Data_Course_BRIMHALL.Rproj

#Step 2
  ##Opened Data in RStudio Files

#Step 3
  ##Path in Data_Course_BRIMHALL directroy under
  ##Assignments/Assignment_2/Assignment_2_R_Script.R 

#Step 4
  list.files(path = "Data/", 
             pattern = ".csv")
  csv_files<-list.files(path = "Data/", 
                        pattern = ".csv")
#Step 5
  length(csv_files)

#Step 6
  read.csv("Data/wingspan_vs_mass.csv")
  df<-read.csv("Data/wingspan_vs_mass.csv")

#Step 7
  head(df,
      n=5)
#Step 8
  list.files(path = "Data/",
             pattern = "^b" ,
             recursive = TRUE)
#Step 9

  
##getwd()
  ## Assignment 2
  #Only saves your text, reopening will require you rerun the code
  #lists the files from Data that are .csv (comma separated values) files
#  list.files(path="Data", 
#             pattern = ".csv")
  #assigns the name csv_files to all of the files in that list
#  csv_files <- list.files(path="Data",
#                          pattern = ".csv")
  #will show what that contains 
#  csv_files
  #? before the command will pull up the Help information
  #usage, arguments and examples are usefull portions of the help guide
#  ?length()
  #gives the number of the x within the parenthesis
#  length(csv_files)
  #1:10 gives all the numbers between 1 and 10
#  1:10
#  length(1:10)
  #read.csv is american , separated
  #read.csv2 is EU vertion
#  read.csv("./Data/wingspan_vs_mass.csv")
  #assigning it a name
#  df <- read.csv("./Data/wingspan_vs_mass.csv")
  #looks at file
#  head(df)
  #head default gives 6 lines for n
#  head(df, 
#       n=5)
  #finding letter b files 
  #recursive will look through all sub folders when true
#  list.files(path ="Data", 
#             pattern = "b", 
#             recursive = TRUE)
  #to get only files starting with b
  #regular expression character ^ means starts with
  #gives relative file location
#  list.files(path ="Data", 
#             pattern = "^b", 
#             recursive = TRUE)
  #use a for-loop for Question 9 and 10