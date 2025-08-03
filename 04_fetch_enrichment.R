fetch_enrichment <- function(string_ids) {
  url <- paste0(API_BASE, "/tsv/enrichment")
  res <- GET(url, query = list(
    identifiers = paste(string_ids, collapse = "\r"),
    species = SPECIES,
    caller_identity = CALLER
  ))
  stop_for_status(res)
  df <- read.delim(text = content(res, "text"), sep = "\t", stringsAsFactors = FALSE)
  
  df <- df[df$category %in% names(API_TO_KEY), ]  # <-- Filter valid categories
  df_list <- split(df, df$category)               # <-- Now safe to split
  return(df_list)
}
