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
  
  