# thisdir = getwd()
# setwd("~/Desktop/Data Science/datasciencecoursera/week2/")


pollutantmean <- function(directory, pollutant="sulfate", id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  ## Initial set as sulfate
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  #Initial Variables
  mean_result <- c()
  
  # This is Building The Path to the Directory As Defined
  if(directory == "specdata"){
    directory <- "./specdata/"
  } else {
    directory <- paste("./",directory,"/",sep = "")
  }
  
  # This is Extracting All the CSV Files Then Building The Proper Path to Each CSV File
  pathfiles <- paste(directory, as.character( list.files(directory) ), sep="")
  
  # This is Reading Each File, Removing NA values, Then Storing The Result
  for(i in id) {
    this_file <- read.csv(pathfiles[i])
    na_removed <- this_file[!is.na(this_file[, pollutant]), pollutant]
    mean_result <- c(mean_result, na_removed)
  }
  
  # This Calculates the Mean then Rounds it 3 Decimal Places
  final <- round(mean(mean_result),3)
  return(final)
}