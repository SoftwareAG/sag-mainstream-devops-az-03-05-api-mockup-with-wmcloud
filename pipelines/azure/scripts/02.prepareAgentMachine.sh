#!/bin/bash

# sometimes this job fails with 
# Could not get lock /var/lib/dpkg/lock-frontend. It is held by process NNNN (apt-get)
# Adding some logs for debugging, looking at file
# /var/lib/dpkg/lock-frontend

echo "lslocks"
lslocks


echo ">>>>>>>>>>>>>>>>Updating OS software"
sudo apt -y update

if [ -f /var/lib/dpkg/lock-frontend ]; then
  echo "File /var/lib/dpkg/lock-frontend exists!"
  echo "lslocks"
  lslocks
  echo "sudo ps aux | grep -i apt"
  sudo ps aux | grep -i apt
  echo "sudo lsof /var/lib/dpkg/lock-frontend"
  sudo lsof /var/lib/dpkg/lock-frontend
  echo "Seeping a bit..."
  sleep 15
fi

echo ">>>>>>>>>>>>>>>>Updating base libraries..."
sudo apt-get -qq -y update

if [ -f /var/lib/dpkg/lock-frontend ]; then
  echo "File /var/lib/dpkg/lock-frontend exists!"
  echo "sudo ps aux | grep -i apt"
  sudo ps aux | grep -i apt
  echo "sudo lsof /var/lib/dpkg/lock-frontend"
  sudo lsof /var/lib/dpkg/lock-frontend
  echo "Seeping a bit..."
  sleep 15
fi

echo ">>>>>>>>>>>>>>>>Installing prerequisites..."
sudo apt-get -qq install -y ca-certificates curl gnupg2 fuse-overlayfs
. /etc/os-release
echo "Installing buildah for OS release ${VERSION_ID}..."
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -fsL "https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add - &&

if [ -f /var/lib/dpkg/lock-frontend ]; then
  echo "File /var/lib/dpkg/lock-frontend exists!"
  echo "sudo ps aux | grep -i apt"
  sudo ps aux | grep -i apt
  echo "sudo lsof /var/lib/dpkg/lock-frontend"
  sudo lsof /var/lib/dpkg/lock-frontend
  echo "Seeping a bit..."
  sleep 15
fi

sudo apt-get -qq -y update

if [ -f /var/lib/dpkg/lock-frontend ]; then
  echo "File /var/lib/dpkg/lock-frontend exists!"
  echo "sudo ps aux | grep -i apt"
  sudo ps aux | grep -i apt
  echo "sudo lsof /var/lib/dpkg/lock-frontend"
  sudo lsof /var/lib/dpkg/lock-frontend
  echo "Seeping a bit..."
  sleep 15
fi 

echo ">>>>>>>>>>>>>>>>Installing buildah..."

sudo apt-get -qq -y install buildah
echo "Machine prepared"
