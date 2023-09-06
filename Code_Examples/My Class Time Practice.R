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








##getwd()
## Assignment 2
#Only saves your text, reopening will require you rerun the code
#lists the files from Data that are .csv (comma separated values) files
#  list.files(path="Data", 
#             pattern = ".csv")
#assigns the name csv_files to all of the files in that list
#  list.files(path = "Data/", 
#             pattern = ".csv")
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
#  read.csv("Data/wingspan_vs_mass.csv")
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
#  readLines("Data/data-shell/creatures/basilisk.dat", n=1)  
#  readLines("Data/data-shell/data/pdb/benzaldehyde.pdb", n=1)
#  readLines("Data/Messy_Take2/b_df.csv",n=1)
#   x <- 1:0
#   for (i in x) {
#     print(readLines(n=1))
#   }
#     for (j in list.files(path = "Data",
#                          full.names = TRUE,
#                          recursive = TRUE,
#                          pattern = ".csv")) {
#       print(readLines(j, n=1))}
#  
#   for (j in list.files(path = "Data",
#                        full.names = TRUE,
#                        recursive = TRUE,
#                       pattern = ".csv")) {
#    print(readLines(j, n=1))}

