

## Q 1

## Try new solution
install.packages("devtools")
devtools::install_github("hadley/httr")
library("httr", lib.loc="C:/Program Files/R/R-3.1.0/library")
library("httpuv", lib.loc="C:/Program Files/R/R-3.1.0/library")

### THIS IS ALL A MESS - NOT SURE WHAT WORKS






# 1st version
oauth_endpoints("github")
github <- oauth_endpoints("github")
myapp <- oauth_app("github", key="476babed2175848118b1",secret="82a9e38a3e09c2889354b4a6923c4988a04e5b10")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
1
GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))


# second version

myapp <- oauth_app("github", "476babed2175848118b1", secret="82a9e38a3e09c2889354b4a6923c4988a04e5b10")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
1
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))


## Q 2
?read.csv
acs <- read.csv("getdata-data-ss06pid.csv")
head(acs)
colnames(acs)
head(acs$AGEP)
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select * from acs where AGEP < 50 and pwgtp1")


fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "Idaho.csv")
list.files()

# dated the data
dateDownloaded = date()
dateDownloaded

#read with header
acs = read.csv("Idaho.csv", sep=",", na.strings=NA, header=TRUE)
str(acs)
#acs <- na.omit(acs)
typeof(acs)
# head(acs)
names(acs)

require(sqldf) # this is the only package you will need.
sqldf("select pwgtp1 from acs")
try <- sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select * from acs")
try <- sqldf("select * from acs where AGEP < 50 and pwgtp1")
head(try)


## Q 3
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")
sqldf("select unique * from acs")
sqldf("select AGEP where unique from acs")
sqldf("select distinct pwgtp1 from acs")



## Q 4

con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
htmlCode        # very sloppy but there it is
length(htmlCode[10]) does not count characters - only length as in elements
htmlCode[10]
?nchar
nchar(htmlCode[c(10,20,30,100)])


## Q 5

fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = "getdata%2Fwksst8110.for")
list.files()
dateDownloaded = date()
dateDownloaded
?read.fwf
fieldwidth <- c(15,4,4,9,4,9,4,9,4)
fcstfile <- read.fwf("getdata%2Fwksst8110.for",width=fieldwidth, header=FALSE, skip=4)
str(fcstfile)
sum(fcstfile[[4]])
