library("sqldf")

if (!file.exists("quizw2_quest2")){ dir.create("quizw2_quest2")}

## Download file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(fileUrl, destfile = "./quizw2_quest2/acs.csv")

## Read downloaded file

acs <- read.csv("./quizw2_quest2/acs.csv", header = TRUE, sep = ",")

## Store desired output from the "sqldf" command in 2 variables
answer2 <- sqldf("select pwgtp1 from acs where AGEP < 50", drv = "SQLite")
print(head(answer2))

answer3 <- sqldf("select distinct AGEP from acs", drv = "SQLite")
print(head(answer3))