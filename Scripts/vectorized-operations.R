# Vectorized Operations (parallelized)

# no loop is needed -> simpler, more efficient

x <- 1:4; y<- 6:9

x + y

x[x>2]
x[x>=2]

y[y==8]

x*y
x/y

x^y

## Vectorized Matrix operations
x <- matrix(1:4, 2, 2); y <- matrix(10:13, 2, 2)
x
y
x*y # just element-wise multiplication
x/y
x %*% y ## true matrix multiplication (rows * columns) [proper matrix multiplication!] == dot product

x
det(x)  # ad - bc
t(x) # matrix transpose

solve(x) # the inverse of x
x_by_inverse = x %*% solve(x)  # should be I, the Identity matrix
diag(2) # I, with 2 rows, columns
x_by_inverse == diag(2)  # should be all TRUE
identical(x_by_inverse, diag(2)) # should be TRUE
