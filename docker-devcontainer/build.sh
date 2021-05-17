#!/usr/bin/env bash

[[ ! -f "./Dockerfile" ]] && {
    echo "Run this from within the same directory as the Dockerfile." >&2 && exit 1
}

image_name="sandbox-devel:1.0"

docker build --no-cache -t $image_name . \
    --build-arg BASE_IMAGE="alpine" \
    --build-arg BASE_TAG="3.13.5"

exit $?
