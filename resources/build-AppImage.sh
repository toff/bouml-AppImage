#!/bin/bash

set -ex

apt-get update
apt-get install --no-install-recommends -y file libfuse2 binutils libglib2.0-bin
mkdir -p build
cd build
wget --progress=bar:force:noscroll "https://github.com/AppImageCommunity/pkg2appimage/releases/download/continuous/pkg2appimage-1807-x86_64.AppImage"
chmod +x ./pkg2appimage-*.AppImage
./pkg2appimage-1807-x86_64.AppImage ../resources/bouml-AppImage.yml
