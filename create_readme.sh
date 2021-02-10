README_FILENAME="README.md"
README_STATIC_FILENAME="README_STATIC.md"
IMAGE_DIR="./profile_pictures"

# Remove README if exists.
if [ -f ${README_FILENAME} ]
then 
    rm ${README_FILENAME}
fi 
# Create a new empty README.
touch ${README_FILENAME}
# Append the static content to the README.
cat ${README_STATIC_FILENAME} >> ${README_FILENAME}

echo $'\n'"## Profile Pictures"$'\n' >> ${README_FILENAME}

# Add profile images to the README.
for filepath in `find ${IMAGE_DIR} -name "*.png"`
do
    # Extract the filename from the filepath.
    filename="$(basename -- ${filepath})"
    # Extract the basename from the filename.
    basename="$(basename ${filename} .png)"
    echo $'\n'"### ${basename}"$'\n' >> ${README_FILENAME}
    echo "![${basename}](${filepath})" >> ${README_FILENAME}
done

