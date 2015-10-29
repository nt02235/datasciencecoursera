best <- function(state, outcome) {
   ## Read outcome data
   outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
   ## Check that state and outcome are valid
   validStates <- levels(as.factor(outcome$State))
   validOutcomes <- c("heart attack", "heart failure", "pneumonia")
   
   ## Return hospital name in that state with lowest 30-day death rate
}