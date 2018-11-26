library(httr)
library(jsonlite)

## 1. Find OAuth settings for github:
##    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

## 2. To make your own application, register at 
##    https://github.com/settings/developers. Use any URL for the homepage URL
##    (http://github.com is fine) and  http://localhost:1410 as the callback url
##
##    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "f0d8a197308058042da7",
                   secret = "2b787ce85e76da7982b9a3153d3c89cbbe95f2a5")

## 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

## 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
req_content <- content(req)

## 5. Store request data in JSON format
# jsonData <- toJSON(req_content, pretty=TRUE)
# jsonData2 <- fromJSON(jsonData)

## 6. Locate and find the creation date for the datasharing repository, then print date
loc <- which(jsonData2$name == "datasharing")
date <- jsonData2$created_at[[loc]]

print(date)