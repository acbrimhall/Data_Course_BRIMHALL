dat <- read_csv("./unicef-u5mr.csv")

nc <- as.data.frame(c("Country", "Continent", "Region", "Year", "U5MR"))

dat <- 
  dat %>% 
    {pivot_longer(starts_with("U5MR."))} %>%
    separate()

?filter()
    

transmute(starts_with("U5MR."),
              names_sep = 5,
              names_to = nc))


dat$Year <- 
  gsub(pattern = 'U5MR.', replacement = "", as.character(dat$Year))

dat$Year <- as.numeric(dat$Year)

dat <- na.omit(dat)


dat$Mean <- forf$`dat$U5MR`

f <- aggregate(x = dat$U5MR ~ dat$Country, FUN = mean)
?aggregate

dat$Mean <- for()
  map_vec(x = dat, 
          from = dat$Mean,
          to = f[[2]])

bind_cols(Means,.id= 'M') %>% 
  filter()


dat %>% 
  mutate()



















##############################
D <- read_csv("./unicef-u5mr.csv")

D %>% 
  pivot_longer(starts_with("U5MR."))
tD  <- as_tibble(D)
  transmute_if(tD)

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
  



  
  p1 <- 
    ggplot(dat, 
           aes(x = Year, 
               y = MeanU5MR)) +
    geom_smooth(method = lm,
                formula = MeanU5MR ~ Year,
                se = FALSE) 
  
  p1
  
  p2 <- 
    ggplot(preds_2, aes(x = Year, y = preds)) +
    geom_smooth(method = lm, se = FALSE) 
  
  p2
  
  p3 <- 
    ggplot(dat, 
           aes(x = Year, 
               y = U5MR, 
               color = Continent)) +
    geom_smooth(method = lm,
                formula = Year * Continent,
                se = FALSE) 
  
  p3
  
  plots(p1, p2, p3)
  
  
  
  
  p3 <- 
    ggplot(mean_U5MR_byContandYear, 
           aes(x = Year, y = MeanU5MR, color = Continent)) +
    geom_smooth(method = lm,
                formula = U5MR ~ Year * Continent
                se = FALSE) 
  
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
  
  ########
  
  library(plyr)
  
  mean_U5MR_byContandYear <- 
    plyr::ddply(dat,
                ~Continent + Year, 
                summarise, 
                meanU5MR = mean(U5MR))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  sapply(split(dat$U5MR, dat$Continent), mean)  
  
  mean(dat[dat$Continent == 'Africa', 'U5MR'])
  
  Year_Continent_U5MR <- 
    select(dat, Year, County, U5MR)
  
  Year_Continent_U5MR <- 
    dat %>% select(Year, Country, U5MR)
  
  Year_Continent_U5MR <- 
    dat %>%
    filter(Continent == "Asia") %>%
    select(Year, Country, U5MR)
  
  Year_Continent_U5MR
  
  mean(Year_Continent_U5MR$U5MR)
  
  dat %>% group_by(Continent) %>% str()
  
  U5MR_byContinents <- 
    dat %>%
    group_by(Year, Continent) %>%
    summarize(mean_U5MR = mean(U5MR))
  
  
  U5MR_byContinents
  
  
  
  
  
  
  Trial <- dat
  
  subset(Trial,
         select= Country)
  
  Each <- group_by(subset(Trial,
                          select= Country))
  
  mean(Trial$U5MR)
  
  Trial <- as.data.frame.table(Trial)
  Trial[ ,
         lapply(.SD, mean),
         by =c("Country")]
  
  Trial %>% 
    group_by(subset(Trial, select= Country)) %>% 
    summarise(across(everything(), mean))
  
  ?mean
  
  ?group_by
  
  ?subset
  
  ###################  
  dat2 <- dat
  
  
  nesteddat2 <- 
    dat2 %>% 
    nest(data= c(Country, U5MR)) 
  
  by_continent <- 
    dat2 %>% 
    group_by(Continent,Year, U5MR) %>% 
    nest()
  
  by_continent <- 
    by_continent %>% 
    mutate(mean = purrr::map(data,~mean(U5MR~Continent, data= .)))
  
  
  #   mutate(values = mean(Continent))
  #   mean(nesteddat2)
  #   as.data.frame(nesteddat2$data)
  #   rowwise() 
  #   mutate(.data= unnest_longer(nesteddat2$data)  ,n=nrow(mean(nesteddat2)))
  
  
  Mean <- 
    dat2 %>% 
    group_by(Continent) %>% 
    mutate(m =mean)
  
  nesteddat2$Mean <- ncol(Mean)
  
  
  
  
  
  
  ?purr::map2_dbl
  df1 <- 
    structure(
      list(Name = c(1L, 1L, 1L, 2L, 2L, 3L, 4L, 4L), 
           Condition = c("A", "B", "A", "B", "B", "A", "A", "B"), 
           Values = c("True", "False", "True", "True", "False", "False", "True", "True")), 
      class = "data.frame", row.names = c(NA,-8L))
  #Code
  library(dplyr)
  #Mutate
  df1 %>% 
    mutate(Index=ifelse(Values=='True',1,0)) %>% 
    group_by(Name,Condition) %>%
    summarise(Avg = mean(Index,na.rm=T))
  
  dat2 %>% 
    mutate(Index = ifelse(Continent)) %>%  
    rowwise(Mean = mean(Index)) #%>% 
  summarise(Mean = mean(Index))
  
  
  by_country <- dat %>%
    group_by(Continent, U5MR) %>%
    nest()
  
  by_country <- by_country %>%
    mutate(model = purrr::map(data, ~ mean(U5MR ~ Continent, data = .)))
  
  
  
  
  ??by
  ??index
  ?mutate
  ?unnest_longer
  ?rowwise
  ?n_transports
  ?nest
  ?nest_join
  ?rowwise
  
  
  ########
  #5. Create another plot that shows the mean U5MR for all the countries 
  #within a given continent at each year (20 pts)
  #- Another line plot (not smooth trendline)
  #- Colored by continent
  
  Plot_2 <-   
    dat %>% 
    ggplot(aes(x= mean(~Continent),
               y= Year,
               color = Country)) +
    geom_point(size = 0.2)  +
    geom_line()
  
  
  
  
  
  
  
  mod1 <- 
    glm(data=dat,
        formula = U5MR ~ Year)
  
  mod2 <- 
    glm(data=dat,
        formula = U5MR ~ Year + Continent)
  
  mod3 <- 
    glm(data=dat,
        formula = U5MR ~ Year * Continent)
  
  
  mean_U5MR_byContandYear$preds_one<- 
    add_predictions(mean_U5MR_byContandYear, mod1)
  
  mean_U5MR_byContandYear$preds_two<- 
    add_predictions(dat, mod2)
  
  mean_U5MR_byContandYear$preds_three<- 
    add_predictions(dat, mod3)
  
  distinct(mean_U5MR_byContandYear)
  
  
  preds_1
  preds_2
  preds_3
  
  
  grid <- 
    mean_U5MR_byContandYear %>% 
    data_grid(preds_1, preds_2) %>% 
    gather_predictions(mod1, mod2)
  
  grid
  
  ggplot(dat,
         aes(x=Year, y=preds_1$pred))
  
  
  
  
  
  
  
  
  
  
  
  
  
  



