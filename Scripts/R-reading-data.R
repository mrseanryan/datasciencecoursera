print("Reading data - tables")

# most used:
# ----------
# read.table()
# read.csv()

# others:
# -------
# readLines()
# source() # read in R file - inverse of dump()
# dget() # read in ascii dump (R files) of an R object - inverse of dump() or dput()
# dput() # write machine-readable ASCII dump of an R object - but dump(), save(), saveRDS() are better
# load() # load a saved R workspace
# unserialize() # de-serialize a single R object in binary form

print("Writing data - tables")
# write.table
# writeLines
# dump
# dput
# save
# serialize

path_to_words <- "Data/loan-words-short.txt"
data1 <- read.table(path_to_words, sep = ",", quote="\"")
# R will skip lines that start with #
# R will figure out row count, column types
# - BUT an optimization can be to set those explicitly - colClasses argument
# read.csv is actually same, except separator = ','
data1 <- read.csv("Data/loan-words-short.txt")
data1

# reading in larger datasets with read.table
# - MUST fit in RAM
# - see ?read.table for tips
# - try set comment.char = "" if not commented lines in the file
# - try set colClasses argument [can be 2X faster]
#
# code to auto-detect column types, only using first N rows:
initial <- read.table(path_to_words, nrows = 100, sep = ",", quote="\"")
classes <- sapply(initial, class)
classes
tabAll <- read.table(path_to_words, colClasses = classes, nrows = 100, sep = ",", quote="\"")
# - try set nrows - can help with memory management (you can use unix 'wc' to count rows)

# to calc RAM - a numeric takes 8 bytes (64 bit)
# 2^20 bytes/MB
r_factor = 2 # need 2X RAM to read via R (!)
bytes_per_mb = 2^20
print(paste(bytes_per_mb, "bytes/MB"))
x_rows <- 1500000
x_cols <- 120
x_bytes_per_col <- 8
x_ram_mb = round(x_rows * x_cols * x_bytes_per_col / bytes_per_mb * r_factor)
print(paste("RAM needed:", x_ram_mb, "MB"))
mb_per_gb = 2^10
print(paste("RAM needed:",round(x_ram_mb / mb_per_gb, 2), "GB"))
