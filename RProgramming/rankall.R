rankall <- function(illoutcome, num = "best") {
  ## Read outcome data
  if (!exists("outcome")){
    outcome <- read.csv("outcome-of-care-measures.csv", 
                        colClasses = "character")
    
    outcome[, 11] <- as.numeric(outcome[, 11])
    outcome[, 17] <- as.numeric(outcome[, 17])
    outcome[, 23] <- as.numeric(outcome[, 23])
  }
  
  states <- sort(unique(outcome["State"])[,1])
  
  
  ## Check that state and outcome are valid
  if(illoutcome == "heart attack") colNu <- 11
  else if(illoutcome == "heart failure") colNu <- 17
  else if(illoutcome == "pneumonia") colNu <- 23
  else stop("invalid outcome")
  
  ## For each state, find the hospital of the given rank

  df <- data.frame(matrix(NA, 
                          nrow = length(states),
                          ncol = 2))
  rownames(df) <- states
  colnames(df) <- c("hospital", "state")
  for (state in states) {
    df[state,] <- c(
      rankhospital(state, illoutcome, num),
      state
    )
  }

  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  df
}