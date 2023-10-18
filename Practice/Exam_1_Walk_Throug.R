#EXAM 1 Walk Through
#1
library(tidyverse)
df <- read_csv("./Exams_Brimhall/Exam_1/cleaned_covid_data.csv")

#2
A_states <- df[grep("^A", df$Province_State), ]

#3
ggplot(A_states, 
       aes(x=Last_Update,
           y=Deaths)) +
  geom_point()+
  facet_wrap(~Province_State,
             scales = 'free') +
  geom_smooth(se=FALSE)

#4
peaks <- c()
for (i in unique(df$Province_State)) {
  x <- df[df$Province_Stes == i, ]
  max(c(1,2,4,NA), na.rm = TRUE) }
peaks[i] <- y

state_max_fatality_rate <- 
data.frame(State= names(peaks),
           Peak =peaks)

#4 Easy way
 df %>%
   group_by(Province_State) %>%
   summarize(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio,
                       na.rm = TRUE))%>%
   arrange(desc(Maximum_Fatality_Ratio))

#5
state_max_fatality_rate <- 
  factor(state_max_fatality_rate, 
        levels =state_max_fatality_rate$Province_State)
 state_max_fatality_rate %>%
   ggplot(aes(x = Province_State,
              y = Maximum_Fatality_Ratio)) +
   geom_col()                               +
   theme(axis.text.x = element_text(angle = 90,
                                    hjust = 1,
                                    vjust = 0.5))
#6
df %>%
  group_by(Last_Update)%>%
  summarize(cumulative_deaths = sum(Deaths, na.rm=TRUE)) %>%
  ggplot(aes(x=Last_Update,
             y=cumulative_deaths)) +
  geom_smooth()
