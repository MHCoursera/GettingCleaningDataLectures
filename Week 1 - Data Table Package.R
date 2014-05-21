
# data.table package - faster version of data.frame.  Written in C
# new syntax
DF=data.frame(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF)
DF

library(data.table)
DF=data.table(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9))
DF
tables()  # shows all tables in memory
DF[2,]  subsets
DF[DF$y=="a",]   # , not needed
DF[c(2,3),]    # subsets 2nd and 3rd ROWS
DF[,c(2,3)]     # !!!!DOES NOT PULL COLUMNS.  UNIQUE FOR data.tables.  
# do not understand why columns do not work or what to do about it #
DF[,list(mean(x),sum(z))]    # so it will do work on the coumns instead of subset????
DF2<-DF  ## THIS DOES NOT MAKE A COPY!!!  MERELY LINKS THEM.  CHANGES TO DF WILL BE MADE TO DF2
DF[,table(y)]  # counts occurrences of each
#  := adds a new variable to data table
DF[,w:=z^2]
DF
# Pretty cool

# add a new variable based on math or logic in one step (rather than calc it then cbind)
DF[,a:=x>0]
DF
# Awesome again

# plyr like operations
# calc mean of x+w but grouped by a (TRUE or FALSE)
DF[,b:=mean(x+w),by=a]
DF

# Special variables 
# .N counts occurrences of a variable
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))  # Creates huge set of random letters a to c
head(DT)
DT[1:25]
DT[,.N,by=x]  # Counts each occurrence within X. Seems like should be ( after .N

# Setting a key makes everything much faster.
DT<-data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT["a"]

# Joins
DT1<-data.table(x=c("a","a","b","dt1"),y=1:4)
DT1
DT2<-data.table(x=c("a","b","dt2"),z=5:7)
DT2
setkey(DT1,x);setkey(DT2,x)
DT3<-merge(DT1,DT2)
DT3

# useful for fast reading
