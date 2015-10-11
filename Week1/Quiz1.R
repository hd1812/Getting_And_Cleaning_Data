##Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="housing.csv")
HouseData<-read.csv("housing.csv",header = TRUE)
x<-subset(HouseData,VAL==24,na.rm=TRUE)
str(x)


##Q3
##The following code does not on ttp PC
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile="gas.xlsx",mode="wb")
library(xlsx)

##RCurl package, not working
library(RCurl)
getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx")

##XLConnect package
library(XLConnectJars)
library(XLConnect)
library(xlsx)
Data <- readWorksheet(loadWorkbook("gas.xlsx"),sheet=1,startRow=18,endRow=23,startCol=7,endCol=15)

rowIndex <- 18:23
colIndex <- 7:15
Data <- read.xlsx("gas.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex,mode='wd')
sum(Data$Zip*Data$Ext,na.rm=T)

##Q4

##XML package
library(XML)
fileURL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"##'s' is removed from https
doc <- xmlTreeParse(fileURL,useInternal=TRUE)
rootNode<-xmlRoot(doc)
zipcodes<-xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcodes[zipcodes==21231])

##Q5
##data.table package
library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile="Q8data.csv")
DT <- fread("Q8data.csv")

##testing system time. apply loops when time interval is too small
system.time(rowMeans(DT)[DT$SEX==1])+system.time(rowMeans(DT)[DT$SEX==2])

system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))

system.time(
for (i in 1:100){
tapply(DT$pwgtp15,DT$SEX,mean)
}
)

system.time(
for (i in 1:100){
sapply(split(DT$pwgtp15,DT$SEX),mean)
}
)

system.time(
for (i in 1:100){
DT[,mean(pwgtp15),by=SEX]
}
)

system.time(
for (i in 1:100){
mean(DT$pwgtp15,by=DT$SEX)
}
)




