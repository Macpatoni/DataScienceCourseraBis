# PROGRAMMING ASSIGMENT 1: AIR POLLUTION
# PART 1
# User: Macpatoni
#
# Write a function named 'pollutantmean' that calculates the mean of a pollutant
# (sulfate or nitrate) across a specified list of monitors. The function 
# 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given
# a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate 
# matter data from the directory specified in the 'directory' argument and returns
# the mean of the pollutant across all of the monitors, ignoring any missing 
# values coded as NA. A prototype of the function is as follows

pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Get the full path of the specdata folder
  directory <- paste(getwd(),"/",directory,"/",sep="")
  
  # Aux variables
  file_list <- list.files(directory)
  data <- NA
  #For each id passed as parameter:
  for (i in id) {
      #Read the file,
      file_dir <- paste(directory,file_list[i],sep="")
      file_data <- read.csv(file_dir)
    
      # accumulate the data
      data <- rbind(data,file_data)
  }
  # Calculate the mean and return it
  mean(data[[pollutant]],na.rm = TRUE)
}

# >============== TEST SCENARIOS ==============<

prueba1 <- pollutantmean("specdata","sulfate",id=1:10) 
prueba1
#4.064
prueba2 <- pollutantmean("specdata","nitrate",id=70:72) 
prueba2
#1.706
prueba3 <- pollutantmean("specdata","nitrate",id=23) 
prueba3
#1.281