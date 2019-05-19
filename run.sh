#!/bin/bash

OUTPUT_FILE=$(pwd)/example.html

Rscript run.R \
    --output-file ${OUTPUT_FILE}

open ${OUTPUT_FILE}
