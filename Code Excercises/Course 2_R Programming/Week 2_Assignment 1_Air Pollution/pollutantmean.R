pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    data_directory <- paste(getwd(), directory, sep = "/")
    num_vector <- numeric()
    # print(class(num_vector))
    # print(typeof(num_vector))
    
    for(i in id) {
        
        if (i <= 9) {
            correct_id <- paste("00", i, sep = "")
        } else if ((i >= 10) & (i <= 99)) {
            correct_id <- paste("0", i, sep = "")
        } else if (i >= 100) {
            correct_id <- i
        }
        
        file_name <- paste(data_directory, correct_id, sep = "/")
        file_name_csv <- paste(file_name, "csv", sep = ".")
        # print(file_name_csv)
        con <- file(file_name_csv, "r")
        data <- as.matrix(read.csv(con))
        data2 <- data[, pollutant]
        not_na <- is.na(data2)
        data2_not_na <- data2[!not_na]
        data2_not_na_num <- as.numeric(data2_not_na)
        close(con)
        # print(data2_not_na_num)
        # print(class(data2_not_na_num))
        # print(typeof(data2_not_na_num))
        num_vector <- c(num_vector, data2_not_na_num)
        # print(num_vector)
        
    }
    
    num_vector_mean <- mean(num_vector)
    print(num_vector_mean)
    
}
