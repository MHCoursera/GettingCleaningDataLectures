
library("RMySQL", lib.loc="C:/Program Files/R/R-3.1.0/library")    # load RMySQL
library("DBI", lib.loc="C:/Program Files/R/R-3.1.0/library")     # Load DBI

?dbConnect
?dbGetQuery
ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDb,"show databases;")
dbDisconnect(ucscDb)
result

hg19 <- dbConnect(MySQL(),user="genome",db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19,"select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)
query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")  # selects subset of records
affyMis <- fetch(query)   # pulls in actual records selected above
quantile(affyMis$misMatches)

affyMisSmall <- fetch(query,n=10)     # only pulls 10 rows of data
dbClearResult(query)    #  clears query from server
affyMisSmall

dbDisconnect(hg19)  # ALWAYS CLOSE THE CONNECTION

# see http://www.r-bloggers.com/mysql-and-r/

