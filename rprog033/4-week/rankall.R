rankall <- function(outcome, num = "best") {
   ## Read outcome data
   data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.string = "Not Available")
   
   ## Check that state and outcome are valid
   validOutcomes <- c("heart attack", "heart failure", "pneumonia")
   if (length(which(validOutcomes == outcome)) == 0) stop("invalid outcome")
   
   if (outcome == validOutcomes[1]) outcomeCols <- c(2, 7, 11) 
   else if (outcome == validOutcomes[2]) outcomeCols <- c(2, 7, 17) 
   else outcomeCols <- c(2, 7, 23)
   
   ## Simplify to necessary columns based on 'outcome'
   data <- data[, outcomeCols]
   colnames(data) <- c("hosp", "state", "rate")    # Easier col.names
   data[, "rate"] <- as.numeric(data[, "rate"])    # Coerce 'rate' to numeric
   data <- data[which(!is.na(data[data$rate,])),]  # Removing NA values

   ## Initializing final data frame
   rankResults <- data.frame("hospital" = NA, "state" = levels(as.factor(data$state)))

   ## For each state, find the hospital of the given rank
   ## Return a data frame with the hospital names and the
   ## (abbreviated) state name
   data <- data[order(data$state, data$rate, data$hosp, decreasing = F), ]
   stateEntryCount <- lapply(split(data$rate, data$state), length)
   
   if(num == "best") {num <- rep(1,54)}
   if(num == "worst") {num <- as.numeric(stateEntryCount)}
   else {num <- rep(num,54)}
      
   rankHospitals <- split(data$hosp, data$state)
   
   for(i in 1:54) {
      index <- num[i]
      if(index <= stateEntryCount[i])
         rankResults[i,1] <- rankHospitals[[i]][[index]]
   }
   rownames(rankResults) <- names(stateEntryCount)

   return(rankResults)
}
