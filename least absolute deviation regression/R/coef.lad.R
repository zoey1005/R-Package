#' Coefficients of a lad object
#'
#' Takes a lad object and returns its vector of coefficients
#'
#'
#' @param object An object of type lad
#' @param ... further arguments passed to or from other methods
#'
#' @details \code{coef.lad} returns the coefficients of the lad object.
#'
#' @return Vector of coefficients of the lad object
#' @export

coef.lad = function(object, ...) {

  return(object$coefficients)

}
