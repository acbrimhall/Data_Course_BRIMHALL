#EXAM 1
#0  ##########################
  #Prep-may require downloading the proper library for use.
    library(tidyverse)
    library(dplyr)
    library(tibble)
    library(ggplot2)
  
  #Column Name & Description
    #Province_State
      #State (or DC)
    #Last_Update
      #Date of observation
    #Confirmed
      #Cumulative number of confirmed COVID-19 cases as of the given date
    #Deaths
      #The date the DNA was originally extracted in the format YYYY-MM-DD
    #Recovered
      #Total number of recovered cases as of the given date
    #Active
      #Total number of active confirmed COVID-19 cases as of the given date
    #Case_Fatality_Ratio 
      #Percent of cases that resulted in death due to COVID-19

#1  ##########################
#I.Read the cleaned_covid_data.csv file into an R data frame. (20 pts)

  read.csv("cleaned_covid_data.csv")
    #read the data into R
  ccdata <- read.csv("cleaned_covid_data.csv")
    #assigning data to a short hand data.frame
  
#2  ##########################
#II.Subset the data set to just show states that begin with “A” and save 
    #this as an object called A_states. (20 pts)
       #Use the tidyverse suite of packages
    #Selecting rows where the state starts with “A” is tricky (you can use 
    #the grepl() function or just a vector of those states if you prefer)

  A_States <- subset(ccdata, 
                     subset = grepl(pattern = "^A", 
                                    Province_State))
    #Groups all states starting with A as A_States subset of ccdata
  
#3  ##########################
#III.Create a plot of that subset showing Deaths over time, with a separate 
    #facet for each state. (20 pts)
      #Create a scatterplot
      #Add loess curves WITHOUT standard error shading
      #Keep scales “free” in each facet

  Plot_III <- 
    ggplot(A_States,
           aes(x = Last_Update,
               y = Deaths,
               color = Province_State))   +
      geom_point(alpha = 0.5,
                 size = 0.5)              +
      facet_wrap(~Province_State,
                 scales = 'free')         +
      geom_smooth()
  Plot_III
  
#4  ##########################
#IV.(Back to the full dataset) Find the “peak” of Case_Fatality_Ratio for 
     #each state and save this as a new data frame object called 
     #state_max_fatality_rate. (20 pts)
  #I’m looking for a new data frame with 2 columns:
    #“Province_State”
    #“Maximum_Fatality_Ratio”
  #Arrange the new data frame in descending order by Maximum_Fatality_Ratio
  #This might take a few steps. Be careful about how you deal with missing values!

  ccdata
    #Full Data set
  
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

#5  ##########################  
#V.Use that new data frame from task IV to create another plot. (20 pts)
      #X-axis is Province_State
      #Y-axis is Maximum_Fatality_Ratio
      #bar plot
      #x-axis arranged in descending order, just like the data frame 
         #(make it a factor to accomplish this)
      #X-axis labels turned to 90 deg to be readable
  #Even with this partial data set (not current), you should be able to see that
  #(within these dates), different states had very different fatality ratios.

  Plot_V <-  
    ggplot(state_max_fatality_ratio,
           aes(x = Province_State,
               y = Maximum_Fatality_Ratio))   +
      geom_boxplot()                          +
      theme(axis.text.x.bottom = element_text(angle = 90))
  Plot_V
  
#6  ##########################
#VI.(BONUS 10 pts) Using the FULL data set, plot cumulative deaths for the 
  #entire US over time
    #You’ll need to read ahead a bit and use the dplyr package functions 
    #group_by() and summarize() to accomplish this.
  
  ccdata
    #Full Data set
  
