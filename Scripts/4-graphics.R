source("Scripts/utils.print.R")

print_section("Graphics in R")

# advanced: lattice, ggplot2 and ggvis

print_section("plot() - scatterplt")
plot(x = cars$speed, y = cars$dist)

plot(dist ~ speed, cars)
plot(x = cars$speed, y = cars$dist, main = "Speed to a halt!", xlab = "Speed", ylab = "Stopping Distance", sub = "My Plot Subtitle")

palette()
red_pen <- 2
plot(cars, col = red_pen)
plot(cars, col = "#00FF00")
plot(cars, xlim = c(10, 15))
shape_triangle <- 2
plot(cars, pch = shape_triangle)

print_section("boxplot() - box plot")
boxplot(formula = mpg ~ cyl, data = mtcars)

print_section("hist() - histogram")
hist(mtcars$mpg)

