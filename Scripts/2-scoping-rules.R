print_section <- function(message) {
    separator <- "=== === ==="

    print_line <- function() {
        print(paste(separator, separator, separator))
    }

    print_line()
    print(paste(separator, message, separator))
    print_line()
}

print_section("R scoping rules")

# When trying to bind a value to a symbol, R searches through a series of 'environments' (scopes?).
# - environment = a colletion of (symbol, value) pairs
# - each environment has a parent environment
# - function + an environment = a closure or function closure
search() # lists teh environments in order
# global is first = your workspace (a bit like local scope)
# first-match wins
# can decide the order, by calling `library` in reverse order (calling library puts that package in position 2, after global)
#
# separate namespaces for functions and non-functions (!)
# so can have a 'c' vector and a 'c' function (but only 1 in-scope at a time).
c3 <- 3
c3 <- function(x) {
    x^2
}

c3(2)
print(c3)

# R uses lexical (static) scoping
# - this helps to simplify statistical computations

z <- 2
f <- function(x, y) {
    x^2 + y / z # z is a 'free variable' - from outside of the function. (like a JavaScript closure)
    # can define function in a function
    # a function can return a function -> so its environment is the inside of the creating function (like a JavaScript closure)
}

# Resolving (binding) a free variable:
# - search in the environment of the function
# - search the parent environment
#   - search down until reach the top-level environment (usually either global==the workspace or else the namespace of a package).
#   - after the top-level environment, search down the seach list until hit the empty environment
#   - empty environment (it never has a parent) -> throw an error

make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}
square <- make.power(2)
cube <- make.power(3)

square(2)
cube(3)

ls(environment(cube))
get("n", environment(cube))
environmentName(environment(make.power))
environmentName(environment(cube))

# Lexical NOT dyamic scoping
y <- 10
f <- function(x) {
    y <- 2 # y is set in this function
    y^2 + g(x) # g is a free variable
}

g <- function(x) {
    x * y # y is a free variable - from parent environment
}

f(3) # 34 <- 4 + 3 * 10

# R Lexical Scoping is similar in Scheme, Perl, Python, Common List (all programming languages converge to Lisp!)

# consequences of Lexical scoping:
# - ALL objects must be stored in RAM
# all functions must carry a pointer to its defining environment (can be to almost anywhere)

print_section("Optimization")
# optimization (R: minimization) functions - e.g. to minimize cost
# optim, nlm, optimize - arg is a vector of params (e.g. a log-likelihood)
# - goal: allow user to fix certain parameters

print("Maximizing a Normal likelihood")

make.NegLogLik <- function(data, fixed = c(FALSE, FALSE)) {
    params <- fixed
    function(p) {
        params[!fixed] <- p
        mu <- params[1]
        sigma <- params[2]
        a <- -0.5 * length(data) * log(2 * pi * sigma^2)
        b <- -0.5 * sum((data - mu)^2) / (sigma^2)
        -(a + b)
    }
}

set.seed(1)
normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals)

nLL
ls(environment(nLL))

optim(c(c(0, 1)), nLL)$par

optim(c(mu = 0, sigma = 1), nLL)$par

# fixing sigma
nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum

# fixing mu
nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum

print("Plot the likelihood")
nLL <- make.NegLogLik(normals, c(1, FALSE)) # mu=1
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

nLL <- make.NegLogLik(normals, c(FALSE, 2)) # sigma=2
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")
