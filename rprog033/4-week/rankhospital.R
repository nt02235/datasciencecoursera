rankhospital <- function(state, outcome, num = "best") {
   ## Read outcome data
   data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.string = "Not Available")
   
   ## Check that state and outcome are valid
   ## Check that state and outcome are valid
   validStates <- levels(as.factor(data$State))
   if (length(which(validStates == state)) == 0) stop("invalid state") 
   
   validOutcomes <- c("heart attack", "heart failure", "pneumonia")
   if (length(which(validOutcomes == outcome)) == 0) stop("invalid outcome")
   
   if (outcome == validOutcomes[1]) {
      outcomeCols <-
         c(2,11)
   } else if (outcome == validOutcomes[2]) {
      outcomeCols <-
         c(2,17)
   } else {
      outcomeCols <-
         c(2,23)
   }
   
   ## Return hospital name in that state with the given rank 30-day death rate
   data <- data[data$State == state, outcomeCols]
   data[,2] <- as.numeric(data[, 2])
   data <- data[order(data[, 2], order(data[,1]), decreasing = F),]
   data <- data[which(!is.na(data[, 2])), ]
   data[,3]<-rep(1:nrow(data))

   if(num == "best") { num <- 1 }
   else if(num == "worst") { num <- nrow(data) }
   else if(num > nrow(data)) { return("NA")}
   
   return(data[data$V3 == num, 1])
   
}
