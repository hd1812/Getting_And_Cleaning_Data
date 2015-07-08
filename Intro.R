##Lecture notes
##
##Raw data > Processing script >tidy data>data analysis>data communication
##This lecture is focused on the first three steps

##Row and Processed data
##Raw data might only need to be processed once, all steps should be recorded for downstream to refer to

##Four things should have. Aim: Make data recoverable
##1. The raw data.
##2. A tidy data set
##3. A code book describing each variable and its values in the tidy data set.
##4. An explicit and exact recipe you used to go from 1 -> 2,3.


##Downloading Files

##get and set dir
##getwd(),setwd()

##Check file exist
##.exists("")  .create("")

##download data from internet
##download.file()



##Load flat files
##read.table()--flexible and robust,may slow, read into RAM,
##related: read.csv()



##read excel files
##read.xlsx(),read.xlsx2()



##read XML
##xmlTreeParse(fileUrl,useInterval=TRUE)
##get items on the menu and prices
##xpathSApply()
##e.g
##library(XML)
##fileUrl <- "http://www.w3schools.com/xml/simple.xml"
##doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
##rootNode <- xmlRoot(doc)
##xmlName(rootNode)
##names(rootNode)

##read JSON
##library(jsonlite)
##jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
##names(jsonData)
##jsonData$name
##names(jsonData$owner)
##jsonData$owner$login
##Write to JSON
##myjson <- toJSON(iris, pretty=TRUE)
##Convert back to JSON
##iris2 <- fromJSON(myjson)
##cat(myjson)

##data.table --inherets from data.frame/written in C, much faster
##e.g
##library(data.table)
##DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
##head(DF,3)
##DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
##head(DT,3)

##table() --see all tables
##DT[2,]  --subset
##DT[2,]
##DT[DT$y=="a",]
##More arguments available. see notes

##fast read