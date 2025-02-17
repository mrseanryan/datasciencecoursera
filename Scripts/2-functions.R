sum2 <- function(x, y) {
    x + y
}

formals(sum2)

mydata <- rnorm(100)
formals(sd)
sd(mydata) # sd = Standard Deviation
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

args(lm) # lm = linear regression
lm(data = pressure, pressure ~ temperature, model = FALSE, 1:100)
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17, 5.58, 5.18, 6.11, 4.50, 4.61, 5.17, 4.53, 5.33, 5.14)
trt <- c(4.81, 4.17, 4.41, 3.59, 5.87, 3.83, 6.03, 4.89, 4.32, 4.69)
group <- gl(2, 10, 20, labels = c("Ctl", "Trt"))
weight <- c(ctl, trt)
lm(weight ~ group)

# args notes/warnings!
# ====================
# args can also be partially matched (!) - fuzzy matching the arg name.
# args are evaluated lazily (so is OK to have a missing, non-used arg)
# note: args after ... must be explicitly named, and cannot be partially matched (this is NOT automatically checked) [bad language design?]

f <- function(a, b = 1, c = 2, d = NULL) {
    a^b + c
}

f2 <- function(aardvark, never) {
    aardvark^2
}
f2(a = 123) # fuzzy matches aardvark, ignores never

# variable arguments ... -> can pass on to another function
f_outer <- function(x, y, ...) {
    f_other(x, y, ...)
}
# ... is also used for generic functions (dispatch by data type?)


# Rewriting to prefix form
#
# An interesting property of R is that every infix, replacement, or special form can be rewritten in prefix form.
# ref - https://adv-r.hadley.nz/functions.html

x <- c(1, 2, 3)
y <- c(10, 20, 30)

x + y
`+`(x, y)

df <- data.frame(foo = 1:4, bar = c(TRUE, TRUE, FALSE, FALSE))

names(df) <- c("x", "y")
`names<-`(df, c("x", "y"))

for (i in 1:5) print(i)
`for`(i, 1:5, print(i))

decorate <- function(func, dat){
  print(paste("decorating func", as.character(substitute(func))))

  print(dat)
  func(dat)
}
decorate(sum, c(1,2,3))

# Custom binary operator
"%p%" <- function(...){ # Remember to add arguments!
  paste(...)
}
"I" %p% "like" %p% "icecream"
