print_section <- function(message) {
    separator <- "=== === ==="

    print_line <- function() {
        print(paste(separator, separator, separator))
    }

    print_line()
    print(paste(separator, message, separator))
    print_line()
}
