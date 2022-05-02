#'
#'    aaa.R
#'
#'   Code that must be read before the rest of the R code in Gulf2
#'
.spEnv <- new.env()

putGulf2Variable <- function(name, value) {
  assign(name, value, envir=.spEnv)
}
getGulf2Variable <- function(name) {
  get(name, envir=.spEnv)
}
existsGulf2Variable <- function(name) {
  exists(name, envir=.spEnv)
}
