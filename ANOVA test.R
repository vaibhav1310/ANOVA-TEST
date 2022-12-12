
####### Analysis of varience (ANOVA Test)

library(gapminder)

view(gapminder)

# creating a dataset to work with

 gapdata <- gapminder %>% filter(year == 2007 & continent %in%
                                   c("Americas","Asia","Europe"))%>% select(continent,lifeExp)
 
 # Take a look at life_exp according to continents 
                                
 gapdata %>% group_by(continent) %>% summarise(Avg_life = mean(lifeExp)) %>% arrange(Avg_life) 
 
 
 # Research question:
   
 # Is the life expectancy in these three continents different
 
 # Hypothesis testing: HO: Mean life expectancy is the same
 #                     H1: Mean life expectancy is not the same
 
 # observation: Difference in mean is observed in the sample data, but is this statistically significant (alpha = 0.05)
 
 # Create ANOVA model
 
 gapdata %>% aov(lifeExp ~ continent,data = .) %>% summary() 
 gapdata %>% aov(lifeExp ~ continent,data = .)
 
 # p-value < 3.42e-05, so the probability of getting this difference in means is very low in HO 
 # hence we will reject the null hypothesis and accept the H1
 
 # Is this significance being driven by a particular continent ?
 
 gapdata %>% aov(lifeExp ~ continent,data = .) %>% TukeyHSD()%>% plot()
 
 # The difference b/w Asia and Americas 
 # has an adjusted p value of 0.14 (not significant)
 

 