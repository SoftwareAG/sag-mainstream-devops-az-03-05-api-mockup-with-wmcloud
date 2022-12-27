#!/bin/bash

# sometimes this job fails with 
# Could not get lock /var/lib/dpkg/lock-frontend. It is held by process NNNN (apt-get)
# Adding some logs for debugging, looking at file
# /var/lib/dpkg/lock-frontend

checkLock(){
  echo "######### Checking apt lock"
  echo "######### lslocks | grep '/var/lib/dpkg/lock-frontend'"
  lslocks | grep '/var/lib/dpkg/lock-frontend'
  if ( lslocks | grep '/var/lib/dpkg/lock-frontend' ) ; then
    echo "######### File /var/lib/dpkg/lock-frontend already locked!"
    echo "######### lslocks"
    lslocks
    echo "######### sudo ps aux | grep -i apt"
    sudo ps aux | grep -i apt
    echo "######### sudo lsof /var/lib/dpkg/lock-frontend"
    sudo lsof /var/lib/dpkg/lock-frontend
    echo "######### Seeping a bit..."
    sleep 15
  else
    echo "######### apt lock is not present, continuing..."
  fi  
}


echo ">>>>>>>>>>>>>>>> Updating OS software"
checkLock
sudo apt -y update

echo ">>>>>>>>>>>>>>>> Updating base libraries..."
checkLock
sudo apt-get -qq -y update

echo ">>>>>>>>>>>>>>>> Installing prerequisites..."
checkLock
sudo apt-get -qq install -y ca-certificates curl gnupg2 fuse-overlayfs
# shellcheck disable=1091
. /etc/os-release
echo "Installing buildah for OS release ${VERSION_ID}..."
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -fsL "https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add - &&

echo ">>>>>>>>>>>>>>>> Updating base libraries again..."
checkLock
sudo apt-get -qq -y update

echo ">>>>>>>>>>>>>>>> Installing buildah..."
checkLock
sudo apt-get -qq -y install buildah

echo ">>>>>>>>>>>>>>>> Machine prepared"
