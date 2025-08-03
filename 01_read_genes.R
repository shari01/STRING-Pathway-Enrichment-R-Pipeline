read_genes_from_csv <- function(path) {
  df <- read.csv(path, stringsAsFactors = FALSE)
  gene_col <- names(df)[tolower(names(df)) == "gene"]
  if (length(gene_col) == 0) stop("CSV must have 'gene' column.")
  genes <- trimws(df[[gene_col]])
  genes <- genes[genes != ""]
  message("→ Read ", length(genes), " genes from ", path)
  return(genes)
}
