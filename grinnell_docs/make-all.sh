#!/bin/bash

# This script makes all the single copy documents and ships them over
# to a shared drive for my grant's office to review.

ONEDRIVE_PATH="/Users/osera/OneDrive - Grinnell College/Documents/NSF Medium 2020 (Osera)"
DOC_PREFIX=nsf-medium-fet-2020-osera
DOCS=("budget" "data-plan" "facilities" "rui")
COPY_OVER=("nsf20-medium-fet-budget-osera.xlsx"
           "nsf20-medium-fet-coa-osera.xlsx"
           "nsf20-medium-fet-current-and-pending.pdf"
           "nsf20-medium-fet-biosketch-osera.pdf")

echo "Building and copying TeX docs..."
for doc in ${DOCS[@]}; do
    latexmk -pdf ${doc}.tex
    mv "${doc}.pdf" "${ONEDRIVE_PATH}/${DOC_PREFIX}-${doc}.pdf"
done

echo "Copying single-docs..."
for doc in ${COPY_OVER[@]}; do
    cp "${doc}" "${ONEDRIVE_PATH}"
done

echo "Cleaning up..."
latexmk -C
rm -rf *.thm *.bbl
