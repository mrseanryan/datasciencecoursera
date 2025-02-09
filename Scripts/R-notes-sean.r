# R notes by Sean

## Commands

example1 <- matrix(c(1,2,3,4,5,6,7,8), nrow = 4, ncol = 4)

#`getwd` - get Working Directory
getwd()

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
