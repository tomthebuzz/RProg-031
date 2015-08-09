## R-Programming #031 - Course Programming Assignment 1 - Air Pollution
## T. Debus                                       Aug. 12th 2015
##
## Part 2 - Function Complete NOBS

complete <- function(directory, id=1:332) {

nobs <- integer(0)

for(i in id)  {

    monitor <- read.csv(paste0(directory, '/', sprintf('%03d', i), '.csv'), 
                      colClasses=c('Date', 'numeric', 'numeric', 'integer'))
  nobs <- c(nobs, sum(complete.cases(monitor)))
}

res <- data.frame(id, nobs)
return(res)

}

## tst <- complete("specdata", c(4,8,12,123))
## print(tst)

