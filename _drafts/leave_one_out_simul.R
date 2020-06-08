
library(magrittr)
library(dplyr)
library(tidyr)
set.seed(070620)

v <- c(2, 6, 9, 4, 10, 3, 3, 7, 8)
mean(v)
length(v)

# leave-one-out, guess from 2 to 10
# calculate error

simulation_set <- data.frame(leave_out = numeric(0),
                             guess = numeric(0),
                             error = numeric(0))

for(idx in seq_along(v)){
  leave_out <- v[idx]
  answer <- leave_out
  
  for(guess in 1:10){
    
    error <- guess - answer
    simulation_set <- rbind(simulation_set, data.frame(leave_out = leave_out, guess = guess, error = error))
    
  }
  
  
}

simulation_set$sq_error <- simulation_set$error**2


plot(simulation_set$error~simulation_set$guess)

plot(simulation_set$sq_error~simulation_set$guess)

# ----

v <- runif(10000, min = 1, max = 10)
mean(v)
length(v)

# leave-one-out, guess from 2 to 10
# calculate error

simulation_set <- data.frame(leave_out = numeric(0),
                             guess = numeric(0),
                             error = numeric(0))

for(idx in seq_along(v)){
  leave_out <- v[idx]
  answer <- leave_out
  
  for(guess in 1:10){
    
    error <- guess - answer
    simulation_set <- rbind(simulation_set, data.frame(leave_out = leave_out, guess = guess, error = error))
    
  }
  
  
}

simulation_set$sq_error <- simulation_set$error**2


plot(simulation_set$error~simulation_set$guess, main = "no mean")

plot(simulation_set$sq_error~simulation_set$guess, main = "no mean" )


# boxplot

boxplot(simulation_set$sq_error ~ as.factor(simulation_set$guess), main = "no mean")

# ----
simulation_set <- data.frame(leave_out = numeric(0),
                             guess = numeric(0),
                             error = numeric(0))

for(idx in seq_along(v)){
  leave_out <- v[idx]
  answer <- leave_out
  
  for(guess in c(1:10, mean(v))){
    
    error <- guess - answer
    simulation_set <- rbind(simulation_set, data.frame(leave_out = leave_out, guess = guess, error = error))
    
  }
  
  
}

simulation_set$sq_error <- simulation_set$error**2


plot(simulation_set$error~simulation_set$guess, main = "with mean")

plot(simulation_set$sq_error~simulation_set$guess, main = "with mean")

# boxplot

boxplot(simulation_set$sq_error ~ as.factor(simulation_set$guess), main = "with mean")



simulation_set %>%
  group_by(as.factor(simulation_set$guess)) %>%
  summarise(boxplot= list( boxplot.stats(sq_error)$stats),
            stat = list( c('lower_whisker','lower_hinge','median','upper_hinge','upper_whisker') ) ) %>%
  unnest(stat, boxplot) %>%
  spread(stat, boxplot)




