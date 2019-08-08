#!/bin/sh
#
# Description: This script publishes a new version to the Docker Hub.
# Author: Niklas Heer (niklas.heer@gmail.com)
# Version: 1.0.0 (2018-03-03)

main() {
    if [ -z "$2" ]; then
        echo "No version set."
        exit 1
    fi

    HUB_BASE="$DOCKER_USERNAME"
    LOCAL_NAME="$1"
    HUB_NAME="$1"
    VERSION="$2"

    docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASS"
    docker tag "$LOCAL_NAME" "$HUB_BASE/$HUB_NAME:$VERSION"
    docker push "$HUB_BASE/$HUB_NAME:$VERSION"
}

main "$@"


