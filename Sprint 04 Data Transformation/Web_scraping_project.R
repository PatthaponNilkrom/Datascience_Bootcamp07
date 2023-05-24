# R Project: Web scraping
library(rvest)
library(tidyverse)

# IMDB
url <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

movie_name <- url %>% 
  read_html() %>%
  html_elements("h3.lister-item-header") %>%
  html_text2()

rating_score <- url %>% 
  read_html() %>%
  html_elements("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

df <- data.frame(movie_name,rating_score)
view(df)

# Static website: Specphone
url2 <- "https://specphone.com/Samsung-Galaxy-S23-Ultra-5G.html"
topic_s23u <- url2 %>% 
  read_html() %>%
  html_elements("div.topic") %>%
  html_text2()

detail_s23u <- url2 %>% 
  read_html() %>%
  html_elements("div.detail") %>%
  html_text2()

df <- data.frame(topic_s23u,detail_s23u)
view(df)
