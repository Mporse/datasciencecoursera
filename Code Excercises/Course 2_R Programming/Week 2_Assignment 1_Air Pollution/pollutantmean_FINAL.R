pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    ## Get directory with the data files and create empty numeric vector to store the "pollutant" numbers in from each data file.
    data_directory <- paste(getwd(), directory, sep = "/")
    num_vector <- numeric()
    
    ## "For" loop to carry out the main function of the program.
    for(i in id) {
        
        ## "If-else" loop to get the correct numbering scheme as written in the file names.
        if (i <= 9) {
            correct_id <- paste("00", i, sep = "")
        } else if ((i >= 10) & (i <= 99)) {
            correct_id <- paste("0", i, sep = "")
        } else if (i >= 100) {
            correct_id <- i
        }
        
        ## Get complete file path and file name (including ".csv" extension).
        file_name <- paste(data_directory, correct_id, sep = "/")
        file_name_csv <- paste(file_name, "csv", sep = ".")
        
        ## Open file, store file content in "data" variable, then isolate the "pollutant" column data and store in "data2" variable.
        con <- file(file_name_csv, "r")
        data <- as.matrix(read.csv(con))
        data2 <- data[, pollutant]
        
        ## Identify NA values in the data, extract non-NA values as numeric vector, then close connection to file.
        not_na <- !is.na(data2)
        data2_not_na <- data2[not_na]
        data2_not_na_num <- as.numeric(data2_not_na)
        close(con)
        
        ## Store non-NA pollution values in empty vector "num_vector" defined earlier.
        num_vector <- c(num_vector, data2_not_na_num)
    }
    
    ## Lastly, calculate the mean value for the "pollutant" data set.
    num_vector_mean <- mean(num_vector)
    
}
