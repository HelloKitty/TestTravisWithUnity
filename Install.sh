#! /bin/sh

# Based on https://github.com/vergenzt/ci-build/blob/unity-5.3/Scripts/install.sh which updates support for 5.3 component based installer.
# Corrected for Unity's decision to change to download instead of netstorage

BASE_URL=http://download.unity3d.com/download_unity
HASH=cc9cbbcc37b4
VERSION=5.3.1f1

download() {
  file=$1
  url="$BASE_URL/$HASH/$package"

  echo "Downloading from $url: "
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  download "$package"

  echo "Installing "`basename "$package"`
  sudo installer -dumplog -package `basename "$package"` -target /
  
  #if we fail to install we should exit
  if [ $? -ne 0 ]
  then
    echo "Failed to install $package."
  	exit 1
  fi
}

# See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`

install "MacEditorInstaller/Unity-$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-$VERSION.pkg"

# After installation would should clean this up
rm Unity-$VERSION.pkg
rm UnitySetup-Windows-Support-for-Editor-$VERSION.pkg
