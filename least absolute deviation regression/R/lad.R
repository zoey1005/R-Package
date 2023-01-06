#' Least absolute deviations regression
#'
#' Finds the values of beta0 and beta1 that minimize the sum of least absolute deviations for given
#' vectors x and y.
#'
#'
#' @param x A numeric vector of observations
#' @param y A numeric vector of observations
#' @param ... further arguments passed to or from other methods
#'
#' @details \code{lad} minimizes the sum of least absolute deviations and finds the corresponding
#' estimates of beta0 and beta1.
#'
#'
#' @return An object of class "\code{lad}" is a list containing the following components:
#' @return \code{coefficients}    named regression coefficients
#' @return \code{fitted values}   vector of predicted values for the given x
#' @return \code{residuals}       vector of difference between actual and predicted values of y
#'
#'
#' @examples
#' v = lad(x = area$land, y = area$farm)
#' print(v)
#' plot(area$land, area$farm, main = "Farm Area vs Land Area", xlab = "Land Area (sq. miles)", ylab = "Farm Area (sq. miles)")
#' abline(reg = lm(area$farm ~ area$land), col = "red")
#' abline(reg = v, col = "blue")
#' legend("topleft", legend = c("lm()", "lad()"), col = c("red", "blue"), lty = c("solid", "solid"), cex = .9)
#' points(quantile(area$land), predict(v, quantile(area$land)), col = "green", pch = 16)
#'
#'
#' @export


lad = function(x, y) {

  model.fit = function(beta, x1, x2) {
    return(sum(abs(x2 - beta[1] - beta[2]*x1)))
  }
  # optimize beta0 and beta1
  coefficients = optim(par = lm(y ~ x)$coefficients, fn = model.fit, x1 = x, x2 = y)$par
  fitted.values = coefficients[1] + coefficients[2]*x # Predicted values
  residuals = y - fitted.values # Actual - Predicted
  names(coefficients) = c("(Intercept)", "x") # add names to coefficients
  result = list(coefficients = coefficients,
            fitted.values = fitted.values,
            residuals = residuals) # make into list
  class(result) = "lad" # make class "lad"
  return(result) # return object

}


