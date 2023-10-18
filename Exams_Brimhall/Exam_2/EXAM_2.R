##EXAM 2
#0. Prep-may require downloading the proper libraries for use.

  library(tidyverse)
  library(patchwork)
  library(ggimage)
  library(ggpubr)
  library(ggforce)
  library(gganimate)
  library(GGally)
  library(plotly)
  library(kableExtra)
  library(janitor)
  library(readxl)
  library(plyr)
  library(performance)
  library(modelr)
  
  ####gganimate transition.reveal = important for Exam 2
  
  
#1. Read in the unicef data (10 pts)
  df <- read_csv("./unicef-u5mr.csv")

#2. Get it into tidy format (10 pts) 

  dat <- df

  names(dat) <-  
    sub(pattern = "U5MR.", replacement = "#", x = names(dat))
  
  dat <- 
    dat %>% pivot_longer(starts_with("#"))
  
  colnames(dat) <-  
    c("Country", "Continent", "Region", "Year", "U5MR")
  
  dat$Year <- 
    gsub(pattern = '#', replacement = "", as.character(dat$Year))
  
  dat$Year <- as.numeric(dat$Year)
  
  dat <- na.omit(dat)
  
  
#3. Plot each country’s U5MR over time (20 points)
    #- Create a line plot (not a smooth trend line) for each country
    #- Facet by continent
  
  Plot_1 <-   
    dat %>% 
      ggplot(aes(x= Year,
                 y= U5MR,
                 group = Country)) +
      geom_point(size = 0.2)  +
      facet_wrap(~Continent)  +
      geom_line()
    
  Plot_1
  
#4. Save this plot as LASTNAME_Plot_1.png (5 pts) 

  ggsave('BRIMHALL_Plot_1.png')

#5. Create another plot that shows the mean U5MR for all the countries 
  #within a given continent at each year (20 pts)
    #- Another line plot (not smooth trendline)
    #- Colored by continent

   mean_U5MR_byContandYear <- 
    plyr::ddply(dat,
                ~Continent + Year, 
                summarise, 
                MeanU5MR = mean(U5MR))
   
  Plot_2 <-   
    mean_U5MR_byContandYear %>% 
    ggplot(aes(x= Year,
               y= MeanU5MR,
               color = Continent)) +
    geom_line(linewidth = 2)
  
  Plot_2
  
  
#6. Save that plot as LASTNAME_Plot_2.png (5 pts) 

  ggsave('BRIMHALL_Plot_2.png')
  
#7. Create three models of U5MR (20 pts)
    #- mod1 should account for only Year
    #- mod2 should account for Year and Continent
    #- mod3 should account for Year, Continent, and their interaction term

  mod1 <- 
    glm(data=dat,
        formula = U5MR ~ Year)

  mod2 <- 
    glm(data=dat,
        formula = U5MR ~ Year + Continent)
  
  mod3 <- 
    glm(data=dat,
        formula = U5MR ~ Year * Continent)
  
      
#8. Compare the three models with respect to their performance
    #- Your code should do the comparing
    #- Include a comment line explaining which of these 
       #three models you think is best

  compare_performance(mod1, mod2, mod3) 
  
  compare_performance(mod1, mod2, mod3) %>% plot
  #The plot allows us to see the visual representation of how each model performs
  #in several different model types and easily determined the best model.
  #Looking at the Comparison of Model Indices plot model 3 shows a better fit 
  #for all of the model types than model 1 and model 2.
  #Model 3 is the best out of the three compared. 
  
  
#9. Plot the 3 models’ predictions like so: (10 pts)
  #Honestly couldn't figure it out. I believe I missed the class we covered 
  #it due to illness. I would appreciate any tips you'd be willing to give.
  
  
         # add_predictions(mean_U5MR_byContandYear, mod1) %>% 
         #    ggplot(aes(x=Year, y=preds, color = factor(rank)))+
         #    geom_smooth()
          
          # ggplot(mod1, aes(x=Year, y=U5MR))+
          #  geom_point()
          

#10. BONUS - Using your preferred model, predict what the U5MR would be for 
  #Ecuador in the year 2020. The real value for Ecuador for 2020 was 13 under-5 
  #deaths per 1000 live births. How far off was your model prediction???
    #Your code should predict the value using the model and calculate the 
      #difference between the model prediction and the real value (13).
    #Source: https://data.unicef.org/country/ecu/
    #Create any model of your choosing that improves upon this “Ecuadorian 
      #measure of model correctness.” By transforming the data, I was able to 
      #find a model that predicted Ecuador would have a U5MR of 16.61…not too 
      #far off from reality

  
