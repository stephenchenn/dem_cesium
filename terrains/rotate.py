import numpy as np
from osgeo import gdal
import glob

def rotate_flip_dem_image(input_path, output_path, clockwise=True, flip_horizontal=False):
    # Open the DEM image using GDAL
    dataset = gdal.Open(input_path, gdal.GA_ReadOnly)
    
    # Read the image data and convert it into a NumPy array
    image_data = dataset.ReadAsArray()
    
    # Rotate the array by 90 degrees
    rotation_direction = -1 if clockwise else 1
    rotated_data = np.rot90(image_data, k=rotation_direction)
    
    # Flip the array horizontally if specified
    if flip_horizontal:
        rotated_data = np.fliplr(rotated_data)
    
    # Create an output dataset with the rotated and flipped data
    driver = dataset.GetDriver()
    output_dataset = driver.CreateCopy(output_path, dataset)
    output_dataset.GetRasterBand(1).WriteArray(rotated_data)
    output_dataset.FlushCache()
    
    # Close the datasets
    dataset = None
    output_dataset = None


# Get a list of all TIFF files in the current directory
tif_files = glob.glob("*.tif")

# Iterate over the TIFF files and print their names
for tif_file in tif_files:
    output_file = 'rotated' + tif_file
    rotate_flip_dem_image(tif_file, output_file, clockwise=True, flip_horizontal=True)
