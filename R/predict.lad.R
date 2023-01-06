#' Find the predicted values using the lad function
#'
#' Takes a lad object and a numeric vector, and returns the predicted values from the lad function.
#'
#'
#' @param object An object of type lad
#' @param new.x A numeric vector
#' @param ... further arguments passed to or from other methods
#'
#' @details \code{predict.lad} returns the predicted values using the found values of beta0 and beta1.
#'
#'
#' @return Vector of lad's predictions at the x values in new.x
#' @export

predict.lad = function(object, new.x, ...) {

  predicted = object$coefficients[1] + object$coefficients[2] * new.x
  return(predicted)

}
