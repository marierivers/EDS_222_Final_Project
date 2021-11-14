#' Title
#'
#' @param fips 
#'
#' @return
#' @export
#'
#' @examples
state_pop_fun <- function(fips) {
  path = paste0("co-est00int-01-", fips, ".csv")
  state_data <- read_csv(here("data", "population_data", "csv_files", path), skip = 5, col_names = header) %>% 
    mutate(state_fips = fips) %>% 
    filter(april_1_2000 != "na") %>% 
    mutate_at("geographic_area", str_replace, ".", "") %>% 
    relocate(state_fips, .after = geographic_area)
}