1. You need to pick a name for the function. Here I’ve used rescale01 because this function rescales a vector to lie between 0 and 1.

2. You list the inputs, or arguments, to the function inside function. Here we have just one argument. If we had more the call would look like function(x, y, z).

3. You place the code you have developed in body of the function, a { block that immediately follows function(...).
 
 rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(c(0, 5, 10))
#> [1] 0.0 0.5 1.0

For functions:

substr(x, start=n1, stop=n2)
grep(pattern,x, value=FALSE, ignore.case=FALSE, fixed=FALSE)
gsub(pattern, replacement, x, ignore.case=FALSE, fixed=FALSE)
gregexpr(pattern, text, ignore.case=FALSE, perl=FALSE,
fixed=FALSE)
strsplit(x, split)
paste(…, sep="", collapse=NULL)
sprintf(fmt, …)
toupper/tolower(x)
nchar(x)