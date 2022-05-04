#'
#'    aaa.R
#'
#'   Code that must be read before the rest of the R code in gulf2
#'
.spEnv <- new.env()

putgulf2Variable <- function(name, value) {
  assign(name, value, envir=.spEnv)
}
getgulf2Variable <- function(name) {
  get(name, envir=.spEnv)
}
existsgulf2Variable <- function(name) {
  exists(name, envir=.spEnv)
}
