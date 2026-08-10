#!/bin/bash

set -x


# Move vtkIOFFMPEG files to $PREFIX
# and the ffmpeg-related files in the FFMPEG_DIR and process each of them
HDF5_VARIANT="$1"
FFMPEG_DIR="$(dirname $(dirname $PREFIX))/vtk_ffmpeg_dir_${PKG_VERSION}_${PY_VER}_${HDF5_VARIANT}"
find $FFMPEG_DIR -name "*vtkIOFFMPEG*" -print0 | while IFS= read -r -d '' file; do
    dest_dir="$PREFIX/${file#$FFMPEG_DIR/}"
    mkdir -p "$(dirname "$dest_dir")"
    mv "$file" "$dest_dir"
done
