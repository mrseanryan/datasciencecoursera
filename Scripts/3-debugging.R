source("Scripts/utils.print.R")

print_section("Debugging R")

browser() # sets a breakpoint at that line, like Python's pdf.set_trace()

traceback()  # prints stack trace
recover() # modify the error behaviour so you can browser the call stack. related to traceback(). an error handler, goes into debugging mode like browser().

log(-1)  # generates a warning, NaN

print_message <- function(x) {
    print(paste("x", x))
    x  # return x. x gets auto-printed to the console.
}

print_message_invisible <- function(x) {
    print(paste("x", x))
    invisible(x)  # return x. invisible: do NOT auto-print x.
}

x <- c(1,2,3)

trace(print_message) # add debugging code to a function. prints a trace when that function is called, like "trace: print_message(x)"
debug(print_message_invisible) # sets a breakpoint. flags a function for "debug" mode - step through, prints out the statements and their results.

print_message(x)
print_message_invisible(x)

print_section("traceback()")
#mean(does_not_exist)
traceback()

# lm(x-does_not_exist)
traceback()

print_section("debug()")
debug(mean) # like pdb.set_trace()
mean(x)

print_section("recover()")
options(error=recover)  # error -> start debugging
read.csv("no-such-file.csv")
