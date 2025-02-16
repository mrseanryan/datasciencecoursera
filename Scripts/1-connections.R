# Connections to files or network

# file
# gzfile - gzip
# bzfile - bzip2
# url - like curl

# in practice, connections are often already wrapped:
# data <- read.csv("foo.txt")
# already wraps:
# con <- file("foo.txt", "r")
# data <- read.csv(con)
# close(con)

# useful: read parts of a gzip'd text file:
# con <- gzfile("words.gz")
# x <- readlines(con, 10)
# x

# writeLines

# useful: read lines of webpages
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)
