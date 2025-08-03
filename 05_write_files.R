write_enrichment_files <- function(enrichment, base_dir) {
  for (key in names(enrichment)) {
    mapped_key <- API_TO_KEY[[key]]
    if (!(mapped_key %in% ALLOWED_KEYS)) next
    disp <- tolower(CATEGORY_DISPLAY[[mapped_key]])
    folder <- if (disp %in% go_folder_disps) file.path(base_dir, "Gene_Ontology") else file.path(base_dir, "Main-DB-pathways")
    dir.create(folder, recursive = TRUE, showWarnings = FALSE)
    file_path <- file.path(folder, paste0(disp, ".tsv"))
    write.table(enrichment[[key]], file = file_path, sep = "\t", row.names = FALSE, quote = FALSE)
  }
}
