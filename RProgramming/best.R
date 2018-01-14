best <- function(state, illoutcome) {
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
    outcomeSt <- subset(outcome, State == state)
    rate <- min(outcomeSt[!is.na(outcomeSt[,colNu]),colNu])
    rsltPos <- match(rate,outcomeSt[,colNu])
  }
  else stop("invalid state")
  
  outcomeSt[rsltPos, "Hospital.Name"]
}