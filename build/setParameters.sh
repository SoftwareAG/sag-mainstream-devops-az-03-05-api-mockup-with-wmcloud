#!/bin/sh

crtdate=$(date +%y-%m-%d'T'%H.%M.%S)
export JOB_TIMESTAMP="${JOB_TIMESTAMP:-$crtdate}"

export SRC_CONTAINER_IMAGE_REPOSITORY_NAME='webmethods-microservicesruntime'
export SRC_CONTAINER_IMAGE_REPOSITORY_TAG='10.15.0.0'

export DST_CONTAINER_IMAGE_REPOSITORY_NAME='mock-wm-cloud-service'
export DST_CONTAINER_IMAGE_REPOSITORY_TAG='0.0.2-test'
export DST_CONTAINER_IMAGE_REPOSITORY_SUPPLEMENTAL_TAGS="${JOB_TIMESTAMP}"

export SCR_CONTAINER_IS_HOME=/opt/softwareag/IntegrationServer
