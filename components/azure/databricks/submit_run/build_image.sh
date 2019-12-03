#!/bin/bash -e
image_name=alejacma/databricks_submit_run # Specify the image name here
image_tag="test"
full_image_name=${image_name}:${image_tag}

cd "$(dirname "$0")" 
docker build -t "${full_image_name}" .
docker push "$full_image_name"

# Output the strict image name (which contains the sha256 image digest)
docker inspect --format="{{index .RepoDigests 0}}" "${full_image_name}"

# Don't forget to make the script executable with chmod +x build_image.sh
