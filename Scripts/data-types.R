# R data types - Objects

# atomic classes
# - character
# - numeric (real numbers, double precision)
# - integer
# - complex
# - logical (boolean True/False)

# vector can contain objects of ONE class
# list - can contain mix of classes
v_empty = vector()
print(paste("v_empty", v_empty))
attributes(v_empty)
print(paste(1, 1L, Inf, NaN))  # default is 'numeric', 1L is 'integer'
class(1)
class(1L)

print(1/0)
print(1/Inf)

c1 = complex(real=2,imaginary=3)
print(c1)
attributes(c1)
attr(c1,'a-1') <- 1:3
attributes(c1)
print("sqrt of -1")
print(sqrt(as.complex(-1)))

print("Creating vectors")
print(c(0.5, 0.6))
print(c(TRUE, FALSE))
print(c(T, F))
print(c("a","b","c"))
print(9:29)
print(c(1+0i, 2+4i))
print(vector("numeric", length=10))

print("vectors with mixed types - implicit coercion occurs")
print(c(1.7, "a"))
print(c(TRUE, 2))
print(c(FALSE, 3))
print(c("a", TRUE))
print(c(NaN, 2, Inf))
print(class(NaN))
print(class(Inf))

print("explicit coercion")
x <- -2:6
print(x)
print(paste("class of x:", class(x)))
print(class(as.numeric(x)))
print(class(as.character(x)))
print(class(as.logical(x)))
print(as.logical(x))

# In R, missing values are represented by the symbol NA (not available).
# Impossible values (e.g., dividing by zero) are represented by the symbol NaN
# (not a number).
print("nonsensical coercion results in NAs")
print(as.numeric(c("a","b","c")))
as.complex(c("a","b","c"))

print("lists can have mix of objects")
l1 <- list(1, "a", TRUE, 1+4i)
l1
l1[0] # slicing to an empty list
l1[1] # slicing to 1st
l1[2] # slicing to 2nd
l1[2:3] # slicing to 2nd, 3rd

print("matrices via matrix() - a special type of vector, with attribute 'dimension'")
m <- matrix(1:6, nrow = 2, ncol = 3) # populated column-wise
m
dim(m)

print("alt: create a matrix directly from vector, by adding a dimension attribute")
m <- 1:10
dim(m) <- c(2, 5)
m

print("alt: create a matrix via column-binding or row-binding")
x <- 1:3
y <- 10:12
cbind(x, y) # column-wise (x then y)
rbind(x,y) # row-wise (x then y)

print("Factors - labelled integer vector - for categorical data")
# a bit like an enumeration
?lm # - fit linear models
?glm() # - fit generalized linear models

x <- factor(c("yes","yes","no","yes","no"))
table(x) # gives frequency counts of each level (each label)
unclass(x)
as.logical( unclass(x) - 1 )

print("use levels to set order of the levels - default is alphabetical")
x <- factor(c("yes","yes","no","yes","no"), levels=c("yes", "no"))
x
unclass(x)
as.logical( unclass(x) - 1 )

print("NA (not avaiable) and NaN (Not a Number)")
is.na(sqrt(-1))
is.na(NA)
is.na(NaN) # NaN is NA, but not vice-versa
is.nan(NA)
is.nan(NaN)

x <- c(1,2,NA, 10, 3)
x
is.na(x)
is.nan(x)
x <- c(1,2,NaN, NA, 4)
is.na(x)
is.nan(x)

print("Data Frames")
# - special type of list - each element of the list must have same length (row count)
# - each element of the list is like a column
# - DF can store different classes of objects in each column (just like lists)
# - special attribute - row.names
# created via read.table() or read.csv()
# convert to matrix via data.matrix() - can trigger coercion
# built-in examples
class(iris)
head(data.matrix(iris))
attributes(iris)

df1 <- data.frame(foo=1:4, bar=c(T,T,F,F))
df1
nrow(df1) # count rows
ncol(df1) # count columns
attributes(df1)
data.matrix(df1)

head(x,2) # first 2 rows
tail(x,2) # last 2 rows

print("Names - R objects can have names -> self-describing objects")
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
names(x)
x

print("List with names")
x <- list(a=1, b=2, c=3)
x
names(x)

print("matrix with names")
m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a", "b"), c("c","d"))  # columns, then rows
m
dimnames(m)
