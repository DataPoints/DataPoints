library(RPostgreSQL)

# funkcia vyberie ciselne stlpce a spravi nad nimi statisticke funkcie, ktore zoskupi do summary framu
analyze = function(data){
	min <- apply(data, 2, min)
	max <- apply(data, 2, max)
	median <- apply(data, 2, median)
	mean <- apply(data, 2, mean)

	summary <- rbind(min, max, median, mean)
	return(summary)
}

CountSummaries = function(dataset_id,header_id){

    drv <- dbDriver("PostgreSQL")
	con <- dbConnect(drv, dbname=dbName, user= dbUsername, password=dbPassword)

    resultSet <- dbSendQuery(con,paste("SELECT * FROM columns WHERE type_id=4 AND header_id=",header_id))
    numberColumns <- fetch(resultSet,n=-1)

    for ( i in 1:nrow(numberColumns)){

        resultSet <- dbSendQuery(con,paste("SELECT data_table_name FROM datasets where id=",dataset_id))
        DataTableName <-fetch(resultSet,n=-1)

        resultSet <- dbSendQuery(con,paste("SELECT ",'"', numberColumns[i,3],'"'," FROM ",'"',DataTableName[1,1],'"',sep=""))
        Data <-fetch(resultSet,n=-1)
        Data <- Data[[1]]
        Data <- as.numeric(as.character(Data))
        Data <- data.frame(Data)

        summary <-analyze(Data)
        cat(summary)

        sql <- sprintf("INSERT INTO summaries(dataset_id,header,min,max,median,mean) values (%d,'%s',%f,%f,%f,%f);", dataset_id, numberColumns[i,3], summary[1,1], summary[2,1], summary[3,1], summary[4,1])
        print(sql)
        dbSendQuery(con, sql)
    }

    dbDisconnect(con)
    dbUnloadDriver(drv)
    return(0)
}

CountSummary = function(dataset_id,column_id,column_name){

    drv <- dbDriver("PostgreSQL")
    con <- dbConnect(drv, dbname=dbName, user= dbUsername, password=dbPassword)

    resultSet <- dbSendQuery(con,paste("SELECT * FROM summaries where dataset_id=",dataset_id," AND header= ","'",column_name,"'",sep=""))
    SummaryData <-fetch(resultSet,n=-1)

    if(nrow(SummaryData)==0)
    {

        resultSet <- dbSendQuery(con,paste("SELECT data_table_name FROM datasets where id=",dataset_id))
        DataTableName <-fetch(resultSet,n=-1)

        resultSet <- dbSendQuery(con,paste("SELECT",'"', column_name ,'"'," FROM ",'"',DataTableName[1,1],'"',sep=""))
        Data <-fetch(resultSet,n=-1)

         if(grepl("^[0-9]*[.][0-9]*$|^[0-9]*$",Data[1,1])==TRUE && grepl("^[0-9]*[.][0-9]*$|^[0-9]*$",Data[3,1])==TRUE){
            Data <- Data[[1]]
            Data <- as.numeric(as.character(Data))
            Data <- data.frame(Data)

            summary <-analyze(Data)

            sql <- sprintf("INSERT INTO summaries(dataset_id,header,min,max,median,mean) values (%d,'%s',%f,%f,%f,%f);", dataset_id, column_name, summary[1,1], summary[2,1], summary[3,1], summary[4,1])
            print(sql)
            dbSendQuery(con, sql)
        }
    }

    dbDisconnect(con)
    dbUnloadDriver(drv)
    return(0)

}

#------------------>script START<--------------------------------------

# vezme argumenty csv.path, dataset.id, dbName, dbUsername a dbPassword

args <- commandArgs(trailingOnly = TRUE)

dbName <- args[1]
dbUsername <- args[2]
dbPassword <- args[3]

dataset_id <- as.integer(args[4]) # v ruby datasets.id
header_id <- as.integer(args[5]) # v ruby datasets.header_id

if(length(args)==5){
    cat("5 argumentov\n")
    CountSummaries(dataset_id,header_id)
} else if(length(args)==6){

    columnToChange <- args[6]
    cat("6 argumentov\n")
    CountSummary(dataset_id,column_id,columnToChange)
}
