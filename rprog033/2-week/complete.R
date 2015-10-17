complete <- function(directory, id = 1:332) {
   record <- data.frame(id = integer(0), nobs = integer(0))
   
   files <- vector('character')
   files <- paste(directory, "/", sprintf("%03d", id), ".csv", sep = "")
#    files <- paste(directory, "/", files,".csv",sep="")
#    files <- paste("00", id[id < 10], sep ="")
#    files <- c(files, paste("0", id[id > 9 & id < 100], sep = ""))
#    files <- c(files, id[id > 99])   
#    if(sum(nchar(files) < 3) != 0)
#       files <- files[-which(nchar(files) != 3)]
   
   for(i in 1:length(id)) {
      data <- read.csv(files[i], header = T)
      record[i,"id"] <- id[i]
      record[i,"nobs"] <- nrow(data[!is.na(data$sulfate) & !is.na(data$nitrate),])
   }
#    record[which(record$nobs == 0),"nobs"] <- NA
   record
}
