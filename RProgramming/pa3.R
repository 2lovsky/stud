# 1. Plot the 30-day mortality rates for heart attack
# coerce the columns to be numeric.
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
outcome[, 17] <- as.numeric(outcome[, 17])
outcome[, 23] <- as.numeric(outcome[, 23])
# 2. Finding the best hospital in a state
source("best.R")
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")
# Coursera test 1-3
best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
# 3. Ranking hospitals by outcome in a state
source("rankhospital.R")
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
# Coursera test 4-7
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
# 4. Ranking hospitals in all states
source("rankall.R")
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
# Coursera test 8-10
#8 
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
#9
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
#10
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
