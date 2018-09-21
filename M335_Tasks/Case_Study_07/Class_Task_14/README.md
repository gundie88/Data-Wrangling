* map() makes a list.
* map_lgl() makes a logical vector.
* map_int() makes an integer vector.
* map_dbl() makes a double vector.
* map_chr() makes a character vector.

i referred to the current index in the for loop

map2() which iterates over two vectors in parallel:

output <- vector("double", ncol(df))  # 1. output
for (i in seq_along(df)) {            # 2. sequence
  output[[i]] <- median(df[[i]])      # 3. body
}
output