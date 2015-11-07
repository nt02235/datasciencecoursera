destFolder <- "01-lecture"
destPath <- paste("./", destFolder, "/", sep = "")

## Downloading Files Lecture
if (!file.exists(destFolder)) {
   dir.create(destFolder)
}

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = paste(destPath, "baltimoredata.csv", sep = ""), method = "curl")
dataCSV <-read.csv(paste(destPath, "baltimoredata.csv", sep = ""), header = T)

## Downloading EXCEL files
install.packages("xlsx")
library(xlsx)

excelURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(excelURL, destfile = paste(destPath, "baltimoredata.xlsx", sep = ""), method = "curl")

dataXLSX <- read.xlsx(paste(destPath, "baltimoredata.xlsx", sep = ""), sheetIndex = 1, header = T)
dataXLSX2 <- read.xlsx2(paste(destPath, "baltimoredata.xlsx", sep = ""), sheetIndex = 1, header = T)

## Downloading XML files
