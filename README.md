# STRING Pathway Enrichment Pipeline (R Version)

This R-based pipeline performs pathway enrichment analysis using the STRING API from gene input CSVs. It's a modular rewrite of a Python pipeline.

---

## 📁 File Structure

- `config.R` – global constants (API base, species, file paths)
- `01_read_genes.R` – loads genes from input CSV
- `02_chunk_genes.R` – splits genes into batches
- `03_map_to_string_ids.R` – maps genes to STRING IDs
- `04_fetch_enrichment.R` – fetches pathway enrichment via STRING API
- `05_write_files.R` – saves enrichment results to folders
- `06_combine_results.R` – merges enrichment results into a CSV
- `07_runner.R` – main orchestrator (run this file)

---

## ✅ How to Run

1. Modify `INPUT_CSV` path inside `config.R` to your gene list (must have a column named `gene`).
2. From R console or RStudio, run:

```r
source("07_runner.R")
