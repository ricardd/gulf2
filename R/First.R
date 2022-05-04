##  gulf2/R/First.R

.onLoad <- function(...) {
  reset.gulf2.options()
  umf <- system.file("doc", "umbrella.txt", package="gulf2")
  isum <- !is.null(umf) && file.exists(umf)
  putGulf2Variable("Gulf2.Is.Umbrella", isum)
  invisible(NULL)
}
.onAttach <- function(libname, pkgname) {
  vs <- read.dcf(file=system.file("DESCRIPTION", package="gulf2"),
                 fields="Version")
  vs <- as.character(vs)
  putGulf2Variable("gulf2Version", vs)
  nickfile <- system.file("doc", "Nickname.txt", package="gulf2")
  ni <- scan(file=nickfile, what=character(), n=1, quiet=TRUE)
  msg <- paste("\ngulf2", vs,
               "     ",
               spatstat.utils::paren(paste("nickname:", sQuote(ni))),
               "\nFor an introduction to gulf2, type",
               sQuote("beginner"), "\n")
  packageStartupMessage(msg)
  return(invisible(NULL))
}
