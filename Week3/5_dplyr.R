####dplyr--specially designed for managing data frames

##select: return a subset of the columns of a data frame
##filter: extract a subset of rows from a data frame based on logical conditions
##arrange: reorder rows of a data frame
##rename: rename variables in a data frame
##mutate: add new variables/columns or transform existing variables
##summarise / summarize: generate summary statistics of different variables in the data frame, possibly within strata

##Properties
The first argument is a data frame.
The subsequent arguments describe what to do with it, and you can refer to columns in the data frame directly without using the $ operator (just use the names).
The result is a new data frame
Data frames must be properly formatted and annotated for this to all be useful

##Examples

library(dplyr)
##select
chicago <- readRDS("chicago.rds")
dim(chicago)
head(select(chicago, 1:5))

##select
names(chicago)[1:3]

##select
head(select(chicago, -(city:dptp)))

##filter
chic.f <- filter(chicago, pm25tmean2 > 30)
head(select(chic.f, 1:3, pm25tmean2), 10)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)

##arrange
chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

##arrange
chicago <- arrange(chicago, desc(date))
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

##rename
head(chicago[, 1:5], 3)
chicago <- rename(chicago, dewpoint = dptp, 
                  pm25 = pm25tmean2)
head(chicago[, 1:5], 3)

##mutate
chicago <- mutate(chicago, 
                  pm25detrend=pm25-mean(pm25, na.rm=TRUE))
head(select(chicago, pm25, pm25detrend))

##group_by
chicago <- mutate(chicago, 
                  tempcat = factor(1 * (tmpd > 80), 
                                   labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2), 
          no2 = median(no2tmean2))

##group_by
chicago <- mutate(chicago, 
                  year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2, na.rm = TRUE), 
          no2 = median(no2tmean2, na.rm = TRUE))
chicago$year <- NULL  ## Can't use mutate to create an existing variable

##%>%
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) 
%>% group_by(month) 
%>% summarize(pm25 = mean(pm25, na.rm = TRUE), 
              o3 = max(o3tmean2, na.rm = TRUE), 
              no2 = median(no2tmean2, na.rm = TRUE))
head(select(chicago, city:dptp))

chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% 
  summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2, na.rm = TRUE), no2 = median(no2tmean2, na.rm = TRUE))

