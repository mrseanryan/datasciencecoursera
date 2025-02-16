print("R scoping rules")

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
c <- 3
c <- function(x) {
    x^2
}

c(2)
print(c)

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

# similar in Scheme, Perl, Python, Common List (all programming languages converge to Lisp!)

# consequences of Lexical scoping:
# - ALL objects must be stored in RAM
# all functions must carry a pointer to its defining environment (can be to almost anywhere)
