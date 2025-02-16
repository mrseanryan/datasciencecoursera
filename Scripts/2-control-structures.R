print("Control structures in R")

x <- 3

print("if/else")
if (x >= 0) {
    print("X is +v1")
} else if (x < 0) {
    print("x is -ve")
}

y <- if (x >= 0) {
    TRUE
} else {
    FALSE
}

print("for loop")
for (i in 1:10) {
    print(i)
}

print("while loop")
count <- 0
while (count < 10) {
    print(count)
    count <- count + 1
}

z <- 5
steps <- 0
while (z >= 3 && z <= 10 && steps < 10) {
    print(z)
    coin <- rbinom(1, 1, 0.5) # binomial distribution, 0.5 'successes' in 1 trials.
    # random walk:
    if (coin == 1) {
        z <- z + 1
    } else {
        z <- z - 1
    }
    steps <- steps + 1
}

print("repeat, next, break")
x0 <- 1
tolerance <- 1e-8

computeEstimate <- function() {
    return(rbinom(1, 1, 0.5)) # return() is optional, can be used for early exit
}

steps <- 0
repeat {
    x1 <- computeEstimate()
    if (abs(x1 - x0) < tolerance) {
        break
    } else {
        x0 <- x1
    }
    steps <- steps + 1
    if (steps > 100) {
        break
    }
}
print(paste(("x0"), x0, "steps", steps))

for (i in 1:40) {
    if (i <= 20) {
        next # like continue
    }
    print(i)
}

print("functions")

above10 <- function(x) {
    filter <- x > 10
    x[filter]
}

above <- function(x, n) {
    filter <- x>n
    x[filter]
}

x <- 1:15
print("x")
print(x)
print("x > 10")
print(above10(x))

print("x > 13")
print(above(x, 13))

column_mean <- function(y) {
    nc <- ncol(y)
    means <- numeric(nc)  # creates a numeric vector, length nc
    for (i in 1:nc) {
        means[i] <- mean(y[,i], na.rm=TRUE)  # removes NA
    }
    means
}
colnames(pressure)
column_mean(pressure)
colnames(airquality)
column_mean(airquality)
