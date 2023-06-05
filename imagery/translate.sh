#!/bin/bash

# Iterate over each .tif.aux.xml file in the directory
for auxfile in *.png.aux.xml; do
    # Extract the file name without extension
    filename="${auxfile%.png.aux.xml}"

    # Construct the .tif and new .tif paths
    png_file="${filename}.png"
    new_png_file="new_${filename}.tif"

    # Run gdal_translate command
    gdal_translate -mo "$auxfile" "$png_file" "$new_png_file"

    # Optional: Print a message for each processed file
    echo "Translated $auxfile to $new_png_file"
done