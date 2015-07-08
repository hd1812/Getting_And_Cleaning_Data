##Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="housing.csv")
HouseData<-read.csv("housing.csv",header = TRUE)
x<-subset(HouseData,VAL==24,na.rm=TRUE)
str(x)


##Q3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ",destfile="gas.csv")
library(xlsx)
colIndex <- 18:23
rowIndex <- 7:15
dat <- read.xlsx("./data/cameras.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)