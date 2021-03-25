library(argparse)
library(rjson)

## Suggested command-line arguments.
# You may add additional ones if they are needed.
parser = ArgumentParser()
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

res <- list(
    "submission_status" = "VALID",
    "submission_errors" = ""
)

if (is.null(args$inputfile)) {
    res$submission_status = "INVALID"
    res$submission_errors = "Submission must be a Synapse File, not Folder/Project"
} else {
    pred <- read.csv(args$submission_file)

    ## Sample validation test ##
    if (!startsWith(pred, "test")) {
        res$prediction_file_status = "INVALID"
        res$prediction_file_errors = "Submission must have test column"
    }
}

res %>%  
    rjson::toJSON() %>% 
    write(args$results)