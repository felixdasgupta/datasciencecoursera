# thisdir = getwd()
# setwd("~/Desktop/Data Science/datasciencecoursera/week2/")

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #Initial Variables
  result_complete <- c()
  
  # This is Building The Path to the Directory As Defined
  if(directory == "specdata"){
    directory <- "./specdata/"
  } else {
    directory <- paste("./",directory,"/",sep = "")
  }
  
  # This is Extracting All the CSV Files Then Building The Proper Path to Each CSV File
  pathfiles <- paste(directory, as.character( list.files(directory) ), sep="")
  
  # This builds the array of Complete Data
  x <- 1
  for (i in id) {
    this_file <- read.csv(pathfiles[i])
    result_complete[x] <- sum(complete.cases(this_file))
    x <- x + 1
  }
  
  # Returns as Intended Datframe
  return(data.frame(id = id, nobs = result_complete))
}