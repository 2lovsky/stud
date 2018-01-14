rankhospital <- function(state, illoutcome, num = "best"){
  ## Read outcome data
  if (!exists("outcome")){
    outcome <- read.csv("outcome-of-care-measures.csv", 
                        colClasses = "character")
    
    outcome[, 11] <- as.numeric(outcome[, 11])
    outcome[, 17] <- as.numeric(outcome[, 17])
    outcome[, 23] <- as.numeric(outcome[, 23])
  }
  
  states <- unique(outcome["State"])[,1]
  
  
  ## Check that state and outcome are valid
  if(illoutcome == "heart attack") colNu <- 11
  else if(illoutcome == "heart failure") colNu <- 17
  else if(illoutcome == "pneumonia") colNu <- 23
  else stop("invalid outcome")
  
  if(state %in% states){
    outcomeSt <- subset(outcome[!is.na(outcome[,colNu]),], 
                        State == state, c(2, colNu))
    # Order by rate, then by alphabet
    ordered <- outcomeSt[order(outcomeSt[2],outcomeSt[1]),]
    # num: "best", "worst" or rank number
    if(num == "best") num1 <- 1
    else if(num == "worst") num1 <- dim(ordered)[1]
    else num1 <- num
    # First column - hospital name
    rslt <- ordered[num1, 1]
  }
  else stop("invalid state")
  
  rslt
}