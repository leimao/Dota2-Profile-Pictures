# Image source directory.
IMAGE_SOURCE_DIR="./profile_pictures_raw"
# Image target directory.
IMAGE_TARGET_DIR="./profile_pictures"

# The width and height after resize.
WIDTH=256
HIGHT=256

# Create the target directory if not exist.
mkdir -p ${IMAGE_TARGET_DIR}

for filepath_src in `find ${IMAGE_SOURCE_DIR} -name "*.png"`
do
    # Extract the filename from the filepath.
    filename="$(basename -- ${filepath_src})"
    # Echo progress
    echo "Processing ${filename} ..."
    # Derive the target filepath.
    filepath_trg="${IMAGE_TARGET_DIR}/${filename}"
    # Echo progress
    # echo "Converting from ${filepath_src} to ${filepath_trg} ..."
    convert ${filepath_src} -resize ${HIGHT}x${WIDTH} ${filepath_trg}
done