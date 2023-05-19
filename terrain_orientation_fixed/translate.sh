#!/bin/bash

# Iterate over each .tif.aux.xml file in the directory
for auxfile in *.tif.aux.xml; do
    # Extract the file name without extension
    filename="${auxfile%.tif.aux.xml}"

    # Construct the .tif and new .tif paths
    tif_file="${filename}.tif"
    new_tif_file="new_${filename}.tif"

    # Run gdal_translate command
    gdal_translate -mo "$auxfile" "$tif_file" "$new_tif_file"

    # Optional: Print a message for each processed file
    echo "Translated $auxfile to $new_tif_file"
done