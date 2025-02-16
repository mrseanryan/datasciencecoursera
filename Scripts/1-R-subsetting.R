# Subsetting - extracting subsets of R objects

# [ always returns an object of the same class. can be used to select multiple elements.
# [[ extract elements of a list of a data frame. only 1 element. class can be something else, not a list or data frame.
# $ extract elements of a list of data frame, by name. semantics similar to [[

x <- c("a", "b","c")
x[1] # numeric index
x[2] # numeric index
x[2:3] # numeric index

x[x > "a"] # filter, via logical index

u_logical_vector <- x > "a"
u_logical_vector
x[u_logical_vector]

# Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]

#x$foo
x$foo

#x$bar
x$bar # numeric
class(x$bar)

#x[["bar"]]
x[["bar"]] # numeric
class(x[["bar"]])

# x["bar"]
x["bar"] # list
class(x["bar"])

x[c(1,2)] # a list with elements index: 1, 2

# [[ with a computed index - but $ can only be used with literal names.
x <- list(foo=1.4, bar=0.6, baz="hello")
name <- "foo"
x[[name]] # computed index for 'foo'
x$name # element 'name' does not exist!
x$foo # element 'foo' DOES exist

# [[ can take an integer sequence
x <- list(a = list(10,12,14), b=c(3.14, 2.81))
x[[c(1,3)]]  # -> 14
x[[1]][[2]]  # -> 12

x[[c(2,1)]]# 3.14

# Subsetting Matrices
x <- matrix(1:6, 2, 3)
x
x[1,2] # element at 1st row, 2nd column - [ but returns element NOT a matrix!
class(x[1,2])  # integer (not matrix)
x[1,] # 1st row
class(x[1,]) # vector (integer)
class(x[1,, drop=FALSE]) # matrix

x[,2] # 2nd col

x[1, 2, drop=FALSE] # drop = FALSE -> returns a matrix, does NOT drop the dimension
class(x[1,2, drop=FALSE])  # matrix

# Partial Matching
## - Subsetting with names

x <- list(aardvark = 1:5)
x$aardvark
x$a  # partially matches to aardvark

x[["a"]]  # does NOT partially match
x[["a", exact = FALSE]]  # DOES partially match

# Subsetting R objects - removing missing values (NA (or NaN))
is.na(NaN)

x <- c(1,2,NA, 4, NA, 5, NaN)
x
bad <- is.na(x)  # logical vector, of where are the missing elements of x
bad
x[!bad] # filter x by index vector 'bad'

# removing NA from multiple vectors
x <- c(1,2,NA, 4, NA, 5)
y <- c("a","b",NA,"d",NA, NA)
good <- complete.cases(x, y)  # is non-missing for BOTH x, y
good
x[good]
y[good]

airquality[1:6,]
good <- complete.cases(airquality)
airquality[good,][1:6,]
plot(airquality)

# counting how many bad values a column has
# bad <- is.na(x$Ozone)
# bad_count <- sum(as.numeric(bad))

# mean of the good values
# mean(x$Ozone[!bad])

# drop all NA (bit like pandas df.dropna())
# x_good = na.omit(x)
# x_good = x[!is.na(x)] # alt way

# filter by 2 columns, logical index:
# both = x_good$Temp > 90 & x_good$Ozone > 31
# x_good[both,]

# mean of a column:
# mean(x$Solar.R)

# ===

x[!is.na(x) & x > 0] # x where is not NA (not 'missing') and is positive.
x[c(3,5,7)] # get the 3rd, 5th, 7th elements of x.
x[c(-2, -5)] # get all x, except for 2nd, 5th elements.
x[-c(2, 5)] # get all x, except for 2nd, 5th elements.

# out of bounds
x[0] # 0 - not NA :-(
x[10000] # NA
c(foo=11, bar=2) # named elements 'foo', 'bar'
names(vect) # [1] "foo"  "bar"   # get the names
names(vect) <- c("foo2", "bar2") # set the names
vect["bar"] # bar\n  2
vect[c("foo", "bar")]  # foo bar\n  11 2
