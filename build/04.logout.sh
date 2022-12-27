#!/bin/sh

# shellcheck source-path=SCRIPTDIR/..
. ./build/setParameters.sh

buildah logout "${SRC_CONTAINER_IMAGE_REGISTRY_URL}"
buildah logout "${DST_CONTAINER_IMAGE_REGISTRY_URL}"
