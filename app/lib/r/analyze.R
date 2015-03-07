library(RPostgreSQL)

# funkcia nacita ulozeny csv subor do framu
readCSV = function(f){
	csv <- read.csv(file=f, sep=";")
	return(csv)
}

# funkcia vyberie ciselne stlpce a spravi nad nimi statisticke funkcie, ktore zoskupi do summary framu
analyze = function(csv){
	nums <- sapply(csv, is.numeric)
	min <- apply(csv[nums], 2, min)
	max <- apply(csv[nums], 2, max)
	median <- apply(csv[nums], 2, median)
	mean <- apply(csv[nums], 2, mean)

	summary <- rbind(min, max, median, mean)
	return(summary)
}

# funkcia vezme summary frame a vlozi jeho hodnoty do tabulky
DBinsert = function(summary, dataset_id){
	drv <- dbDriver("PostgreSQL")
	con <- dbConnect(drv, dbname="Skola_development")
	ncols <- dim(summary)[2]

	for (i in 1:ncols){
		sql <- sprintf("INSERT INTO summaries(dataset_id,header,min,max,median,mean) values (%d,'%s',%f,%f,%f,%f);", dataset_id, colnames(summary)[i], summary[1,i], summary[2,i], summary[3,i], summary[4,i]) 
		print(sql)
		dbSendQuery(con, sql)
	}
	dbDisconnect(con)
	dbUnloadDriver(drv)
	return(0)
}

# vezme argumenty path a id
args <- commandArgs(trailingOnly = TRUE)
path <- args[1] #v ruby datasets.storage
dataset_id <- as.integer(args[2]) # v ruby datasets.id

# zavola funkcie vyssie popisane
csv <- readCSV(path)
summary <- analyze(csv)
DBinsert(summary, dataset_id)
