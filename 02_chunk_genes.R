chunk_genes <- function(genes, max_chars, max_count) {
  batches <- list()
  current <- c(); total_len <- 0
  for (gene in genes) {
    add_len <- nchar(gene) + 1
    if (length(current) > 0 && (total_len + add_len > max_chars || length(current) >= max_count)) {
      batches <- append(batches, list(current))
      current <- c(); total_len <- 0
    }
    current <- c(current, gene)
    total_len <- total_len + add_len
  }
  if (length(current) > 0) batches <- append(batches, list(current))
  return(batches)
}
