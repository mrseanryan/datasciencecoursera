source("Scripts/utils.print.R")

print_section("str() and summary()")

# str() - outputs roughly 1 line per basic object
# nice summaries, of pretty much anything

str(str)
str(lm)
str(ls)

x <- rnorm(100, 2, 4)
summary(x)
str(x)

f <- gl(40, 10)
summary(f)
str(f)

head(airquality)
str(airquality)
summary(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m)
summary(m)

s <- split(airquality, airquality$Month)
str(s)
summary(s)

print_section("Simulation")

# Probability distribution functions usually have 4 functions.
# prefixes:
# d for Density
# p for cumulative distribution
# q for Quantile
# r for Random number generation

# Normal distribution:
#
# dnorm() - evaluate the normal probabilty Density at a point (or vector of points)
# pnorm() - evaluate cumulative distribution function for a normal distribution
#         - pnorm(q) = phi(q) where phi = cumulative distribution function.
# qnorm() - Quantile of normal distribution.
#         - qnorm(q) = phi^-1(q) [inverse of phi]
# rnorm() - generate Random Normal variates
rnorm(100, mean = 0, sd = 1)
dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(x, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) # lower.tail - tail on the left. (if false -> tail at right).
qnorm(x, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) # log.p logarithmic distribution.

# Poisson distribution:
# rpois() - generate Random Poisson variates with a given rate

# Gamma distribution:
# rgamma() - generate Random Gamma variates

# Exponential distribution
#rexp() - generate Random Exponential variates

print("Set seed so is reproducible")
set.seed(42)
rnorm(5) # series 1
rnorm(5) # series 2
set.seed(42) # resets 'random' number generator
rnorm(5) # series 1

rpois(10, 1)
rpois(10, 2)
rpois(10, 20)

ppois(2, 2) # cumulative distribution -> Probabilty(x<=2) if rate=2
ppois(4, 2) # cumulative distribution -> Probabilty(x<=4) if rate=2
ppois(6, 2) # cumulative distribution -> Probabilty(x<=6) if rate=2

print_section("Simulating a Linear Model")

print("Generating Random Numbers from a Linear Model")

print("To simulate linear model: y = b0 + b1 + e")
b0 <- 0.5
b1 <- 2
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, mean = 0, sd = 2)

y <- b0 + b1 * x + e
summary(y)
plot(x, y, main="normal distribution")

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
y

print("x is binomial (binary) instead of normal distribution")
set.seed(10)
x <- rbinom(100, size=1, prob=0.5)
e <- rnorm(100, mean = 0, sd=2)
y <- b0 + b1 * x + e
summary(y)
plot(x, y, main="binomial (binary) distribution")

print("Posson model - y ~ Poisson(u)")
set.seed(1)
x <- rnorm(100)
b0 <- 0.5
b1 <- 0.3
log.mu <- b0 + b1 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y, main="Poisson distribution")

print_section("Random Sampling")
print("Draw a random sample from a set of (scalar) objects")
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10) # permutation
sample(1:10)
sample(1:10, replace = TRUE) # sample with replacement (can repeat)
