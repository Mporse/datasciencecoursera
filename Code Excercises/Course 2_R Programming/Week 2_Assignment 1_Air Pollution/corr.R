corr <- function(directory, threshold = 0) {
    data_directory <- paste(getwd(), directory, sep = "/")
    file_vector <- dir(data_directory)
    # print(file_vector)
    
    for(file_csv in file_vector) {
        # print(file_csv)
        
        con <- file(paste(data_directory, file_csv, sep = "/"), "r")
        data2 <- as.matrix(read.csv(con))
        data3 <- data2[, 2:3]
        # print(head(data3))
        na <- is.na(data3)
        print(na)
        
        close(con)
        
    }
    
}
