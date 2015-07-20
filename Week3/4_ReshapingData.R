####Week 3 reshaping data
##Goal is to tidy data

library(reshape2)
head(mtcars)

##Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

##Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

##averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

##split
spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns

##apply
sprCount = lapply(spIns,sum)
sprCount

##combine
unlist(sprCount)
sapply(spIns,sum)

##plyr package
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

##create a new variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)
