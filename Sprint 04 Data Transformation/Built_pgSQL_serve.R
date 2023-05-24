# R Project: connect PostgreSQL server
library(RPostgreSQL)
library(dplyr)
# connect database
con <- dbConnect(PostgreSQL(), 
          host = "floppy",
          port = 5432,
          user = "user",
          pass = "pass",
          dbname = "name")
dbListTables(con)

# write table
dbWriteTable(con, "cars", mtcars %>% slice(1:5))

# list table
dbListTables(con)

# get query
dbGetQuery(con, "select count(*) from cars")
dbGetQuery(con, "select * from cars")

# disconnect
dbDisconnect(con)
