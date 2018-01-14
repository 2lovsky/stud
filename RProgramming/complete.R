setwd("F:/_Stud/Prog/RProgramming_crs/")
complete <- function(directory, id = 1:332){
  pathDir <- paste(getwd(), directory, sep = "/")
  allFiles <- list.files(pathDir)
  dt <- c()
  for(i in id){
    file <- paste(pathDir, allFiles[i], sep = "/")
    df <- data.frame(read.csv(file), header = TRUE, sep = ",")
    len <- length(df["Date"][(!is.na(df["sulfate"]))&(!is.na(df["nitrate"]))])
    dti <- data.frame(cbind(i,len))
    colnames(dti) <- c("id", "nobs")
    dt <- rbind(dt,dti)
  }
  dt
}