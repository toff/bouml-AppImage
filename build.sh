#!/bin/bash

set -e

echo "-----------------------------------------------------------------------"
echo "Removing old container image..."
podman rmi bouml-buster 2>/dev/null || true

echo "-----------------------------------------------------------------------"
echo "Building a bouml container image based on Debian buster..."
podman build . --tag bouml-buster

echo "-----------------------------------------------------------------------"
echo "Building AppImage..."
podman run --name=bouml -v .:/workspace:Z --workdir=/workspace --cap-add SYS_ADMIN --device /dev/fuse --rm -it bouml-buster ./resources/build-AppImage.sh
