## Set-up the default repository:
local({
    r <- getOption("repos")
    r["CRAN"] <- "http://cran.r-project.org"
    options(repos=r)
})

## Provide the start-up function:
.First <- function () {
    cat("\n    Welcome to R on opencpu-telostat!\n\n")
}

## Provide the function called prior closing the R session:
.Last <- function ()  cat("\n    Goodbye!\n    Telostat Team\n\n")
