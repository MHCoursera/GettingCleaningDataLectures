        
file.exists("directoryname")  # will check to see if the directory name exists
dir.create("directoryname")  # will create the directory


# Downloading
download.file()  # downloads files from remote sources
fileurl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
file.exists("./data")
dir.create("./data")
download.file(fileurl, destfile="./data/cameras.csv")    # use methos="curl" if mac
list.files("./data")
dateDownloaded<-date()    # One way to store date downloaded
dateDownloaded
class(dateDownloaded)
dateDownloaded<-as.POSIXlt(Sys.time())    # method two - standard date format
dateDownloaded
class(dateDownloaded)


# Read local file with read.table - slower and lots of parameters, but very useful
# read.csv and read.csv2 are related
cameraData<-read.table("./data/cameras.csv")   # will not work - assumes tab delimited
cameraData<-read.table("./data/cameras.csv", sep=",", header=TRUE)
head(cameraData)

cameraData<-read.csv("./data/cameras.csv")  #Assumes csv file

## BOTH OF THESE ASSUME ANYTHING IN QUOTES IS IGNORED!!  USE quote="" to shut off


# Now download the Excel version (.xlsx)
fileurl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
file.exists("./data")
dir.create("./data")
download.file(fileurl, destfile="./data/cameras.xlsx", mode="wb") # added wb; use methos="curl" if mac
list.files("./data")
dateDownloadedExcel<-as.POSIXlt(Sys.time())    # method two - standard date format
dateDownloadedExcel
class(dateDownloadedExcel)
library(rJava)
library(xlsx)
cameraData<-read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=TRUE)   
# NOT WORKING - SOMETHING WRONG WITH DOWNLOAD
head(cameraData)

# Can read specific rows and/or columns
colIndex<-2:3
rowIndex<-1:4
cameraDataSubset<-read.xlsx("./data/cameras2.xlsx",sheetIndex=1,colIndex=colIndex, rowIndex=rowIndex)   
cameraDataSubset

# write.xlsx will write with similar parameters

# read.xlsx2 is faster but perhaps unstable with subsets

# XLConnect package is better for Excel files if you do it a lot

# Reading XML files - Extensive Markup Language
        # Markup is labels that give text structure
        # Content - text
                # Tags
                        # Start tags <section.
                        # End Tags   </section>   
                        # Empty Tags <line-break />
                        # Example: <Greeting> Hello, world </Greeting>
                # Attributes are components of the label
                        # <img src="jeff.jpg" alt="instructor"/>

library(XML)
fileurl<-"http://www.w3schools.com/xml/simple.xml"
doc<-xmlTreeParse(fileurl,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode,xmlValue)
xmlSApply(rootNode[[1]],xmlValue)

# XPath is another "language" that helps processing XML
        # /node         Top level node
        # //node        Node at any level
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

# Live example from Ravens website
fileurl<-"http://espn.go.com/nfl/team/_/name/bal/baltimore_ravens"
doc<-htmlTreeParse(fileurl,useInternal=TRUE)
scores<-xpathSApply(doc,"//li[@class='score']",xmlValue)
# li is a List item
teams<-xpathSApply(doc,"//li[@class='team-name']",xmlValue)
scores # after season they have loaded new schedule with teams but no score
teams


## JSON - Java Script Object Notation
library(jsonlite)
jsonData<-fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
names(jsonData$owner$login)

# Can also write data frames in R to JSON data sets
myjson<-toJSON(iris,pretty=TRUE)
cat(myjson)

# Can also bring JSON into data frames if structured correctly
iris2<-fromJSON(myjson)
head(iris2)

