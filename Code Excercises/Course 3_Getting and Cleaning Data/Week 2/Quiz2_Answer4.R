## Connect to website, read the HTML code, close connection
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)

## Number of characters in line 10, 20, 30, and 100, respectively
numbers <- c(10, 20, 30, 100)

for(number in numbers) {
    x <- nchar(htmlCode[number])
    print(x)
}
