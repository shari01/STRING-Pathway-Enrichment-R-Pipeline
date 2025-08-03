API_BASE   <- "https://string-db.org/api"
SPECIES    <- 9606
CALLER     <- "batch_enrich_processor"
INPUT_CSV  <- "Transcriptomic_DATA/Diabetes-Associated Genes.csv"  # <--- CHANGE this to your actual path
MAX_CHAR   <- 1900
MAX_COUNT  <- 250

API_TO_KEY <- list(
  "Process" = "Process",
  "Function" = "Function",
  "Component" = "Component",
  "KEGG" = "KEGG_PATHWAY",
  "RCTM" = "REACTOME",
  "WikiPathways" = "WikiPathway"
)

CATEGORY_DISPLAY <- list(
  "Process" = "Biological_Process",
  "Function" = "Molecular_Function",
  "Component" = "COMPARTMENTS",
  "KEGG_PATHWAY" = "kegg",
  "REACTOME" = "rctm",
  "WikiPathway" = "wikipathways"
)

ALLOWED_KEYS <- names(CATEGORY_DISPLAY)
go_folder_disps <- tolower(c("Biological_Process", "Molecular_Function", "COMPARTMENTS"))
