library(dplyr)

combine_results <- function(base_dir, combined_dir) {
  dir.create(combined_dir, recursive = TRUE, showWarnings = FALSE)
  all_files <- list.files(base_dir, pattern = "*.tsv", recursive = TRUE, full.names = TRUE)
  all_dfs <- lapply(all_files, function(f) {
    df <- read.delim(f, sep = "\t", stringsAsFactors = FALSE)
    df$category <- tools::file_path_sans_ext(basename(f))
    return(df)
  })
  if (length(all_dfs) == 0) return()
  df <- bind_rows(all_dfs)
  code_map <- c(
    biological_process = "GO_BP",
    molecular_function = "GO_MF",
    compartments = "GO_CC",
    rctm = "REACTOME",
    wikipathways = "WIKIPATHWAY",
    kegg = "KEGG"
  )
  df$DB_ID <- code_map[tolower(df$category)]
  df <- df %>%
    rename(
      "Pathway source" = category,
      "Pathway ID" = term,
      "Pathway associated genes" = preferredNames,
      "Pathway" = description
    ) %>%
    select(any_of(c("DB_ID", "Pathway source", "Pathway ID", "number_of_genes", "number_of_genes_in_background",
                    "ncbiTaxonId", "inputGenes", "Pathway associated genes", "p_value", "fdr", "Pathway")))
  combined_file <- file.path(combined_dir, paste0(basename(combined_dir), ".csv"))
  write.csv(df, combined_file, row.names = FALSE)
  message("→ Combined enrichment saved to ", combined_file)
}
