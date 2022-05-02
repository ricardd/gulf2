#
# news.R
#
#  News and warnings
#
latest.news <- function(package=gulf2.family(), doBrowse=FALSE, major=TRUE) {
  stopifnot(is.character(package))
  n <- length(package)
  result <- vector(mode="list", length=n)
  names(result) <- package
  for(i in seq_len(n)) {
    pack <- package[i]
    ## get version number
    v <- read.dcf(file=system.file("DESCRIPTION", package=pack),
                  fields="Version")
    if(major) {
      ## the current major version
      vp <- package_version(v)
      vv <- unlist(vp)
      v <- paste0(vv[1], ".", vv[2])
    }
    ne <- eval(substitute(news(Version >= v0, package=pack), list(v0=v)))
    if(n > 1 && !doBrowse) {
      hdr <- paste0("Package ", sQuote(pack), ":")
      if(interactive()) readline(hdr) else cat(paste(hdr, "\n"))
    }
    page(ne, method="print", doBrowse=doBrowse)
    result[[i]] <- ne
  }
  if(n == 1) result <- result[[1]]
  return(invisible(result))
}

class(latest.news) <- "autoexec"

gulf.family <- function(subpackages=TRUE) {
  sub <- c("gulf.utils", "gulf.data",
           "gulf.graphics", "gulf.metadata",
           "gulf.spatial", "gulf.stats",
           "gulf2")
  result <- c(if(subpackages) sub else NULL)
  as.character(result)
}
