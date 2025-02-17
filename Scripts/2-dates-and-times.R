source("Scripts/utils.print.R")

print_section("Dates and Times")

# R has developed a special representation of dates and times
# why???

# unix time (epoch = 1970-01-01)
# dates - Date
# time
# - POSIXct - very large integer - good for storing in a data frame
# or POSIXlt - list - also has day of week, year, month, day of month, day of year

x <- as.Date("1970-01-01")

print("days since epoch")
unclass(x)

unclass(as.Date("1970-01-02"))

print_date <- function(x) {
    print(paste("weekday", weekdays(x), "month", months(x), "quarters", quarters(x)))
}
print_date(x)

x <- Sys.time()
x
print_date(x)

p <- as.POSIXlt(x) # a list
names(unclass(p))
p$sec

x <- as.POSIXct(x)  # a number (epoch time)
x
unclass(x)
p <- as.POSIXlt(x) # to a list - from a specific string format YYYY-MM-DD
p$sec
str(unclass(p)) # more compact format

date_strings <- c("January 10, 2025 10:40", "December 9, 2011 9:10")
x <- strptime(date_strings, "%B %d, %Y %H:%M") # string-parse time (str -> date/time)
x
class(x)

x_base <- as.POSIXlt(as.Date("2000-01-01"))
x - x_base

dob <- as.POSIXlt(as.Date("1977-07-25"))
age <- Sys.time() - dob
age

as.numeric(difftime(Sys.time(), dob, unit="weeks"))/52.25
as.numeric(difftime(Sys.time(), dob, unit="auto"))

# lubridate package by Hadley Wickham.
