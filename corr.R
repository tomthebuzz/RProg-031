## R-Programming #031 - Course Programming Assignment 1 - Air Pollution
## T. Debus                                       Aug. 12th 2015
##
## Part 3 - Function Correlate

corr <- function(directory, threshold = 0) {

correlations <- numeric(0)
files <- list.files(directory)
classes <- c('Date', 'numeric', 'numeric', 'integer')


  for(filename in files) {

    cor_dat <- read.csv(paste0(directory, '/', filename), colClasses=classes)

    if(sum(complete.cases(cor_dat)) > threshold){

      correlation <- cor(cor_dat[['sulfate']], cor_dat[['nitrate']], use='complete.obs')
      correlations <- c(correlations, correlation)
    }
  }
  return(correlations)
}  
  

tst <- corr("specdata", 400)
print(summary(tst))

