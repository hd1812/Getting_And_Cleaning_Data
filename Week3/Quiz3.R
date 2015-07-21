####Quiz3

##Getting data from web
restData <- read.csv("getdata-data-ss06hid.csv")

##Q1
agricultureLogical<-(restData$ACR==3 & restData$AGS==6)
x<-restData[which(agricultureLogical==TRUE),]
head(x)

##Q2
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile="jeff.jpg",mode="wb")##wb is binary

library(jpeg)
pic<-readJPEG("jeff.jpg",native=TRUE)
quantile(pic,probs=c(0.3,0.8))

##Q3
GDP <- read.csv("getdata-data-GDP.csv",blank.lines.skip = TRUE)
EDU <- read.csv("getdata-data-EDSTATS_Country.csv")
GDPCountry<-as.factor(GDP$X)
nameMatrix<-EDU$CountryCode %in% GDP$X[6:195]
commonCountry<-EDU[nameMatrix,]
x<-sort(as.numeric(GDP$Gross.domestic.product.2012[6:195]),decreasing=TRUE)
x[13]
GDP[as.numeric(GDP$Gross.domestic.product.2012[6:195])==x[13],]

##Q4 Q5 remain unsolved