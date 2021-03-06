
# [description]
#     Given a path to a directory, search for all
#     .Rmd files (recursively). For each of them,
#     call rmarkdown::render() and create the equivalent
#     HTML output.
#
#     Given file /path/to/thing.Rmd, file
#     /path/to/thing.html will be generated.
#
# [usage]
#     Rscript generate_r_html.R --source-dir $(pwd)/docs

library(argparse)

parser <- argparse::ArgumentParser()
parser$add_argument(
    "--source-dir"
    , type = "character"
    , help = "Directory to search for HTML files"
)

# Grab args (store in constants for easier debugging)
args <- parser$parse_args()

SOURCE_DIR <- args[["source_dir"]]

# Find all the R files you can
print("[INFO] Searching for .Rmd files")
rmd_files <- list.files(
    path = SOURCE_DIR
    , pattern = ".Rmd"
    , recursive = TRUE
    , full.names = TRUE
)

num_files <- length(rmd_files)

if (num_files == 0){
    print("[INFO] No files found")
} else {
    print(paste0("[INFO] ", num_files, " files found"))
}

for (rmd_file in rmd_files){

    output_dir <- dirname(rmd_file)
    base_filename <- basename(rmd_file)
    new_filename <- paste0(
        "TEMP-"
        , tools::file_path_sans_ext(base_filename)
        , ".html"
    )
    output_file <- file.path(
        output_dir
        , new_filename
    )

    print(sprintf("[INFO] Creating file: %s", output_file))
    rmarkdown::render(
        input = rmd_file
        , intermediates_dir = tempdir()
        , output_dir = output_dir
        , output_file = output_file
    )
}
