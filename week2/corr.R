corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  #Initial Variables
  result_corr <- c()
  
  # This is Building The Path to the Directory As Defined
  if(directory == "specdata"){
    directory <- "./specdata/"
  } else {
    directory <- paste("./",directory,"/",sep = "")
  }
  
  # This is Extracting All the CSV Files Then Building The Proper Path to Each CSV File
  pathfiles <- paste(directory, as.character( list.files(directory) ), sep="")
  
  # This grabs Complete Values, thens IDs where Nobs > Threshold
  complete_values <- complete("specdata", 1:332)
  complete_nobs <- complete_values$nobs
  
  final_ids <- complete_values$id[complete_nobs > threshold]
  
  # Loop over the IDs to find correlations
  x <- 1
  for(i in final_ids) {
    thisfile <- read.csv(pathfiles[i])
    result_corr[x] <- cor(thisfile$sulfate, thisfile$nitrate, use="complete.obs")
    x <- x + 1
  }
  
  return(result_corr)
}