###########################
#                         #
#    Assignment Week 3    #
#                         # 
###########################

# Instructions ####
# Fill in this script with stuff that we do in class.
# It might be a good idea to include comments/notes as well so you remember things we talk about
# At the end of this script are some comments with blank space after them
# They are plain-text instructions for what you need to accomplish.
# Your task is to write the code that accomplished those tasks.

# Then, make sure to upload this to both Canvas and your GitHub repository




# Vector operations! ####

# Vectors are 1-dimensional series of values in some order
  1:10 # ':' only works for integers
    #displays a numerical vector of numbers 1 through ten
  letters # built-in pre-made vector of a - z
    #displays a character vector of length 26



  #c for combine creates vectors
    vector1 <- c(1,2,3,4,5,6,7,8,9,10)
    vector2 <- c(5,6,7,8,4,3,2,1,3,10)
    vector3 <- letters # letters and LETTERS are built-in vectors

  #vectorized calculation
    vector1 + 5 #pulls all values from vector 1 to add to 5
      vector1[3] +5 #pulls the third value of vector 1 list to add to 5
    vector2 / 2
      vector2[2] /2
    vector1*vector2

  #vector3 + 1 # can't add 1 to "a"

  
  # Logical expressions (pay attention to these...they are used ALL THE TIME)
    vector1 > 3 #less than
    vector1 >= 3 #less than or equal to
    vector1 < 5 #greater than
    vector1 <= 5 #greater than or equal to
    vector1 == 7 #is equal to
    letters == "a" #is equal to
    letters != "c" #is not equal to
    letters %in% c("a","b","c","z") #is in 
    vector1 %in% 1:6  #is in
  #'%ni%' <- negate('%ni%') #creates a new function for "is not in"

    c("a", "b", "q") %in% letters

# Data Frames ####
  # R has quite a few built-in data sets
    data("iris") # load it like this
    class(iris) #gives the classification of iris as data.frame
    class(vector3) #gives the classification of vector3 as character
    class(vector1) #gives the classification of vector1 as numerical
  # For built-in data, there's often a 'help file'
    ?iris

  # "Iris" is a 'data frame.' 
  # Data frames are 2-dimensional (think Excel spreadsheet)
  # Rows and columns
  # Each row or column is a vector


  dat <- iris # can rename the object to be easier to type if you want
   #tells the computer to give a new same data set with the new name

  # ways to get a peek at our data set
    names(dat) #column heads
    dim(dat) #gives a numeric vector of 2 (returns a vector)
      #rows and column lengths
      dim(dat)[1] #gives number of rows in vector
      nrow(dat) #gives number of rows in vector
    head(dat) #gives first six rows
  


  # You can access specific columns of a "data frame" by name using '$'
    class(dat$Species) #species is a factor vector
      #Factors are harder to use as they consstrain the math that R runs in the background
      #contains embedded information that are the levels
        #levels are permitted values of for a factor class vector
      #factor(dat$Species, ordered=TRUE)
        #would tell R that the levels have a less than or greater than relative values
      levels(dat$Species) #gives the accepted level values
        #N/A will also be an accepted value
    dat$Species #isolates a column ($) as its own vector
    dat$Sepal.Length #returns the values for Sepal.Length in dat
  

  # You can also use square brackets to get specific 1-D or 2-D subsets of a data frame (rows and/or columns)
    dat[1,1] # [Rows, Columns] one dimensional value yeilded
    dat[1:3,5]
    
    vector2[1]
    letters[1:7]
    letters[c(1,3,5,7)]
  
  
# Plotting ####
  
  # Can make a quick plot....just give vectors for x and y axes
    plot(x=dat$Petal.Length, y=dat$Sepal.Length)
    plot(x=dat$Species, y=dat$Sepal.Length)
      #changed plot type due to the factor vector
  
  
# Object "Classes" ####
  
  #check the classes of these vectors
    class(dat$Petal.Length)
    class(dat$Species)
  
  # plot() function behaves differently depending on classes of objects given to it!
  
  # Check all classes (for each column in dat)
    str(dat) #structure 
      #shows a portion of the data as a preview
      #same as clicking on the down arrow by the data name in Environment tab
  
  # "Classes" of vectors can be changed if needed (you'll need to, for sure, at some point!)
  
  # Let's try
    nums <- c(1,1,2,2,2,2,3,3,3,4,4,4,4,4,4,4,5,6,7,8,9)
    class(nums) # make sure it's numeric
  
  # convert to a factor
    as.factor(nums) # show in console
      #made levels in the order that is saw them
    nums_factor <- as.factor(nums) #assign it to a new object as a factor
    class(nums_factor) # check it
    levels(nums_factor)
  
  
  # convert numeric to character
    as.character(vector1)
    as.character(vector1) + 5 
      #the as.character means that even though vector1 is numbers they are being 
      #treated as characters which can not be added to a numeric
  
  # convert character to numeric
    as.numeric(vector3)
     as.numeric(c("1", vector3))
  
  
  
  #check it out
    plot(nums) 
      #plotting a single dimensional vector
    plot(nums_factor)
      #due to factor vector it can only create a Histogram
   # take note of how numeric vectors and factors behave differently in plot()
    plot(as.factor(letters))
  
  
  
  
  # Simple numeric functions
  # R is a language built for data analysis and statistics so there is a lot of functionality built-in
  
    max(vector1)
    min(vector1)
    median(vector1)
    mean(vector1)
    range(vector1)
    summary(vector1)
      class(summary(vector1))
      table(nums) #counts number of times a value is seen
    
    
  # cumulative functions
    cumsum(vector1)
    cumprod(vector1)
    cummin(vector1)
    cummax(vector1)
  
  # even has built-in statistical distributions (we will see more of these later)
    dbinom(50,100,.5) # probability of getting exactly 50 heads out of 100 coin flips
      #dbinom- binomial function of 50 out of 100 trials, with a 50% probability



#### YOUR REMAINING HOMEWORK ASSIGNMENT (Fill in with code) ####

  data("iris") 
    #Required Data.frame

# 1.Get a subset of the "iris" data frame where it's just even-numbered rows
#seq(2,150,2) #Gives a list of the even numbers between 2 and 150

  iris[seq_len(nrow(iris)) %% 2 == 0, ]
    #Extract even rows from iris data frame 


# 2.Create a new object called iris_chr which is a copy of iris, 
#except where every column is a character class

  iris_chr <- lapply(iris, as.character)
    #condensed version of the following 5 lines:
  iris_chr <- iris
    iris_chr$Sepal.Length <- as.character(iris$Sepal.Length)
    iris_chr$Sepal.Width  <- as.character(iris$Sepal.Width)
    iris_chr$Petal.Length <- as.character(iris$Petal.Length)
    iris_chr$Petal.Width  <- as.character(iris$Petal.Width)
    iris_chr$Species      <- as.character(iris$Species)
      #sapply(iris_chr, class) #code check


# 3.Create a new numeric vector object named "Sepal.Area" 
#which is the product of Sepal.Length and Sepal.Width

  Sepal.Area <- iris$Sepal.Length*iris$Sepal.Width
    #Sepal.Area #code check
    

# 4.Add Sepal.Area to the iris data frame as a new column

  iris$Sepal.Area <- Sepal.Area
    #iris$Sepal.Area #code check


# 5.Create a new dataframe that is a subset of iris using only rows 
#where Sepal.Area is greater than 20 
#(name it big_area_iris)

  big_area_iris <- subset(iris, subset= iris$Sepal.Area >= 20)
    #big_area_iris #code check

# 6.Upload the last numbered section of this R script (with all answers 
#filled in and tasks completed) to canvas. I should be able to run 
#your R script and get all the right objects generated

  sapply(iris_chr, class)
  Sepal.Area
  iris
  big_area_iris

