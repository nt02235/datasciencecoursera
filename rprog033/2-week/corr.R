corr <- function(directory, threshold = 0) {
   records <- complete(directory)
   records <- record[which(records$nobs > threshold), -2]
   
   cor <- numeric()
   
   if(length(records) != 0){
      
      files <- vector('character')
      files <- paste("00", records[records < 10], sep ="")
      files <- c(files, paste("0", records[records > 9 & records < 100], sep = ""))
      files <- c(files, records[records > 99])
      files <- paste(directory,"/", files,".csv",sep="")
      
      for(i in 1:length(records)){
         data <- read.csv(files[i], header = T)
         cor[i] <- cor(data$nitrate, data$sulfate, use = "complete.obs")
      }
   }
   
   cor
}