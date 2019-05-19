
# [description]
#     Given a .Rmd file, run rmarkdown_render()
#     to generate HTML output from it. All
#     customization of the file is done in
#     its YAML headmatter (not in the call
#     to render())

library(argparse)

parser <- argparse::ArgumentParser()
parser$add_argument(
    "--output-file"
    , type = "character"
    , help = "HTML file to create"
)

# Grab args (store in constants for easier debugging)
args <- parser$parse_args()

INPUT_FILE <- "example.Rmd"
INTERMEDIATES_DIR <- tempdir()
OUTPUT_FILE <- basename(args[["output_file"]])
OUTPUT_DIR <- dirname(args[["output_file"]])

rmarkdown::render(
    input = INPUT_FILE
    , intermediates_dir = INTERMEDIATES_DIR
    , output_dir = OUTPUT_DIR
    , output_file = OUTPUT_FILE
)
