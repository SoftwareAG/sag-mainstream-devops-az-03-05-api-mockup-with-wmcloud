#!/bin/sh

. ./build/setParameters.sh

# Artifacts to pull

rm -rf /tmp/buildContext /tmp/git

mkdir -p /tmp/buildContext /tmp/git

git clone -b main --single-branch https://github.com/SoftwareAG/WxSimpleConfig.git /tmp/git/WxSimpleConfig || exit 1
git clone -b main --single-branch https://github.com/SoftwareAG/sag-mainstream-devops-az-03-03-api-mockup.git /tmp/git/ApiMockup || exit 2

mv /tmp/git/WxSimpleConfig/code/is-packages/WxSimpleConfig /tmp/buildContext/
mv /tmp/git/ApiMockup/code/is-packages/SagServiceMockup /tmp/buildContext/
