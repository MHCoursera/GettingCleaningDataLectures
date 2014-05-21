
# HDF5 - large and structured data sets.  Hierarchical Data Format
# stored in groups with meta data
# www.hdfgroup.org

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
a
library(rhdf5)
created=h5createFile("example.h5")   # creates an HDF5 file (empty)
created

created=h5createGroup("example.h5","foo")       # adds groups to the structure
created=h5createGroup("example.h5","bar")
created=h5createGroup("example.h5","foo/foobar")
h5ls("example.h5")

A=matrix(1:10,nr=5,nc=2)        # create a matrix in R
h5write(A,"example.h5","foo/A") # wites A to one of the groups created above
B=array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
h5write(B,"example.h5","foo/foobar/B")
h5ls("example.h5")

# can also write a dataset directly
df=data.frame(1L:5L,seq(0,1,length.out=5),c("ab","cde","fghi","a","s"),stringsAsFactors=FALSE)
df
h5write(df,"example.h5","df")   #without a specific group, assumes top level not assigned to group
h5ls("example.h5")

# reading HDF5
readA=h5read("example.h5","foo/A")
readB=h5read("example.h5","foo/foobar/B")
readdf=h5read("example.h5","df")        # assumes top level.  
readA

# read or write to specific locations (partial) - index command
h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))     rows 1-3, first column
h5read("example.h5","foo/A")

