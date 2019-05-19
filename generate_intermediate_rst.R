
# [description]
#     Given a path to a directory, search for all
#     .Rmd files (recursively). For each of them,
#     generate a .rst file in the same location with
#     just enough in it to trick the Sphinx parser
#
#     Given file /path/to/thing.Rmd, file
#     /path/to/thing.rst will be generated.
#
# [usage]
#     Rscript generate_intermediate_rst.R --source-dir $(pwd)/docs

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
print("[INFO] Searching for R files")
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

PLACEHOLDER_CONTENT <- "
=======
A title
=======

"

for (rmd_file in rmd_files){

    output_dir <- dirname(rmd_file)
    base_filename <- basename(rmd_file)
    new_filename <- paste0(
        tools::file_path_sans_ext(base_filename)
        , ".rst"
    )
    output_file <- file.path(
        output_dir
        , new_filename
    )

    print(sprintf("[INFO] Creating file: %s", output_file))
    write(
        x = PLACEHOLDER_CONTENT
        , file = output_file
    )
}
