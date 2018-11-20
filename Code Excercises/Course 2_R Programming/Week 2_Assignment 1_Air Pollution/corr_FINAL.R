corr <- function(directory, threshold = 0) {
    
    ## Get directory with the data files and store all the files names in "file_vector" variable.
    data_directory <- paste(getwd(), directory, sep = "/")
    file_vector <- dir(data_directory)
    
    ## Initate vector "corr_vector" to store corr values later on, then initiate count for later use.
    corr_vector <- vector(length = length(file_vector))
    count <- 1
    
    ## Use "complete()" function (from "complete_FINAL.R" file) to calculate counts of complete observation, then extract from matrix and convert vector.
    complete_counts <- as.matrix(complete(directory))
    complete_counts_vector <- unlist(complete_counts[,2])
    
    for(file_csv in file_vector) {
        
        nobs <- complete_counts_vector[count]
        sulf_vector <- vector(length = nobs)
        nitr_vector <- vector(length = nobs)
        
        con <- file(paste(data_directory, file_csv, sep = "/"), "r")
        data <- read.csv(con)[2:3]
        
        
        if(nobs > threshold) {
            sulf_nitr_count <- 1
            for(i in 1:length(data[,1])) {
                if(!is.na(data[i,1]) & !is.na(data[i,2])) {
                    sulf_vector[sulf_nitr_count] <- data[i,1]
                    nitr_vector[sulf_nitr_count] <- data[i,2]
                    sulf_nitr_count <- sulf_nitr_count + 1
                }
            }
            
        }

        corr_vector[count] <- cor(sulf_vector, nitr_vector)
        count <- count + 1
        
        close(con)
        
    }
    
    corr_vector_2 <- corr_vector[!is.na(corr_vector)]
    
}
