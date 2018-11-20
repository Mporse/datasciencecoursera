complete <- function(directory, id = 1:332) {
    data_directory <- paste(getwd(), directory, sep = "/")
    
    list_1 <- list()
    
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
        
        x = 0
        
        con <- file(file_name_csv, "r")
        data2 <- as.matrix(read.csv(con))
        data3 <- data2[, 2:3]
        # print(data2)
        na <- is.na(data3)
        # print(na)
        
        y = length(na[,1])
        
        for (z in 1:y) {
            if ((na[z,1] == FALSE) && (na[z,2] == FALSE)) {
                x = x + 1
            }
        }
        
        close(con)
        # print(x)
        
        list_1 <- c(list_1, i)
        list_1 <- c(list_1, x)
    }
    
    matrix_final <- matrix(data = list_1, ncol = 2, byrow = TRUE)
    colnames(matrix_final) <- c("id", "nobs")
    dataframe_final <- as.data.frame(matrix_final)
    
}
