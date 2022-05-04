#
#     options.R
#
#     gulf2 options and other internal states
#

putgulf2Variable("gulf2.Options", list())

".gulf2.Opt.Table" <-
  list(
    terse = list(
      ## Level of terseness in printed output (higher => more terse)
      default=0,
      check=function(x) { length(x) == 1 && all(x %in% 0:4) },
      valid="an integer between 0 and 4"
    )
  )
# end of options list


reset.gulf2.options <- function() {
  gulf2.Options <- lapply(.gulf2.Opt.Table, getElement, name="default")
  putgulf2Variable("gulf2.Options", gulf2.Options)
  invisible(gulf2.Options)
}

reset.gulf2.option()

