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



#2. Get it into tidy format (10 pts) 



#3. Plot each country’s U5MR over time (20 points)
#- Create a line plot (not a smooth trend line) for each country
#- Facet by continent



#4. Save this plot as LASTNAME_Plot_1.png (5 pts) 



#5. Create another plot that shows the mean U5MR for all the countries 
#within a given continent at each year (20 pts)
#- Another line plot (not smooth trendline)
#- Colored by continent



#6. Save that plot as LASTNAME_Plot_2.png (5 pts) 




#7. Create three models of U5MR (20 pts)
#- mod1 should account for only Year
#- mod2 should account for Year and Continent
#- mod3 should account for Year, Continent, and their interaction term




#8. Compare the three models with respect to their performance
#- Your code should do the comparing
#- Include a comment line explaining which of these 
#three models you think is best



#9. Plot the 3 models’ predictions like so: (10 pts)




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


