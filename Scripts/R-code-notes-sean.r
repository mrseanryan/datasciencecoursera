# R notes by Sean

## Commands

example1 <- matrix(c(1,2,3,4,5,6,7,8), nrow = 3, ncol = 4)
print(example1)
attributes(example1)

#`getwd` - get Working Directory
getwd()
dir()

# the built-in datasets
data()
iris
mtcars

# ?<dataset> shows a 'wiki' doc about that dataset.
?iris
nrow(iris)
ncol(iris)
head(iris)

# summary() is a bit like pandas describe()
summary(iris)

?pressure
summary(pressure)
head(pressure)
plt(pressure)

?presidents
head(presidents)

?cars
summary(cars)

?Titanic
summary(Titanic)
head(Titanic)

# assignment x <- y

x <- 1  # x is an R object with one element [1]
print("x <- 1")
print(x)
x
z <- y <- x
print(paste("x",x,", y",y, ", z", z))

x <- 1:20  # range 1..20 inclusive
print(paste("x", x))

# functions

getMeanOfNRandoms <- function(n) {
  print(paste("Getting mean of", n, "random observations (normal distribution)"))
  x <- rnorm(n) # n random observations (normal distribution)
  mean(x)
}

getRandomsPlusX <- function(x) {
  print(paste("Getting", length(x), "random observations (normal distribution) +", x))
  x + rnorm(length(x))
}

getMeanOfNRandoms(10)
getRandomsPlusX(3)
getRandomsPlusX(4:10)  # range 4..10 inclusive

?rnorm
