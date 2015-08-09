## R-Programming #031 - Course Programming Assignment 1 - Air Pollution
## T. Debus                                       Aug. 12th 2015
##
## Part 1 - Function PollutionMean 

pollutantmean <- function(directory, pollutant, id = 1:332) {

  totframe <- c(NA, NA, NA, NA)
  start <- head(id, n=1)
  end <- tail(id, n=1)
  for (i in seq(from=start, to=end, by=1)) {
    
    if (i >= 100) filler <- "" 
    if (i < 100) filler <- "0" 
    if (i < 10) filler <- "00"
    
    path <- as.character(paste(directory, "/", filler, i, ".csv", sep=""))
  
##    print(path)

    repfile <- read.csv(path)
    totframe <- rbind.data.frame(totframe, repfile)
        
  } 
   
  if (pollutant == "sulfate") poll <- 2
  if (pollutant == "nitrate") poll <- 3
  if (poll != 2 && poll != 3) poll <- "Error: Wrong Pollutant"
  subframe <- subset(totframe, is.na(totframe[poll]) == FALSE)

  result <- mean(as.numeric(subframe[[poll]]))  
  return(result)
  
}

## res <- pollutantmean("specdata", "nitrate", 119:123)
## print(res)