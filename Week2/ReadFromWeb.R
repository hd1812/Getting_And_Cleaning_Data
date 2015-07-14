###Reading dta from the Web

##Webscraping: extract data from HTML code of websites
##If read too quickly, IP may be blocked.

##get data off webpages -- raw html file. Hard to read
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

##Parsing with XML -- Parsed by XML. XML is defined as syntax. HTML is defined as vocabulary.
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

##GET from the httr package
library(httr); html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

##Accessing websites with passwords -- return 401 if not logged in
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1

##Accessing websites with passwords
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user","passwd"))
pg2
names(pg2)

##Using handles
google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")
