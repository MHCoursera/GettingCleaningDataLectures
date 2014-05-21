
# Webscraping

con=url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode=readLines(con)
close(con)
htmlCode        # very sloppy but there it is

library(XML)    # as we did earlier - can select what you want
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en&oi=ao"
html <- htmlTreeParse(url,useInternalNodes=T)
xpathSApply(html,"//title",xmlValue)
xpathSApply(html,"//td[@id='col=citedby']",xmlValue)    # not getting the same result

# also the httr package
library(httr)
html2=GET(url)
html2
content2=content(html2,as="text")
?content
content2
parsedHtml=htmlParse(content2,asText=TRUE)
parsedHtml
xpathSApply(parsedHtml,"//title",xmlValue)
xpathSApply(parsedHtml,"//td[@id='col=citedby']",xmlValue)      # still nothing returned


# accessing sites with passwords
pg1=GET("http://httpbin.org/basic-auth/user/passwd")
pg1             # DENIED
pg2=GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
# test site - so user really is "user - otherwise put in actual user name and password
pg2
names(pg2)


# Use handles - once authenticated it is stored in the handle
?handle
google=handle("http://google.com")
google
pg1=GET(handle=google,path="/")
pg1
pg2=GET(handle=google,path="search")
pg2
# see http://www.r-bloggers.com/?s=Web+Scraping

