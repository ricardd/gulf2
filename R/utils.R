msg <- function(..., startup = FALSE) {
  if (startup) {
    if (!isTRUE(getOption("gulf2.quiet"))) {
      packageStartupMessage(text_col(...))
    }
  } else {
    message(text_col(...))
  }
}
