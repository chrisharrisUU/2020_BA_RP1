# Import functions from GitHub --------------------------------------------
# https://stackoverflow.com/a/35720824/10357426
source_https <- function(u, unlink.tmp.certs = FALSE) {
  # load package
  if (!require(RCurl)) {install.packages("RCurl"); library(RCurl)}
  
  # read script lines from website using a security certificate
  if (!file.exists(here("Auxiliary/cacert.pem"))) {
    download.file(url = "http://curl.haxx.se/ca/cacert.pem", destfile = here("Auxiliary/cacert.pem"))
  }
  script <- getURL(u, followlocation = TRUE, cainfo = here("Auxiliary/cacert.pem"))
  if (unlink.tmp.certs) {unlink(here("Auxiliary/cacert.pem"))}
  
  # parase lines and evealuate in the global environement
  eval(parse(text = script), envir = .GlobalEnv)
}


# My functions for outputting inference tests in APAish style -------------
source_https("https://raw.githubusercontent.com/chrisharrisUU/testoutputs/master/functions.R")


# Time series functions ---------------------------------------------------
time_series <- function(.data, grouping_var) {
  # Enquote
  grouping_var <- enquo(grouping_var)
  
  # Range
  trials <- colnames(.data) %>%
    .[grep("trial", .)] %>%
    substr(., 6, nchar(.)) %>%
    as.integer(.)
  from <- min(trials)
  to <- max(trials)
  
  # Data prep
  .data %<>%
    select(id, !!grouping_var, primacy, contains("trial")) %>%
    # Counterbalancing
    mutate_at(.vars = vars(contains("trial")),
              .funs = ~ifelse(primacy == "left frequent", . * (-1), .)) %>%
    # # Dominant
    # mutate_at(.vars = vars(contains("week")),
    #           .funs = funs(ifelse(condition == "rich", ., . * (-1)))) %>%
    # 0 - 1 for percentages
    mutate_at(.vars = vars(contains("trial")),
              .funs = ~ifelse(. < 0, 0, 1)) %>%
    group_by(!!grouping_var) %>%
    # Summarize percentage positive hits
    summarize_at(.vars = vars(contains("trial")),
                 .funs = ~mean(., na.rm = TRUE)) %>%
    # Long format
    gather(key = time,
           value = sampling,
           paste0("trial", from:to)) %>%
    # As integer for time series graph
    mutate(time = as.integer(substr(time, 6, nchar(time))))
  
  # Create graph
  ggplot(.data,
         aes(x = time,
             y = sampling,
             color = !!grouping_var,
             group = !!grouping_var)) +
    # geom_hline(yintercept = .5,
    #                alpha = .3) +
    geom_segment(aes(x = 5,
                     xend = 100,
                     y = .5,
                     yend = .5),
                 color = "#999999",
                 size = .1) +
    geom_point(size = .9) +
    geom_line(size = .2,
              alpha = .3) +
    geom_smooth(method = "loess",
                span = 1,
                size = 1,
                formula = "y ~ x") +
    scale_color_manual(values = pal, name = "Group") +
    theme_apa() +
    labs(y = "Percentage sampling frequent option",
         x = "Trial")  + guides(color = guide_legend(reverse = TRUE))
}
