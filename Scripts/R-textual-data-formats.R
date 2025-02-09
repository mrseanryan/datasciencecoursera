# Textual data formats in R

# dump()
# dput()

# dumps in machine-readable ASCII format
# - DOES preserve metadata (class of each column in a data frame...)
# - can be easier to diff, merge etc.
#   or edit if corrupted(!)
# - unix phil - 'all data is text'
# - but not efficient vs binary

y <- data.frame(a=1, b="a")
dput(y)
dput(y, file="Data/y.data.R")
new.y <- dget(file="Data/y.data.R")
new.y

# dump() - more powerful, can be multiple objects
x <- "foo"
y <- data.frame(a=1, b="a")
dump(c("x", "y"), file = "Data/x_y.data.R")
rm(x,y)
source("Data/x_y.data.R")
x
y
