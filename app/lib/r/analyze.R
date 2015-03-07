library(RPostgreSQL)

readCSV = function(f){
	csv <- read.csv(file=f, sep=";")
	return(csv)
}

analyze = function(csv){
	nums <- sapply(csv, is.numeric)
	min <- apply(csv[nums], 2, min)
	max <- apply(csv[nums], 2, max)
	median <- apply(csv[nums], 2, median)
	mean <- apply(csv[nums], 2, mean)

	summary <- rbind(min, max, median, mean)
	return(summary)
}

DBinsert = function(summary, dataset_id){
	drv <- dbDriver("PostgreSQL")
	con <- dbConnect(drv, dbname="Skola_development")
	#dbWriteTable(con, name='summaries', value=summary, append=TRUE)

	ncols <- dim(summary)[2]

	for (i in 1:ncols){
		sql <- sprintf("INSERT INTO summaries(dataset_id,header,min,max,median,mean) values (%d,'%s',%f,%f,%f,%f);", dataset_id, colnames(summary)[i], summary[1,i], summary[2,i], summary[3,i], summary[4,i]) 
		print(sql)
		dbSendQuery(con, sql)
	}
	dbDisconnect(con)
	dbUnloadDriver(drv)
	return(print("Succeed!"))
}

#begin
args <- commandArgs(trailingOnly = TRUE)
path <- args[1] #v ruby datasets.storage "~/Downloads/testik.csv"
dataset_id <- as.integer(args[2]) # v ruby datasets.id

csv <- readCSV(path)
summary <- analyze(csv)
DBinsert(summary, dataset_id)
#end
