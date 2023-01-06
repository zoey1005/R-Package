#' Print method for the lad class
#'
#' Prints the vector of regression coefficients to the console.
#'
#'
#' @param x A lad object
#' @param ... further arguments passed to or from other methods
#'
#' @details \code{print.lad} prints the vector of coefficients to the console.
#'
#' @return Does not return anything; only prints to the console
#'
#' @export

print.lad = function(x, ...) {
  cat("Intercept = ", x$coefficients[1], " Slope = ", x$coefficients[2], sep = "")
}


