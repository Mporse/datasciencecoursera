complete <- function(directory, id = 1:332) {
    
    ## Get directory with the data files and create an empty list to store the relevant data in.
    data_directory <- paste(getwd(), directory, sep = "/")
    list_1 <- list()
    
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
        
        ## Initiate "x" variable for counting purposes later on in the code.
        x = 0
        
        ## Open file, store file content in "data2" variable, then store "sulfate" and "nitrate" coloumn data in "data3" variable.
        con <- file(file_name_csv, "r")
        data2 <- as.matrix(read.csv(con))
        data3 <- data2[, 2:3]
        
        ## Determine the NA values and store in "na" variable.
        na <- is.na(data3)
        
        ## Determine length of "na" variable for later use in "For" loop.
        y = length(na[,1])
        
        ## Loop through the length of "na" variable, add 1 to x for every NA value. End result is 
        for (z in 1:y) {
            if ((na[z,1] == FALSE) && (na[z,2] == FALSE)) {
                x = x + 1
            }
        }
        
        ## Close connection to data file.
        close(con)
        
        ## Add "id" and "number of observations" / "nobs" to "list_1", alternating.
        list_1 <- c(list_1, i)
        list_1 <- c(list_1, x)
    }
    
    ## Create matrix from "list_1", assign names to coloumns, then finally convert matrix to data frame.
    matrix_final <- matrix(data = list_1, ncol = 2, byrow = TRUE)
    colnames(matrix_final) <- c("id", "nobs")
    dataframe_final <- as.data.frame(matrix_final)
    
}
