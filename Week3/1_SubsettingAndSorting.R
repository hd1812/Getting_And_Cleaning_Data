####Week 3 Subsetting and sorting

##Form a data frame
set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X

X[,1]
X[,"var1"]
X[1:2,"var2"]

##Logicals ands and ors
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]

##Dealing iwth missing values
X[which(X$var2 > 8),]

##sort(X$var1)--Note na.last
sort(X$var1,decreasing=TRUE)
sort(X$var2,na.last=TRUE)

##Ordering
X[order(X$var1),]

##Order multiple variables
X[order(X$var1,X$var3),]

##Ordering with plyr
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))

##Add row
X$var4 <- rnorm(5)
X

##Add column -- rbind/cbind
Y <- cbind(X,rnorm(5))
Y