#!/bin/sh

echo "Running as user $(whoami)"

crtdate=$(date +%y-%m-%d'T'%H.%M.%S)
export JOB_TIMESTAMP="${JOB_TIMESTAMP:-$crtdate}"

cd /mnt/project-home || exit 1

./build/01.checkPrerequisites.sh
./build/02.getArtifacts.sh
./build/03.build.sh
./build/04.logout.sh
