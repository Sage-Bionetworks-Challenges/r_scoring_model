library(argparse)
library(rjson)

## Suggested command-line arguments.
# You may add additional ones if they are needed.
parser = ArgumentParser()
parser$add_argument(
    "--goldstandard",
    type = "character",
    required = TRUE
)
parser$add_argument(
    "--submission_file",
    type = "character",
    required = TRUE
)
parser$add_argument(
    "--results",
    type = "character",
    required = TRUE
)
args <- parser$parse_args()

pred <- read.csv(args$submission_file)
gold <- read.csv(args$goldstandard)

## Sample scoring ##
score1 <- 0.8
score2 <- 0.2
submission_status <- "SCORED"

res <- list(
    'primary_metric' = "auc",
    'primary_metric_value' = score1,
    'secondary_metric' = "aupr",
    'secondary_metric_value' = score2,
    'submission_status' = submission_status
)

res %>%  
    rjson::toJSON() %>% 
    write(args$results)