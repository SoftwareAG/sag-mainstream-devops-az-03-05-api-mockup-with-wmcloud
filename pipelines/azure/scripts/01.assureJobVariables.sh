#!/bin/bash

echo "##vso[task.setvariable variable=JOB_TIMESTAMP;]$(date +%y-%m-%d'T'%H.%M.%S)"

logI "Sourcing secure information: Storage Account coordinates and credentials..."
chmod u+x "${SECUREINFO_SECUREFILEPATH}"
. "${SECUREINFO_SECUREFILEPATH}"

echo "##vso[task.setvariable variable=SRC_CONTAINER_IMAGE_REGISTRY_URL;]${SRC_CONTAINER_IMAGE_REGISTRY_URL}"
echo "##vso[task.setvariable variable=SRC_CONTAINER_IMAGE_REGISTRY_USER;]${SRC_CONTAINER_IMAGE_REGISTRY_USER}"
echo "##vso[task.setvariable variable=SRC_CONTAINER_IMAGE_REGISTRY_PASS;]${SRC_CONTAINER_IMAGE_REGISTRY_PASS}"
echo "##vso[task.setvariable variable=DST_CONTAINER_IMAGE_REGISTRY_URL;]${DST_CONTAINER_IMAGE_REGISTRY_URL}"
echo "##vso[task.setvariable variable=DST_CONTAINER_IMAGE_REGISTRY_USER;]${DST_CONTAINER_IMAGE_REGISTRY_USER}"
echo "##vso[task.setvariable variable=DST_CONTAINER_IMAGE_REGISTRY_PASS;]${DST_CONTAINER_IMAGE_REGISTRY_PASS}"
