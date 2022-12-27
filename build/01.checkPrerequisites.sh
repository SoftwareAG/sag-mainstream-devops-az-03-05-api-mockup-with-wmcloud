#!/bin/sh

# shellcheck source-path=SCRIPTDIR/..
. ./build/setParameters.sh

if [ -z ${SRC_CONTAINER_IMAGE_REGISTRY_URL+x} ]; then
  echo "Variable SRC_CONTAINER_IMAGE_REGISTRY_URL must be set!"
  exit 1
fi

if [ -z ${SRC_CONTAINER_IMAGE_REGISTRY_USER+x} ]; then
  echo "Variable SRC_CONTAINER_IMAGE_REGISTRY_USER must be set!"
  exit 2
fi

if [ -z ${SRC_CONTAINER_IMAGE_REGISTRY_PASS+x} ]; then
  echo "Variable SRC_CONTAINER_IMAGE_REGISTRY_PASS must be set!"
  exit 3
fi

if [ -z ${DST_CONTAINER_IMAGE_REGISTRY_URL+x} ]; then
  echo "Variable DST_CONTAINER_IMAGE_REGISTRY_URL must be set!"
  exit 4
fi

if [ -z ${DST_CONTAINER_IMAGE_REGISTRY_USER+x} ]; then
  echo "Variable DST_CONTAINER_IMAGE_REGISTRY_USER must be set!"
  exit 5
fi

if [ -z ${DST_CONTAINER_IMAGE_REGISTRY_PASS+x} ]; then
  echo "Variable DST_CONTAINER_IMAGE_REGISTRY_PASS must be set!"
  exit 6
fi

if [ -z ${SRC_CONTAINER_IMAGE_REPOSITORY_NAME+x} ]; then
  echo "Variable SRC_CONTAINER_IMAGE_REPOSITORY_NAME must be set!"
  exit 7
fi

if [ -z ${SRC_CONTAINER_IMAGE_REPOSITORY_TAG+x} ]; then
  echo "Variable SRC_CONTAINER_IMAGE_REPOSITORY_TAG must be set!"
  exit 8
fi

buildah login -u "${SRC_CONTAINER_IMAGE_REGISTRY_USER}" -p "${SRC_CONTAINER_IMAGE_REGISTRY_PASS}" "${SRC_CONTAINER_IMAGE_REGISTRY_URL}"
srcDockerLoginResult=$?

# Exit codes > 100 are not related to environment variables
if [ ${srcDockerLoginResult} -ne 0 ]; then
  echo "Login to ${SRC_CONTAINER_IMAGE_REGISTRY_URL} failed with result ${srcDockerLoginResult}"
  exit 101
fi

buildah login -u "${DST_CONTAINER_IMAGE_REGISTRY_USER}" -p "${DST_CONTAINER_IMAGE_REGISTRY_PASS}" "${DST_CONTAINER_IMAGE_REGISTRY_URL}"
dstDockerLoginResult=$?

if [ ${dstDockerLoginResult} -ne 0 ]; then
  echo "Login to ${DST_CONTAINER_IMAGE_REGISTRY_URL} failed with result ${dstDockerLoginResult}"
  exit 102
fi

imageToPull="${SRC_CONTAINER_IMAGE_REGISTRY_URL}/${SRC_CONTAINER_IMAGE_REPOSITORY_NAME}:${SRC_CONTAINER_IMAGE_REPOSITORY_TAG}"

# note: for the job speed sake the pull may work as a pre-fetch. If it fails it will be visible at buildah bud command time
nohup buildah pull "${imageToPull}" &

# buildahPullResult=$?
# if [ ${buildahPullResult} -ne 0 ]; then
#   echo "Pulling image ${imageToPull} failed with result ${buildahPullResult}"
#   exit 103
# fi
