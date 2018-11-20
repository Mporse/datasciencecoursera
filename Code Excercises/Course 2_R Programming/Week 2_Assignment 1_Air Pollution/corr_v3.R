corr <- function(directory, threshold = 0) {
    data_directory <- paste(getwd(), directory, sep = "/")
    file_vector <- dir(data_directory)
    # print(file_vector)
    corr_vector <- vector(length = length(file_vector))
    count <- 1
    
    complete_counts <- as.matrix(complete(directory))
    complete_counts_vector <- unlist(complete_counts[,2])
    # nobs <- complete_counts_vector[count]
    # sulf_vector <- vector(length = nobs)
    # nitr_vector <- vector(length = nobs)
    
    for(file_csv in file_vector) {
        # print(file_csv)
        
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
