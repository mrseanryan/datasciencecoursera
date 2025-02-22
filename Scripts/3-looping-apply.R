source("Scripts/utils.print.R")

print_section("R looking - apply")

# variants of 'applying a function':
# lapply - apply to elements of a List
# sapply - like lapply but try to Simplify the result
# apply - apply over the margins of an array
# tapply - (Table)apply over the subsets of a vector
# mapply - Multivariate version of lapply

# split - splitting

print_section("lapply (List apply)")
str(lapply)
x <- list(a = 1:5, b = rnorm(10))
print("apply mean() to the elements of x")
lapply(x, mean)

x <- 1:4
lapply(x, runif) # apply runif(count of variables to generate) - random number generator
lapply(x, runif, min = 0, max = 10) # passes min, max to runif()

print("lapply with anonymous function")
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x

lapply(x, function(elt) elt[, 1]) # anonymous function: elt = extract first column of a matrix

print_section("sapply (Simplify)")
# sapply() returns:
# list of length-1 elements -> vector
# list where every element is same length (and same type?) -> a vector
# else a list
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean) # returns a list
sapply(x, mean) # returns a vector (simpler)

print_section("apply")
# apply over the margins of an array
#   - rows or columns of a matrix
#   - performance is same but less code
str(apply)
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) # MARGIN = 2 - the columns -> returns vector of 10 elements (bit like 'group by' mean)
apply(x, 1, sum) # MARGIN = 1 - the rows -> returns vector of 20 elements (bit like 'group by' sum)

print("short-cut functions that ARE faster than apply()")
# rowSums = apply(x, 1, sum)
# rowMeans = apply(x, 1, mean)
# colSums = apply(x, 2, sum)
# colMeans = apply(x, 2, mean)

print("Quantiles of the rows of a matrix")
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

print("average matrix in an array")
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean) # 1 = by-row, 2 = the 2nd row. collapses 3rd dimension -> 2 dimensions.

rowMeans(a, dims = 2) # collapses 3rd dimension -> 2 dimensions.

print_section("mapply - Multivariate apply")
str(mapply)
# apply a function in parallel over the arguments.
# Simplifies by default
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1)) # rep = repeat
# same as:
mapply(rep, 1:4, 4:1)

print("vectorizing a function")
noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}
noise(5, 1, 2)
mapply(noise, 1:5, 1:5, 2)

print_section("tapply (Table apply) - over subsets of a vector")
str(tapply)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
x
str(gl)
f <- gl(3, 10) # gl - generate factors -> 10 x 1s, 10 x 2s, 10 x 3s
# factor: if f (factor) has 3 levels -> 3 groups
f
tapply(X = x, INDEX = f, FUN = mean) # using f as in index on x, apply mean
tapply(X = x, INDEX = f, FUN = mean, simplify = FALSE)
tapply(x, f, range) # range: min/max for each subset of x

print_section("split - splits a vector according to a factor or list of factors")
str(split)
# like tapply() but without applying the summary statistics (e.g. does not summarize via mean)
# factor: if f (factor) has 3 levels -> 3 groups
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
split(x, f)
print("split followed by lapply")
lapply(split(x, f), mean)

head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
print("Simplify and remove NAs")
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

print("splitting on multiple levels (factors could be race, gender)")
x <- rnorm(10)
f1 <- gl(2,5)
f1
f2 <- gl(5,2)
f2
str(interaction)
interaction(f1, f2) # generates 'combinations' of the factors. e.g. gender, race.

race <- factor(c("white", "black", "asian", "other"))
gender <- factor(c("male", "female"))
interaction(race, gender)

str(split(x, list(f1, f2)))  # implicitly calls interaction(), WITH empty levels.
str(split(x, list(f1, f2), drop=TRUE))  # drop empty levels.
