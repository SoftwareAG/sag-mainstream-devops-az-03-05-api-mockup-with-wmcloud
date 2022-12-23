#!/bin/sh

. ./build/setParameters.sh

cp ./Dockerfile /tmp/buildContext

baseImageTag="${SRC_CONTAINER_IMAGE_REGISTRY_URL}/${SRC_CONTAINER_IMAGE_REPOSITORY_NAME}:${SRC_CONTAINER_IMAGE_REPOSITORY_TAG}"
destinationImageBaseTag="${DST_CONTAINER_IMAGE_REGISTRY_URL}/${DST_CONTAINER_IMAGE_REPOSITORY_NAME}"

buildah bud \
  --isolation=chroot \
  --build-arg __base_image=${baseImageTag} \
  --build-arg __is_home=${SRC_CONTAINER_IS_HOME} \
  --build-arg __sag_admin=${SRC_SAGADMIN_USER_NAME} \
  --build-arg __sag_grp=${SRC_SAGADMIN_GROUP_NAME} \
  -t "${destinationImageBaseTag}:${DST_CONTAINER_IMAGE_REPOSITORY_TAG}" \
  /tmp/buildContext

buildResult=$?

if [ ${buildResult} -ne 0 ]; then
  echo "Build failed with result ${buildResult}"
  exit 1
fi 

buildah push "${destinationImageBaseTag}:${DST_CONTAINER_IMAGE_REPOSITORY_TAG}" || exit 2

if [ -n "${DST_CONTAINER_IMAGE_REPOSITORY_SUPPLEMENTAL_TAGS+x}" ]; then
  for tag in ${DST_CONTAINER_IMAGE_REPOSITORY_SUPPLEMENTAL_TAGS}; do
    echo "Also pushing tag $tag"
    buildah tag "${destinationImageBaseTag}:${DST_CONTAINER_IMAGE_REPOSITORY_TAG}" "${destinationImageBaseTag}:${tag}"
    buildah push "${destinationImageBaseTag}:${tag}" || exit 3
  done
fi