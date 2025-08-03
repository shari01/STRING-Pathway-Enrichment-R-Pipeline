source("config.R")
source("01_read_genes.R")
source("02_chunk_genes.R")
source("03_map_to_string_ids.R")
source("04_fetch_enrichment.R")
source("05_write_files.R")
source("06_combine_results.R")

genes <- read_genes_from_csv(INPUT_CSV)
timestamp <- format(Sys.time(), "%b%d_%H-%M-%S")
input_name <- tools::file_path_sans_ext(basename(INPUT_CSV))
base_dir <- file.path(paste0(input_name, "_Batch_Processing_", timestamp))
dir.create(base_dir, showWarnings = FALSE)
batches <- chunk_genes(genes, MAX_CHAR, MAX_COUNT)

for (i in seq_along(batches)) {
  result <- map_to_string_ids(batches[[i]])
  enrichment <- fetch_enrichment(result$sids)
  write_enrichment_files(enrichment, file.path(base_dir, paste0("batch-", i)))
  Sys.sleep(3)
}

combine_results(base_dir, file.path(base_dir, paste0(input_name, "_combined")))
