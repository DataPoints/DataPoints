args <- commandArgs(trailingOnly = TRUE)
path <- args[1]

data <- read.csv(file=path, sep=';', stringsAsFactors=FALSE, fileEncoding="windows-1250")

cleanData <- function(cell){
  #replace commas by dots
  temp <- gsub('([0-9]),([0-9])','\\1.\\2', cell, perl = TRUE)
  #remove spaces
  temp <- gsub('([0-9]) ([0-9])','\\1\\2', temp, perl = TRUE)
  #remove all dots but the last one
  temp <- gsub('[.](?=[^.]*[.])','', temp, perl = TRUE)
  #convert to numeric class
  if(suppressWarnings(!is.na(as.numeric(temp)))){
    as.numeric(as.character(temp))
  }else{
    cell
  }
}

data[] <- apply(data, c(1,2), cleanData)
write.table(data, file=path, row.names=FALSE, na="NULL", col.names=TRUE, sep=";")