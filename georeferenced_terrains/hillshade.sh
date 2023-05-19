#!/bin/bash

# Iterate over each .tif file in the directory
for file in *.tif; do
    # Replace the extension with .png
    output="hillshade_${file}"

    # for pngs
    # filename="${file%.*}"
    # output="hillshade_${filename}.png"

    # Run gdaldem hillshade command
    gdaldem hillshade "$file" "$output"

    # Optional: Print a message for each processed file
    echo "Hillshade created for $file"
done