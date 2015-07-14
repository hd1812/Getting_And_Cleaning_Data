####Q1
##Carefully follow the instructions on
##https://class.coursera.org/getdata-030/forum/thread?thread_id=33

library(httr)
library(XML)
library(httpuv)

##Find OAuth settings for github
oauth_endpoints("github")

##After making application, replace key and secret below
myapp <- oauth_app("github",
  key = "3cdab49f37411ce420a7",
  secret = "15b444271aa808212c43308b858c34882dac3724")

##Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

##Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

##Read from JSON
temp<-fromJSON("https://api.github.com/users/jtleek/repos")
names(temp)
temp$name
x<-temp[temp$ame=="datasharing"]
temp[6,]

####Q2 & Q3
library(sqldf)
acs<-read.csv("getdata-data-ss06pid.csv")
data<-sqldf("select pwgtp1 from acs where AGEP < 50")
str(data)
AGEP1<-unique(acs$AGEP)
AGEP2<-sqldf("select distinct AGEP from acs")
AGEP1==AGEP2

####Q4
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

####Q5
##read fwf, inspect file to select right column, do not read as factor
data<-read.fwf("getdata-wksst8110.for",c(28,4),stringsAsFactors=FALSE)
data
str(data)
sum(as.numeric(data[[2]][5:nrow(data)]))

