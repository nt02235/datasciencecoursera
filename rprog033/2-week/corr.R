corr <- function(directory, threshold = 0) {
   records <- complete(directory)
   records <- records[which(records$nobs > threshold), -2]
   
   cor <- numeric()
   
   if(length(records) != 0){
      
      files <- vector('character')
      files <- paste(directory, "/", sprintf("%03d", records), ".csv", sep = "")
      
      for(i in 1:length(records)){
         data <- read.csv(files[i], header = T)
         cor[i] <- cor(data$nitrate, data$sulfate, use = "complete.obs")
      }
   }
   
   cor
}