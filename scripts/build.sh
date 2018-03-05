#!/bin/bash

# Remove the directory, if it's already there
rm -rf build/
# Create the directory, if it doesn't exist
mkdir -p build/
# Copy the json files to the build directory
cp -R src/* build/
# Compress every file in the directory
find build/ -maxdepth 1 -type f -exec zip -j '{}'.zip {} \;
# Remove the old json files
rm -f build/*.json
