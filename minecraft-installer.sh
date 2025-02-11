#!/bin/bash
sudo dnf in rpm-build wget bsdtar bash
DIR="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$DIR"
rm -r minecraft-installer
mkdir minecraft-installer
cd minecraft-installer
# Download target for specification file of minecraft-launcher
echo Downloading specification file...
sleep 1s
wget https://github.com/DarkWav/Specfile-Cloud/raw/master/minecraft-launcher.spec
clear
echo "########################################################################################################"
echo Welcome to my Minecraft installer for openSUSE and Fedora
echo .
echo Credits:
echo Mojang - for Minecraft,
echo RedHat - for RPMBuild,
echo Arch Linux - for build system,
echo DarkWav - for installer script.
echo .
echo If you wish to build a minecraft-launcher rpm package, press any key
read -n1 -r -p "########################################################################################################" key
clear
echo Starting Build...
sleep 2s
arch=x86_64
rm -r $PWD/pkg
mkdir -p $PWD/pkg
rm -r $PWD/src
mkdir -p $PWD/src
rm -r $PWD/${arch}
rpmfile=$(find . -name *.rpm)
rm rpmfile ${rpmfile}
buildrt=$PWD/pkg
specfile=$(find . -name *.spec)
rpmbuild --target ${arch} -bb ${specfile} --buildroot ${buildrt}
cd ./${arch}
rpmfile=$(find . -name *.rpm)
mkdir /tmp
cp ./${rpmfile} ../${rpmfile}
cp ./${rpmfile} /tmp/${rpmfile}
rm -r ../${arch}
cd ../
rpmfile=$(find . -name *.rpm)
clear
echo "########################################################################################################"
echo ${rpmfile} has been built successfully.
echo  "########################################################################################################"
