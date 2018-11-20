corr <- function(directory, threshold = 0) {
    data_directory <- paste(getwd(), directory, sep = "/")
    file_vector <- dir(data_directory)
    # print(file_vector)
    corr_vector <- vector(length = length(file_vector))
    corr_vector_count <- 1
    
    for(file_csv in file_vector) {
        print(file_csv)
        
        con <- file(paste(data_directory, file_csv, sep = "/"), "r")
        data <- read.csv(con)[2:3]
        count <- 0
        for(i in 1:length(data[,1])) {
            if(!is.na(data[i,1]) & !is.na(data[i,2])) {
                count <- count + 1
            }
        }
        
        if(count > threshold) {
            sulfate_vector <- vector(length = count)
            nitrate_vector <- vector(length = count)
            sulfate_nitrate_count <- 1
            for(i in 1:length(data[,1])) {
                if(!is.na(data[i,1]) & !is.na(data[i,2])) {
                    sulfate_vector[sulfate_nitrate_count] <- data[i,1]
                    nitrate_vector[sulfate_nitrate_count] <- data[i,2]
                    sulfate_nitrate_count <- sulfate_nitrate_count + 1
                }
            }
        }
        
        corr_vector[corr_vector_count] <- cor(sulfate_vector, nitrate_vector)
        
        corr_vector_count <- corr_vector_count + 1
        
        # print(identical(length(na_data[,1]), length(na_data[,2])))
        # print(head(na_data[,1]))
        # print(head(sum(na_data)))
        # print(head(sum(na_data[1])))
        # no_na_data <- data[!na_data]
        # print(head(no_na_data))
        
        # data2 <- as.matrix(read.csv(con))
        # print(head(data2))
        # data3 <- data2[, 2:3]
        # print(head(data3))
        # na <- is.na(data3)
        # print(na)
        
        close(con)
        
    }
    
    corr_vector_2 <- corr_vector[corr_vector != 0]
    
}
