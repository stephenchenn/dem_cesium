terrain processing (fixing orientation and georeferencing):
1. run in terrains folder:
    python3 rotate.py
2. move the rotated/flipped terrains to terrain_orientation_fixed folder
3. run in dtm folder:
    python3 geotransform_terrain.py
4. run in terrain_orientation_fixed
    ./translate.sh
5. move the georeferenced/rotated/flipped terrains to georeferenced_terrains folder
6. run in georeferenced_terrains:
    ./hillshade.sh
7. move the hillshade/georeferenced/rotated/flipped terrains to hillshade folder
8. run in dtm:
    sudo mv hillshade /var/lib/docker/volumes/data_dir/_data
    and publish it geoserver and verify that it displays as expected
9. move the terrains in georeferenced_terrains to final_terrains folder, compress it and load it in cesium

imagery (georeferencing):
1. run in dtm folder:
    python3 geotransform_imagery.py
2. run in imagery folder:
    ./translate