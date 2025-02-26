source("Scripts/utils.print.R")

print_section("system.time()")

do_a_lot <- function() {
    x <- 0
    range <- 10000
    while (round(x) != range) {
        cat("/ \r")
        cat("- \r")
        cat("\\ \r")
        cat("| \r")
        x <- rnorm(1) * (range + 1)
    }
}

time_taken <- system.time(do_a_lot())
# user time (CPU busy time)
# elapsed time (wall clock time)
#   - can be higher if CPU waiting (e.g. on I/O), or lower if many cores
# - multi-threaded BLAS libraries (vecLib/Accelerate, ATLAS, ACML, MKL)
#   - BLAS (Basic Linear Algebra Subprograms) library is useful for efficient
#       matrix computations.
# - parallel processing via the parallel package
str(time_taken)
summary(time_taken)

print("I/O - Elapsed time (wall clock) > user time (CPU mostly idle due to I/O)")
system.time(readLines(("http://jhsph.edu")))

print("Elapsed time vs user time (CPU busy, so bit higher user time)")
hilbert <- function(n) {
    i <- 1:n
    1 / outer(i - 1, i, "+")
}
x <- hilbert((1000))
system.time(svd(x)) # SVD = Singular Value Decomposition

do_heavy <- function(n=1000) {
    r <- numeric(n)
    for (i in 1:n) {
        x <- rnorm(n)
        r[i] <- mean(x)
    }
}

system.time(do_heavy())

print_section("R Profiler - Rprof()")
# Rprof() samples every 0.02s
# do NOT use system.time() and Rprof() together!
# C or Fortran (!) code is NOT profiled.
Rprof(tmp <- tempfile())
do_heavy(1000 * 10)
example(glm)
Rprof(NULL)
summaryRprof(tmp)
unlink(tmp)

Rprof(tmp <- tempfile(), memory.profiling = TRUE)
do_heavy(1000 * 10)
example(glm)
Rprof(NULL)
summaryRprof(tmp, memory = "stats")
unlink(tmp)

# summaryRprof() output:
# by.total - divides time spent in each function, by the total run time.
# by.self [recommended] - same, but first subtracts out time spent in functions
#   called by this function.
