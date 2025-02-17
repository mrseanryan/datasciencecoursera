source("Scripts/utils.print.R")

print("& vs &&")

print("& (vectorized AND)")
TRUE & c(TRUE, FALSE, FALSE) # -> TRUE, FALSE, FALSE

print("&& (scalar AND)")
TRUE && FALSE # -> FALSE

print("| vs ||")

print("| (vectorized OR)")
TRUE | c(TRUE, FALSE, FALSE) # -> TRUE, TRUE, TRUE

print("|| (scalar OR)")
TRUE || FALSE # -> TRUE

# All AND operators are evaluated before OR operators
5 > 8 || 6 != 8 && 4 > 3.9
5 > 8 || (6 != 8 && 4 > 3.9)

isTRUE(6 > 4)
isTRUE(3) # FALSE

xor(5==6, !FALSE)
xor(FALSE, FALSE)
xor(FALSE, TRUE)
xor(TRUE, TRUE)

!TRUE
!!TRUE
!!!TRUE

ints <- sample(10) # random sample of 1..10 without replacement (without 'reuse')
ints
ints > 5
which(ints > 5) # outputs matching indices

any(ints > 5)
any(ints < 0)
all(ints > 5)
all(ints > 0)

