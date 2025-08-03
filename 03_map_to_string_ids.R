library(httr)
library(jsonlite)

map_to_string_ids <- function(genes) {
  url <- paste0(API_BASE, "/json/get_string_ids")
  response <- POST(url, body = list(
    identifiers = paste(genes, collapse = "\r"),
    species = SPECIES,
    caller_identity = CALLER
  ), encode = "form")
  stop_for_status(response)
  data <- content(response, as = "parsed", type = "application/json")
  mapping <- sapply(data, function(x) x$stringId)
  names(mapping) <- sapply(data, function(x) x$queryItem)
  return(list(mapping = mapping, sids = unname(mapping)))
}
