# R notes by Sean

## Commands

example1 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8), nrow = 3, ncol = 4)
print(example1)
attributes(example1)

# get/set working directory
getwd()
setwd("temp")
dir() # alias for list.files()

# file operations
file.create("myfile.R")
file.exists("myfile.R")
file.info("myfile.R")
file.info("mytest.R")$mode # get just the 'mode' column
file.rename("mytest.R", "mytest2.R")
file.remove("x.R")
file.copy("1.r", "1-copy.r")
file.path("x.R") # get the relative path
file.path("folder1", "folder2") # combine paths in an OS-neutral way
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE) # create testdir2/testdir3

# list objects (variables)
ls()

# vector operations
my_seq <- 1:10
length(my_seq)
rep(0, times = 40) # repeat 0 x 40 times
rep(c(0, 1, 2), times = 10) # repeat 0,1,2 x 10 times
rep(c(0, 1, 2), each = 10) # repeat 0 x 10, then 1 x 10, then 2 x 10
my_char <- c("My", "name", "is")
c(my_char, "sean") # Concatenate

# help
?ls # show help page for ls
args(list.files) # list args of a function
?`:` # show help for the operator :

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
plot(pressure)

?presidents
head(presidents)

?cars
summary(cars)

?Titanic
summary(Titanic)
head(Titanic)

# assignment x <- y

x <- 1 # x is an R object with one element [1]
print("x <- 1")
print(x)
x
z <- y <- x
print(paste("x", x, ", y", y, ", z", z))

x <- 1:20 # range 1..20 inclusive
print(paste("x", x))
paste("Hello", "world!", sep = " ") # sep is between terms (items)
print(paste(c("My", "name", "is"), collapse = " ")) # collapse is between vectors (after sep applied)
paste(1:3, c("X", "Y", "Z"), sep = "_", collapse = "-") # [1] "1_X-2_Y-3_Z"

paste(LETTERS, 1:length(LETTERS), sep = "-") # [1] "A-1"  "B-2"  "C-3"  "D-4"  "E-5"  "F-6"  "G-7"  "H-8"  "I-9"  "J-10" "K-11" "L-12" "M-13" "N-14" "O-15" "P-16" "Q-17" "R-18" "S-19" "T-20" "U-21" "V-22"
# [23] "W-23" "X-24" "Y-25" "Z-26"

pi:10 # range pi .. 9.14... (just below 10)
15:1 # range 15,14,13 .. 1 inclusive
seq(0, 10, by = 0.5) # range 0,0.5,1,1.5 ..., 10 inclusive
seq(5, 10, length = 30) # any 30 numbers between 5, 10 inclusive

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
getRandomsPlusX(4:10) # range 4..10 inclusive

?rnorm

sample(c(y, z), 100) # sample 100 items from concatenated y,z.

# graphics
par() # get or set graphics settings
