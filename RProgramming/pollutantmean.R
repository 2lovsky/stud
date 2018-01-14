setwd("F:/_Stud/Prog/RProgramming_crs/")
pollutantmean <- function(directory, pollutant, id = 1:332){
  dt <- c()
  pathDir <- paste(getwd(), directory, sep = "/")
  allFiles <- list.files(pathDir)
  for(i in id){
    file <- paste(pathDir, allFiles[i], sep = "/")
    df <- data.frame(read.csv(file), header = TRUE, sep = ",")
    dt <- rbind(dt,df)
  }
  out <- mean(dt[pollutant][!is.na(dt[pollutant])])
  out
}