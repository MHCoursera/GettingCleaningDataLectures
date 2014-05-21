

## Q 1
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile="./data/survey.csv")    # use methos="curl" if mac
dateDownloaded<-as.POSIXlt(Sys.time())    # method two - standard date format
dateDownloaded

surveyData<-read.table("./data/survey.csv", sep=",",header=TRUE)
surveyData2<-data.table(surveyData)

head(surveyData2)
surveyData2[,Q:=(VAL==24)]
sum(surveyData2[,Q],na.rm=TRUE)   # Could not figure out to do it with data.table commands


## Q 3
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileurl, destfile="./data/gas.xlsx", mode="wb")
library(rJava)
library(xlsx)
gasData<-read.xlsx("./data/gas.xlsx",sheetIndex=1,header=TRUE)
head(gasData)
rowIndex<-c(18:23)
colIndex<-c(7:15)
dat<-read.xlsx("./data/gas.xlsx",sheetIndex=1,header=TRUE,rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)



## Q 4
library(XML)

fileurl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc<-xmlTreeParse(fileurl,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
zips<-xpathSApply(rootNode,"//zipcode",xmlValue)
zips
class(zips)
speczip<-zips=="21231"
speczip
sum(speczip)



